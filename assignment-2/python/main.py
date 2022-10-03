from procedural_animation import ProceduralSystem, BIN_DIR, MAYA_OUTPUT_FILE
from animation import Animation
import math
import argparse

EXPRESSIONS = {0: lambda x, y: 0,
               1: lambda x, y: math.sin(x) + math.cos(x),
               2: lambda x, y: math.sqrt(x*x + y*y)/2,
               3: lambda x, y: math.sin(math.atan2(y, x)*5)}


def create_animation(amp: float, freq: float, speed: float, index: int) -> Animation:
    anim = Animation(amp, freq, speed)

    animations = BIN_DIR.parent / 'ui' / 'animations.txt'
    animation_expr = None
    total_anims = None
    with open(animations, 'r') as f:
        animation_expr = f.readlines()
        total_anims = len(animation_expr)

    anim.set_anim(animation_expr[index % total_anims])

    return anim


def setup_cli_parser() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description='This tool creates 3D plots of Mathematical Functions.')
    parser.add_argument('function_index', type=int,
                        help='Index of the Mathematical Function from alist of functions.')
    parser.add_argument('animation_index', type=int,
                        help='Index of the Animation applied from a list of Animations.')
    parser.add_argument('--color_r', type=float,
                        help='Red Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--color_g', type=float,
                        help='Green Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--color_b', type=float,
                        help='Blue Channel of color of the mesh material. Ranges between 0.0 and 1.0.')
    parser.add_argument('--amp', type=float,
                        help='Amplitude of the Animation Function.')
    parser.add_argument('--freq', type=float,
                        help='Frequency of the Animation Function.')
    parser.add_argument('--speed', type=float,
                        help='Speed of the Animation Function.')
    parser.add_argument('--limit_x', type=float,
                        help='Bounds in the direction of X Axis for the function.')
    parser.add_argument('--limit_z', type=float,
                        help='Bounds in the direction of Z Axis for the function.')

    args = parser.parse_args()
    return args


def main() -> None:

    args = setup_cli_parser()

    color = []
    if args.color_r:
        color.append(args.color_r)
    else:
        color.append(0.2)
    if args.color_g:
        color.append(args.color_g)
    else:
        color.append(0.5)
    if args.color_b:
        color.append(args.color_b)
    else:
        color.append(0.8)

    amp = freq = speed = 1.0
    if args.amp:
        amp = args.amp
    if args.freq:
        freq = args.freq
    if args.speed:
        speed = args.speed

    limit_x = limit_z = 10.0
    if args.limit_x:
        limit_x = args.limit_x
    if args.limit_z:
        limit_z = args.limit_z

    anim = create_animation(amp, freq, speed, args.animation_index)
    ProceduralSystem(EXPRESSIONS[args.function_index % len(EXPRESSIONS.keys())],
                     anim, color, limits=[limit_x, limit_z, limit_z])


if __name__ == '__main__':
    main()
    print(f'{MAYA_OUTPUT_FILE} Saved Successfully!')
