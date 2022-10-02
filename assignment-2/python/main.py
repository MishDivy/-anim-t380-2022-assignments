from point import Point
from pathlib import Path
import numpy as np
from typing import Callable, Union, List
import math
import maya.cmds as cmds
import maya.standalone
maya.standalone.initialize()

BIN_DIR = Path(__file__).parent.parent.joinpath('bin')
MAYA_OUTPUT_FILE = BIN_DIR.joinpath('Test.ma')


def get_polar_points(expression: Callable, resample_distance: float = 1.0, limits: List[float] = [10.0, 10.0, 10.0]) -> List[Point]:
    points = []
    for x in np.arange(-limits[0], limits[0], resample_distance):
        for y in np.arange(-limits[1], limits[1], resample_distance):
            # for z in np.arange(-limits[2], limits[2], resample_distance):
            points.append(Point(x, expression(x, y), y))
    return points


def move_mesh_to_point(mesh_object: str, point: Point) -> None:
    cmds.select(mesh_object)
    cmds.move(point.x, point.y, point.z)


def create_custom_locator(point: Point = None, high_poly: bool = False) -> Union[str, None]:
    atom_mesh = create_mesh(high_poly)
    if point:
        move_mesh_to_point(atom_mesh, point)
    if apply_material(atom_mesh):
        return atom_mesh
    return None


def create_instance(prototype: str, point: Point) -> str:
    cmds.select(prototype)
    instance = cmds.instance()
    if point:
        move_mesh_to_point(instance[0], point)
    return instance[0]


def create_mesh(high_poly=False) -> str:
    cube = cmds.polyCube()
    cmds.select(cube[0])

    cmds.polyBevel3(cube[0], fraction=0.9, offsetAsFraction=True, autoFit=True, depth=-0.7, mitering=0, miterAlong=0, chamfer=1, segments=5,
                    worldSpace=1, smoothingAngle=30, subdivideNgons=1, mergeVertices=1, mergeVertexTolerance=0.0001, miteringAngle=180, angleTolerance=180, ch=1)

    if high_poly:
        cmds.polyBevel3(cube[0], fraction=0.5, offsetAsFraction=1, autoFit=1, depth=1, mitering=0, miterAlong=0, chamfer=1, segments=3, worldSpace=1,
                        smoothingAngle=30, subdivideNgons=1, mergeVertices=1, mergeVertexTolerance=0.0001, miteringAngle=180, angleTolerance=180, ch=1)

    return cube[0]


def apply_material(mesh_object: str) -> bool:
    if cmds.objExists(mesh_object):
        shader = cmds.shadingNode(
            'lambert', name=f'{mesh_object}_lambert', asShader=True)
        shd_SG = cmds.sets(name=f'{shader}SG', empty=True,
                           renderable=True, noSurfaceShader=True)
        cmds.connectAttr(f'{shader}.outColor', f'{shd_SG}.surfaceShader')
        cmds.sets(mesh_object, e=True, forceElement=shd_SG)
        cmds.setAttr(f'{shader}.color',
                     0.1368, 0.8, 0.763601, type='double3')
        return True
    return False


def get_SG_from_existing_shader(shader=None) -> Union[str, None]:

    if not shader or not cmds.objExists(shader):
        return None
    SG_queue = cmds.listConnections(shader, d=True, et=True, t='shadingEngine')
    if SG_queue:
        return SG_queue[0]
    return None


def save_file_to_disk() -> None:

    if (MAYA_OUTPUT_FILE.is_file()):
        MAYA_OUTPUT_FILE.unlink()

    cmds.file(rename=str(MAYA_OUTPUT_FILE))
    cmds.file(save=True, type='mayaAscii')


def main() -> None:

    points = get_polar_points(lambda x, y: math.sin(x) + math.cos(y), 0.5)
    print(len(points))
    proto = create_custom_locator(Point(0, 0, 0), True)
    for point in points:
        # create_custom_locator(point)
        create_instance(proto, point)

    save_file_to_disk()


if __name__ == '__main__':
    main()
