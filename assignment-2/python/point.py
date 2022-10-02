import math
from dataclasses import dataclass


@dataclass
class Point:
    x: float
    y: float
    z: float = 0.0

    def distance(self, point) -> float:
        return math.sqrt((self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2)

    def distance2(self, point) -> float:
        return (self.x - point.x)**2 + (self.y - point.y)**2 + (self.z - point.z)**2
