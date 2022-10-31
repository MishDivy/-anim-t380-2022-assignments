import json
import os
from pathlib import Path
import hou
import argparse


def create_json(package: Path) -> None:
    """Creates the JSON package file for adding Environement Variables in Hoduini for the Baker tool.

    Args:
        package (Path): Absolute Path to the substance_baker_houdini folder.
    """

    package_data = {
        "env": [
            {
                "FastBaker": str(package)
            }
        ],
        "path": "$FastBaker"
    }

    output_file = Path(hou.homeHoudiniDirectory()) / \
        'packages' / 'fast_baker.json'

    with open(str(output_file), 'w') as f:
        json.dump(package_data, f, indent=4)


def main() -> None:
    parser = argparse.ArgumentParser(
        description='Creates Baker Package JSON for Houdini.')
    parser.add_argument('package_dir', type=str,
                        help='File path of the package.')

    args = parser.parse_args()

    create_json(Path(args.package_dir))


if __name__ == '__main__':
    main()
