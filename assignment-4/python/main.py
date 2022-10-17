from pathlib import Path
import maya.cmds as cmds
import os
from typing import Union

ASSET_NAME = os.getenv('asset')
ASSET_TYPE = os.getenv('assetType')
PROJECT_DIR = Path(os.getenv('project'))
USER = os.getenv('USERNAME')


class EnvironmentVariablesNotFound(Exception):
    def __init__(self, message: str = 'Environment variables not found. Please set the environment variables for the asset through powershell script or manually.') -> None:
        super().__init__(message)


def save_file_to_disk(path: Union[Path, str]) -> None:

    cmds.file(rename=str(path))
    cmds.file(f=True, save=True, options="v=0;")


def is_file_name_valid(file_name: str) -> bool:
    elements = file_name.split('.')
    if len(elements) == 4 and elements[-1].isdigit():
        return True
    return False


def get_default_save_path() -> Path:
    return PROJECT_DIR / f'{ASSET_NAME}.{ASSET_TYPE}.{USER}.1.ma'


def get_subsequent_save_path() -> Path:

    current_save_dir = cmds.file(q=True, sn=True)
    current_save_dir = Path(current_save_dir)
    current_name = current_save_dir.stem

    if not is_file_name_valid(current_name):

        print('Current file name is invalid. Saving file with a valid name.')
        return get_default_save_path()

    current_version = current_save_dir.stem.split('.')[-1]
    new_file_name = current_save_dir.stem.replace(
        current_version, str(int(current_version) + 1))
    return current_save_dir.parent / f'{new_file_name}.ma'


def main() -> None:

    if any([ASSET_NAME, ASSET_TYPE, USER, PROJECT_DIR]) is None:
        raise EnvironmentVariablesNotFound(
        )

    is_saved_atleast_once = cmds.file(q=True, ex=True)

    new_save_path = get_subsequent_save_path(
    ) if is_saved_atleast_once else get_default_save_path()

    print(new_save_path)
    save_file_to_disk(str(new_save_path))


if __name__ == '__main__':
    main()
