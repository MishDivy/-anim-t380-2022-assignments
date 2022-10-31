from pathlib import Path
import hou
import os
import argparse
import shutil


def setup_cli_parser() -> argparse.Namespace:
    """Returns a Namespace object with all the arugements that are asked from the user."""

    parser = argparse.ArgumentParser(
        description='Pipeline testing tool.')

    parser.add_argument('--seed', type=float, default=1234.0,
                        help="Global Seed for mesh generation.")
    parser.add_argument('--num_meshes', type=int, default=10,
                        help="Number of random meshes to be created.")
    parser.add_argument('-d', '--delete', type=int, default=0,
                        help="Set this arguement to 1 if you want to delete intermediate files.")

    parser.add_argument('-r', '--output_res', type=int, default=10,
                        help="Output Texture resolution of the baked texture. 10 = 1024, 11 = 2048, 12 = 4096 etc.")

    args = parser.parse_args()
    return args


def delete_intermediaries() -> None:
    intermediate = Path(os.getcwd()).parent / 'bin' / 'geo' / 'intermediaries'
    for dir in intermediate.iterdir():
        shutil.rmtree(dir)


def set_variables(seed: float = 123, num_objects: int = 10, tex_res: int = 10) -> None:

    wedge = hou.node('/tasks/topnet1/Wedge')
    substance_baker = hou.node('/tasks/topnet1/SubstanceBaker')

    wedge.parm('wedgecount').set(num_objects)
    wedge.parm('seed').set(seed)

    substance_baker.parm('out_res').set(tex_res)


def main() -> None:

    args = setup_cli_parser()
    direct = Path(os.getcwd()).parent / 'bin'
    file = direct / 'Pipeline.hipnc'
    first_file = hou.hipFile
    first_file.load(str(file))

    set_variables(args.seed, args.num_meshes, args.output_res)

    out_node = hou.node('/tasks/topnet1/SubstanceBaker')
    out_node.dirtyAllWorkItems(True)
    out_node.cookOutputWorkItems(block=True)

    if args.delete:
        delete_intermediaries()


if __name__ == '__main__':

    main()
