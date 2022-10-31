import os
from collections.abc import Iterable
from pysbs import batchtools
from pathlib import Path
from class_utils import SDGEnum, wait_for_substance_engine, logger


def bake_mesh_maps(mesh: Path, tex_out: Path, maps: SDGEnum.MeshMaps, output_resolution: int = 11, high_poly_bake: bool = False, high_poly_mesh: Path = None) -> None:
    """Bakes texture maps to disk for a given mesh.

    Args:
        mesh (Path): Path to the mesh file.
        tex_out (Path): Output Texture Directory
        maps (SDGEnum.MeshMaps): List of Texture Sets that needs to be baked.
        output_resolution (int, optional): Output Resolution of the textures. Defaults to 11.
        high_poly_bake (bool, optional): Should it bake from high poly to low poly. Defaults to False.
        high_poly_mesh (Path, optional): Path to the High Poly Mesh. Defaults to None.

    Raises:
        FileNotFoundError: Given path for a file is incorrect or broken.
        NotImplementedError: Functionaly doesn't exists on the Substance Tooling
    """

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

                img_path = tex_out / f'{mesh.stem}_{map.name}.png'
                wait_for_substance_engine(lambda img_path: Path(img_path).is_file(),
                                          f'Texture map: {map.name} Baked Successfully!',
                                          f'Cannot bake map: {map.name} the texture map.',
                                          wait_interval=0.2,
                                          img_path=img_path)
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

                img_path = tex_out / f'{mesh.stem}_{map.name}.png'
                wait_for_substance_engine(lambda img_path: Path(img_path).is_file(),
                                          f'Texture map: {map.name} Baked Successfully!',
                                          f'Cannot bake map: {map.name} the texture map.',
                                          wait_interval=0.2,
                                          img_path=img_path)

            else:
                raise NotImplementedError(
                    f'High Poly baking is unavailable for {map.name} map. Try low poly baking or changing the path to a valid high ppoly mesh.')
