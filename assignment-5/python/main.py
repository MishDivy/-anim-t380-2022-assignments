from procedural_animation import ProceduralSystem, BIN_DIR, MAYA_OUTPUT_FILE
from animation import Animation
import math
import argparse

# Dictionary that conatains all the layout functions.
EXPRESSIONS = {0: lambda x, y: 0,
               1: lambda x, y: math.sin(x) + math.cos(x),
               2: lambda x, y: math.sqrt(x*x + y*y)/2,
               3: lambda x, y: math.sin(math.atan2(y, x)*5)}


def create_animation(amp: float, freq: float, speed: float, index: int) -> Animation:
    """Read Animation Expression from the text file and constructs an Animation object.
    Returns an Animation object."""

    anim = Animation(amp, freq, speed)

    animations = BIN_DIR.parent / 'var' / 'animations.txt'
    animation_expr = None
    total_anims = None
    with open(animations, 'r') as f:
        animation_expr = f.readlines()
        total_anims = len(animation_expr)

    anim.set_anim(animation_expr[index % total_anims])

    return anim


def setup_cli_parser() -> argparse.Namespace:
    """Returns a Namespace object with all the arugements that are asked from the user."""

    parser = argparse.ArgumentParser(
        description='This tool creates 3D plots of Mathematical Functions.')
    parser.add_argument('function_index', type=int,
                        help='Index of the Mathematical Function from alist of functions.')
    parser.add_argument('animation_index', type=int,
                        help='Index of the Animation applied from a list of Animations.')
    parser.add_argument('--color_r', type=float, default=0.2,
                        help='Red Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--color_g', type=float, default=0.5,
                        help='Green Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--color_b', type=float, default=0.8,
                        help='Blue Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--amp', type=float, default=1.0,
                        help='Amplitude of the Animation Function.')
    parser.add_argument('--freq', type=float, default=1.0,
                        help='Frequency of the Animation Function.')
    parser.add_argument('--speed', type=float, default=1.0,
                        help='Speed of the Animation Function.')
    parser.add_argument('--limit_x', type=float, default=10.0,
                        help='Bounds in the direction of X Axis for the function.')
    parser.add_argument('--limit_z', type=float, default=10.0,
                        help='Bounds in the direction of Z Axis for the function.')

    args = parser.parse_args()
    return args


def create_from_gui(func_index: int, anim_index: int) -> None:

    anim = create_animation(1.0, 1.0, 1.0, anim_index)
    ProceduralSystem(EXPRESSIONS[func_index % len(EXPRESSIONS.keys())],
                     anim, [0.2, 0.5, 0.8], limits=[10.0, 10.0, 10.0])


def main() -> None:

    args = setup_cli_parser()

    # Create the Animation Object
    anim = create_animation(args.amp, args.freq,
                            args.speed, args.animation_index)

    # Constructs the Procedural System
    ProceduralSystem(EXPRESSIONS[args.function_index % len(EXPRESSIONS.keys())],
                     anim, [args.color_r, args.color_g, args.color_b], limits=[args.limit_x, args.limit_z, args.limit_z])


if __name__ == '__main__':
    main()
    print(f'{MAYA_OUTPUT_FILE} Saved Successfully!')
