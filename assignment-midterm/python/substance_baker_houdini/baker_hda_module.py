from pathlib import Path
import subprocess
import time


def bake(kwargs) -> None:
    """Bake selected Texture Maps from the input low poly and high poly (optional) meshes to disk

    Args:
        kwargs (dict): Houdini Dictionary for getting the current instance of HDA Node.
    """
    node = kwargs['node']

    rop_low_poly = node.node('rop_low_poly')
    rop_high_poly = node.node('rop_high_poly')

    py_file = node.parm('baker_entry').evalAsString()
    out_dir = node.parm('out_dir').evalAsString()
    temp_dir = Path(node.parm('temp_dir').evalAsString())
    tex_prefix = node.parm('tex_prefix').evalAsString()

    h2l = node.parm('h2l').evalAsInt()
    out_res = node.parm('out_res').evalAsInt() + 10
    cu = node.parm('cu').evalAsInt()
    ao = node.parm('ao').evalAsInt()
    hi = node.parm('hi').evalAsInt()
    nm = node.parm('nm').evalAsInt()
    op = node.parm('op').evalAsInt()
    p = node.parm('p').evalAsInt()
    th = node.parm('th').evalAsInt()
    wsn = node.parm('wsn').evalAsInt()
    co = node.parm('co').evalAsInt()

    if h2l:
        hi = nm = op = th = wsn = 0
        high_poly_mesh = temp_dir / 'high_poly.fbx'
        rop_high_poly.parm('sopoutput').set(str(high_poly_mesh))
        rop_high_poly.parm('execute').pressButton()
    else:
        co = 0

    low_poly_mesh = temp_dir / (tex_prefix + '.fbx')
    rop_low_poly.parm('sopoutput').set(str(low_poly_mesh))
    rop_low_poly.parm('execute').pressButton()

    command = ["hython", "-i",
               py_file,
               str(low_poly_mesh),
               out_dir,
               "-cu", str(cu),
               "-ao", str(ao),
               "-hi", str(hi),
               "-nm", str(nm),
               "-op", str(op),
               "-p", str(p),
               "-th", str(th),
               "-wsn", str(wsn),
               "-co", str(co),
               "-r", str(out_res)]

    if h2l:
        command.append("-hp")
        command.append(str(high_poly_mesh))

    time.sleep(4)
    subprocess.run(command)
