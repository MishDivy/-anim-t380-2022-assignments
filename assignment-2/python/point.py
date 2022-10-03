import math
from dataclasses import dataclass


@dataclass
class Point:
    x: float
    y: float
    z: float = 0.0

    def distance(self, point=None) -> float:
        if point is None:
            point = Point(0.0, 0.0, 0.0)
        return math.sqrt((self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2)

    def distance2(self, point=None) -> float:
        if point is None:
            point = Point(0.0, 0.0, 0.0)
        return (self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2
