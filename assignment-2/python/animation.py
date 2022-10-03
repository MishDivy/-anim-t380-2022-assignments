from point import Point


class Animation:
    def __init__(self, amp: float, freq: float, speed: float) -> None:
        self.amp = amp
        self.freq = freq
        self.speed = speed

        self._mesh_object = None
        self._mesh_loc = None

        self.__anim_expression = f'$MESH.translateY = $LOC.y + $AMP*sin(-$LOC.distance()*$FREQ+time*$SPEED)'

    @property
    def mesh_object(self) -> str:
        return self._mesh_object

    @mesh_object.setter
    def mesh_object(self, mesh_object: str) -> None:
        self._mesh_object = mesh_object

    @property
    def mesh_loc(self) -> Point:
        return self._mesh_loc

    @mesh_loc.setter
    def mesh_loc(self, mesh_loc: Point) -> None:
        self._mesh_loc = mesh_loc

    # TODO: Remove dependancy of the Point class. This is temp code it won't support all cases.

    def get_anim(self) -> str:
        expr = self.__anim_expression.replace('$MESH', self.mesh_object)
        expr = expr.replace('$LOC.x', str(self.mesh_loc.x))
        expr = expr.replace('$LOC.y', str(self.mesh_loc.y))
        expr = expr.replace('$LOC.z', str(self.mesh_loc.z))
        expr = expr.replace(
            '$LOC.distance()', str(self.mesh_loc.distance()))
        expr = expr.replace(
            '$LOC.distance2()', str(self.mesh_loc.distance2()))

        expr = expr.replace('$AMP', str(self.amp))
        expr = expr.replace('$FREQ', str(self.freq))
        expr = expr.replace('$SPEED', str(self.speed))

        return expr

    def set_anim(self, expression: str) -> None:
        self.__anim_expression = expression
