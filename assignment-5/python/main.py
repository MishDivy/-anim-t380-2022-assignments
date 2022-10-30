from pathlib import Path
import hou
import os
from typing import Union
# from dotenv import load_dotenv, find_dotenv

# # Load Project Specific Environment Variables
# load_dotenv(find_dotenv())


# def Test() -> None:
#     dir = Path(__file__).parent.parent / 'bin'
#     file = dir / 'Test.hipnc'

#     first_file = hou.hipFile
#     first_file.load(str(file))

#     for node in hou.node('/obj').children():
#         print(node)

#     second_file = hou.hipFile
#     second_file.load(str(dir / 'Test2.hipnc'))

#     for node in hou.node('/obj').children():
#         print(node)

#     first_file.load(str(file))

#     for node in hou.node('/obj').children():
#         print(node)


def main() -> None:
    direct = Path(__file__).parent.parent / 'bin'
    file = direct / 'Test.hipnc'
    first_file = hou.hipFile
    first_file.load(str(file))

    hda_processor = hou.node('/tasks/topnet1/HDAProcessor')
    hda_processor.dirtyAllWorkItems(True)
    hda_processor.cookOutputWorkItems(block=True)
    print(hda_processor.getCookState(True))


if __name__ == '__main__':

    main()
