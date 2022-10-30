# import hou
import os
from collections.abc import Iterable
from pysbs import batchtools
from pathlib import Path
import logging
from class_utils import SDGEnum, wait_for_substance_engine, InvalidTypeError, SubstanceEngineError


def bake_mesh_maps(mesh: Path, tex_out: Path, maps: Iterable[SDGEnum.MeshMaps], output_resolution: int = 11, high_poly_bake: bool = False, high_poly_mesh: Path = None) -> None:

    if not mesh.is_file():
        raise FileNotFoundError(f'Cannot find {str(mesh)} file.')
    if not tex_out.is_dir():
        os.makedirs(str(tex_out))

    baker_dict = {SDGEnum.MeshMaps.AO: [batchtools.sbsbaker_ambient_occlusion, batchtools.sbsbaker_ambient_occlusion_from_mesh],
                  SDGEnum.MeshMaps.COLOR: [None, batchtools.sbsbaker_color_from_mesh],
                  SDGEnum.MeshMaps.CURVATURE: [batchtools.sbsbaker_curvature, batchtools.sbsbaker_curvature_from_mesh],
                  SDGEnum.MeshMaps.HEIGHT: [None, batchtools.sbsbaker_height_from_mesh],
                  SDGEnum.MeshMaps.NORMAL: [None, batchtools.sbsbaker_normal_from_mesh],
                  SDGEnum.MeshMaps.OPACITY: [None, batchtools.sbsbaker_opacity_mask_from_mesh],
                  SDGEnum.MeshMaps.POSITION: [batchtools.sbsbaker_position, batchtools.sbsbaker_position_from_mesh],
                  SDGEnum.MeshMaps.THICKNESS: [None, batchtools.sbsbaker_thickness_from_mesh],
                  SDGEnum.MeshMaps.WSN: [batchtools.sbsbaker_normal_world_space, None]}

    for map in maps:

        if not high_poly_bake:
            bake_func = baker_dict[map][0]
            if bake_func:
                logger.info(f'Baking {map.name}...')
                bake_func(str(mesh),
                          output_size=[output_resolution,
                                       output_resolution],
                          output_path=str(tex_out),
                          output_name=f'{mesh.stem}_{map.name}').wait()
            else:
                raise NotImplementedError(
                    f'Low Poly baking is unavailable for {map.name} map. Try high poly baking.')

        elif high_poly_bake:
            bake_func = baker_dict[map][1]
            if bake_func and high_poly_mesh:
                logger.info(f'Baking {map.name}...')
                bake_func(str(mesh),
                          highdef_mesh=str(high_poly_mesh),
                          output_size=[output_resolution,
                                       output_resolution],
                          output_path=str(tex_out),
                          output_name=f'{mesh.stem}_{map.name}').wait()

            else:
                raise NotImplementedError(
                    f'High Poly baking is unavailable for {map.name} map. Try low poly baking or changing the path to a valid high ppoly mesh.')


if __name__ == '__main__':

    logging.basicConfig(
        format='%(asctime)s: %(name)-15s: %(levelname)s: %(message)s')

    logger = logging.getLogger('Substance-Houdini-Baker')
    logger.setLevel(logging.DEBUG)
