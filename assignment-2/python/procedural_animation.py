from point import Point
from animation import Animation
from pathlib import Path
import numpy as np
from typing import Callable, Union, List
import maya.cmds as cmds
import maya.standalone
maya.standalone.initialize()

BIN_DIR = Path(__file__).parent.parent.joinpath('bin')
MAYA_OUTPUT_FILE = BIN_DIR.joinpath('Procedural_Animation.ma')


class ProceduralSystem:

    def __init__(self, layout_expression: Callable, anim: Animation, color: List[float] = None, resample_dist: float = 0.5, limits: List[float] = [10, 10, 10], high_poly: bool = True) -> None:

        self.layout_expression = layout_expression
        self.anim = anim
        self.color = color
        self.resample_dist = resample_dist
        self.limits = limits
        self.high_poly = high_poly
        self.points = self.get_points_from_expression()

        # TODO: Create Getters and Setters for Class Member Variable to avoid errors if user tries to change members after construction.

        proto = self.create_custom_locator('proto_cube', Point(0, 0, 0))
        group_name = 'Procedural_Animation'
        cmds.group(proto, n=group_name)

        for point in self.points:
            instance = self.create_instance(proto, point)
            self.anim.mesh_loc = point
            self.anim.mesh_object = instance

            cmds.expression(
                s=self.anim.get_anim())

        cmds.setAttr(f'{proto}.visibility', 0)

        self.save_file_to_disk()

    def get_points_from_expression(self) -> List[Point]:

        points = []
        for x in np.arange(-self.limits[0], self.limits[0], self.resample_dist):
            for y in np.arange(-self.limits[1], self.limits[1], self.resample_dist):
                points.append(Point(x, self.layout_expression(x, y), y))
        return points

    @ staticmethod
    def move_mesh_to_point(mesh_object: str, point: Point) -> None:
        cmds.select(mesh_object)
        cmds.move(point.x, point.y, point.z)

    def create_custom_locator(self, name=None, point: Point = None) -> Union[str, None]:

        atom_mesh = self.create_mesh(name)
        if point:
            self.move_mesh_to_point(atom_mesh, point)
        material_success = self.apply_material(atom_mesh)
        if material_success:
            return atom_mesh
        return None

    def create_instance(self, prototype: str, point: Point) -> str:

        cmds.select(prototype)
        instance = cmds.instance()
        if point:
            self.move_mesh_to_point(instance[0], point)
        return instance[0]

    def create_mesh(self, name=None) -> str:

        cube = cmds.polyCube(n=name) if name else cmds.polyCube()
        cmds.select(cube[0])

        cmds.polyBevel3(cube[0], fraction=0.9, offsetAsFraction=True, autoFit=True, depth=-0.7, mitering=0, miterAlong=0, chamfer=1, segments=5,
                        worldSpace=1, smoothingAngle=30, subdivideNgons=1, mergeVertices=1, mergeVertexTolerance=0.0001, miteringAngle=180, angleTolerance=180, ch=1)

        if self.high_poly:
            cmds.polyBevel3(cube[0], fraction=0.5, offsetAsFraction=1, autoFit=1, depth=1, mitering=0, miterAlong=0, chamfer=1, segments=3, worldSpace=1,
                            smoothingAngle=30, subdivideNgons=1, mergeVertices=1, mergeVertexTolerance=0.0001, miteringAngle=180, angleTolerance=180, ch=1)

        return cube[0]

    def apply_material(self, mesh_object: str) -> bool:

        if cmds.objExists(mesh_object):
            shader = cmds.shadingNode(
                'lambert', name=f'{mesh_object}_lambert', asShader=True)
            shd_SG = cmds.sets(name=f'{shader}SG', empty=True,
                               renderable=True, noSurfaceShader=True)
            cmds.connectAttr(f'{shader}.outColor', f'{shd_SG}.surfaceShader')
            cmds.sets(mesh_object, e=True, forceElement=shd_SG)
            color = [0.1368, 0.8, 0.763601]
            if self.color:
                color = self.color
            cmds.setAttr(f'{shader}.color',
                         color[0], color[1], color[2], type='double3')
            return True
        return False

    @ staticmethod
    def get_SG_from_existing_shader(shader=None) -> Union[str, None]:

        if not shader or not cmds.objExists(shader):
            return None
        SG_queue = cmds.listConnections(
            shader, d=True, et=True, t='shadingEngine')
        if SG_queue:
            return SG_queue[0]
        return None

    @ staticmethod
    def save_file_to_disk() -> None:

        if (MAYA_OUTPUT_FILE.is_file()):
            MAYA_OUTPUT_FILE.unlink()

        cmds.file(rename=str(MAYA_OUTPUT_FILE))
        cmds.file(save=True, type='mayaAscii')

    def __str__(self) -> str:
        return f'Total instances {len(self.points)}'
