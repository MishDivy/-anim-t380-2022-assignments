import math
from dataclasses import dataclass


@dataclass
class Point:
    """This class provides a structure to hold Cartesian Co-ordinate points. 
    It also contains utility methods to for calculation on points in 3D."""

    x: float
    y: float
    z: float = 0.0

    def distance(self, point=None) -> float:
        """Returns the distance between the current point and the given point."""

        if point is None:
            point = Point(0.0, 0.0, 0.0)
        return math.sqrt((self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2)

    def distance2(self, point=None) -> float:
        """Returns squared distance between the current point and the give point."""

        if point is None:
            point = Point(0.0, 0.0, 0.0)
        return (self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2
