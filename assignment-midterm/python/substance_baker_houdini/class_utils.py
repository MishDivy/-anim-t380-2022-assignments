from typing import Callable
from collections.abc import Iterable
from pysbs import sbsenum
from enum import Enum, auto
import time
import logging

# Setup Logger
logging.basicConfig(
    format='%(asctime)s: %(name)-15s: %(levelname)s: %(message)s')

logger = logging.getLogger('Substance-Houdini-Baker')
logger.setLevel(logging.DEBUG)

class SDGEnum:
    class ExtermeValue(Enum):
        MIN = auto()
        MAX = auto()

    class ParameterEnum(sbsenum.AttributesEnum):
        IDENTIFIER = auto()

    class ListType(Enum):
        FLOAT = auto()
        INT = auto()
        STRING = auto()
        BOOL = auto()

    class ParameterType(Enum):
        BOOL = auto()
        INT = auto()
        FLOAT = auto()
        ALLINT = auto()
        ALLFLOAT = auto()
        ALL = auto()

        def __iter__(self) -> Iterable:
            yield self

    class MeshMaps(Enum):
        AO = auto()
        POSITION = auto()
        CURVATURE = auto()
        WSN = auto()
        NORMAL = auto()
        THICKNESS = auto()
        OPACITY = auto()
        HEIGHT = auto()
        COLOR = auto()

        def __iter__(self) -> Iterable:
            yield self

    class ColorMode(sbsenum.ColorModeEnum):
        pass


def wait_for_substance_engine(condition_func: Callable,  pass_message: str, fail_message: str, wait_limit: float = 10.0, wait_interval: float = 0.5, **kwargs) -> None:
    wait_time = 0.0
    while True:
        if callable(condition_func):
            if condition_func(**kwargs):
                logger.info(pass_message)
                return
            else:
                if wait_time >= wait_limit:
                    raise SubstanceEngineError(
                        f'{fail_message}. Substance Engine taking too long to respond.')
                time.sleep(wait_interval)
                wait_time += wait_interval
                logger.error('Waiting for Substance Engine....')
        else:
            raise NotImplementedError('Function provided is not callable.')


class CustomException(Exception):
    pass


class InvalidTypeError(CustomException):
    def __init__(self, message: str) -> None:
        super().__init__(message)


class SubstanceEngineError(CustomException):
    def __init__(self, message: str) -> None:
        super().__init__(message)
