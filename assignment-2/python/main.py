from procedural_animation import ProceduralSystem, BIN_DIR
from animation import Animation
from typing import Callable, Union, List
import math

EXPRESSIONS = {0: lambda x, y: 0,
               1: lambda x, y: math.sin(x) + math.cos(x),
               2: lambda x, y: math.sqrt(x*x + y*y)/2,
               3: lambda x, y: math.sin(math.atan2(y, x)*5)}


def create_animation(amp: float, freq: float, speed: float, index: int) -> Animation:
    anim = Animation(amp, freq, speed)

    animations = BIN_DIR.parent / 'ui' / 'animations.txt'
    animation_expr = None
    with open(animations, 'r') as f:
        animation_expr = f.readlines()

    anim.set_anim(animation_expr[index])

    return anim


def main() -> None:

    anim = create_animation(amp=1.0, freq=2.0, speed=3.0, index=0)
    ProceduralSystem(EXPRESSIONS[0],
                     anim, [0.2, 0.3, 0.8])


if __name__ == '__main__':
    main()
