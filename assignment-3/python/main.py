import os
from pathlib import Path
import argparse
import maya.cmds as cmds
import maya.standalone
maya.standalone.initialize()

ASSET = os.getenv('asset')


def save_file_to_disk(file: Path) -> None:
    """Save the current dirty file in memory to disk."""

    if (file.is_file()):
        file.unlink()

    cmds.file(rename=str(file))
    cmds.file(save=True, type='mayaAscii')


def setup_input() -> argparse.Namespace:
    """Returns a Namespace object with all the arugements that are asked from the user."""

    parser = argparse.ArgumentParser(
        description='Create a basic Maya Setup Project using asset Environemnt Variable.')
    parser.add_argument('--root_path', type=str, default=os.getcwd(),
                        help='Root Project Path.')
    parser.add_argument('--file_name', type=str, default=ASSET,
                        help='Maya file name without extension.')
    return parser.parse_args()


def setup_maya_project(root_path: Path, file_name: str) -> None:
    """Create a Maya Project with an empty group"""

    asset_dir = Path(root_path)/'assets'/ASSET/'maya'/'scenes'

    if not asset_dir.is_dir():
        os.makedirs(asset_dir)

    cmds.group(em=True, n=ASSET)

    file_name = Path(f'{file_name}.ma')
    save_file_to_disk(asset_dir/file_name)


def main() -> None:

    args = setup_input()
    setup_maya_project(args.root_path, args.file_name)


if __name__ == '__main__':
    main()
