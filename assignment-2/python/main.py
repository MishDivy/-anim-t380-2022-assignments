from procedural_animation import ProceduralSystem
from anim_controller import AnimationController
from typing import Callable, Union, List
import math


def main() -> None:

    anim_controller = AnimationController(1.0, 2.0, 3.0)
    ProceduralSystem(lambda x, y: math.sqrt(x*x + y*y),
                     anim_controller, [0.6, 0.3, 0.8])


if __name__ == '__main__':
    main()
