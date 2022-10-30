import hou
from pathlib import Path

hda_path = Path(hou.findFile('fast_baker.py')).parent.parent.parent / \
    'bin' / 'otls' / 'substance_baker.hdanc'

hou.hda.installFile(str(hda_path))
