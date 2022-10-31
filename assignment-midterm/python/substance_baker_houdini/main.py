from pathlib import Path
from class_utils import SDGEnum
from fast_baker import bake_mesh_maps
import argparse
import os


def setup_cli_parser() -> argparse.Namespace:
    """Returns a Namespace object with all the arugements that are asked from the user."""

    parser = argparse.ArgumentParser(
        description='This tool uses Substance Atumation Toolkit to bake texture maps.')
    parser.add_argument('mesh', type=str,
                        help='File path of the mesh file.')
    parser.add_argument('output_dir', type=str,
                        help='Output Directory for the textures.')

    parser.add_argument('-cu', '--curvature', type=int, default=0,
                        help="Bake Curvature Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-ao', '--ambient_occlusion', type=int, default=0,
                        help="Bake AO Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-co', '--color', type=int, default=0,
                        help="Bake Color Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-hi', '--height', type=int, default=0,
                        help="Bake Height Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-nm', '--normal', type=int, default=0,
                        help="Bake Normal Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-op', '--opacity', type=int, default=0,
                        help="Bake Opacity Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-p', '--position', type=int, default=0,
                        help="Bake Position Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-wsn', '--world_space_normal', type=int, default=0,
                        help="Bake World Space Normal Map. Set it to 1 for True, on default it won't bake.")
    parser.add_argument('-th', '--thickness', type=int, default=0,
                        help="Bake Thickness Map. Set it to 1 for True, on default it won't bake.")

    parser.add_argument('-hp', '--high_poly_mesh', type=str, default=0,
                        help="Mesh file path of High poly mesh for High Poly To Low Poly bake.")

    parser.add_argument('-r', '--output_res', type=int, default=11,
                        help="Output Texture resolution of the baked texture.")

    args = parser.parse_args()
    return args

def main() -> None:
    """Entry point for Substance Baker.
    """

    args = setup_cli_parser()

    mesh = Path(args.mesh)
    tex_out = Path(args.output_dir)

    cli_mapping = {SDGEnum.MeshMaps.CURVATURE: args.curvature,
                   SDGEnum.MeshMaps.AO: args.ambient_occlusion,
                   SDGEnum.MeshMaps.COLOR: args.color,
                   SDGEnum.MeshMaps.HEIGHT: args.height,
                   SDGEnum.MeshMaps.NORMAL: args.normal,
                   SDGEnum.MeshMaps.OPACITY: args.opacity,
                   SDGEnum.MeshMaps.POSITION: args.position,
                   SDGEnum.MeshMaps.WSN: args.world_space_normal,
                   SDGEnum.MeshMaps.THICKNESS: args.thickness}

    maps = [key for key, val in cli_mapping.items() if val != 0]
    if (args.high_poly_mesh != 0):
        high_poly_bake = True
        high_poly_mesh = args.high_poly_mesh
    else:
        high_poly_bake = False
        high_poly_mesh = None

    bake_mesh_maps(mesh, tex_out, maps, args.output_res,
                   high_poly_bake, high_poly_mesh)

    os.unlink(mesh)
    if high_poly_mesh:
        os.unlink(high_poly_mesh)



if __name__ == '__main__':
    main()
    