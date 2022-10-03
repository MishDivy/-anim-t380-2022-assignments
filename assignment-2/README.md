# Procedural Animation System

## Description

This tool provides a way to visualize mathematical functions in 3D. It allows you to choose a mathematical function in two independent variables x and y from a list of predefined function, and the result is plotted on the z axis. 

Another function can be layered on top as an animation.
The tool outputs the Maya file as bin/Procedural_Animation.ma

## Arguements

- `function_index`: This is a mandatory arguement which is used to choose a mathematical function from a list of predefined functions.

- `animation_index`: This is a mandatory arguement which is used to choose a mathematical function from a list of predefined functions for adding animation on top of the original function.

- `--color_r`: This sets the red channel of color of all the meshes or instances in the scene.

- `--color_g`: This sets the green channel of color of all the meshes or instances in the scene.

- `--color_b`: This sets the blue channel of color of all the meshes or instances in the scene.

- `--amp`: This argument adds a multiplier to the maximum displacement of the animation function. In other words, sets the **Amplitude** of the animation function.

- `--freq`: This argument adds a multiplier to the number of oscillations in a  second of the animation function. In other words, sets the **Frequency** of the animation function.

- `--speed`: This argument adds a multiplier to the time of the animation function. In other words, sets the **Speed** of the animation function.

- `--limit_x`: This sets the bounds of the total system in the X Direction. Nothing will be spawned before -limit_x or after +limit_x on the X Axis.

- `--limit_z`: This sets the bounds of the total system in the Z Direction. Nothing will be spawned before -limit_z or after +limit_z on the Z Axis.

## Examples

- mayapy main.py 0 0 --color_r 0.3 --color_g 0.2 --color_b 0.6

The above command will generate the output shown below:

![Example 1](bin/playblasts/Example_1.gif)

- mayapy main.py 1 2 --color_r 0.35 --color_g 0.5 --color_b 0.8 --limit_x 20.0 --speed 4.0

The above command will generate the output shown below:

![Example 1](bin/playblasts/Example_2.gif)



