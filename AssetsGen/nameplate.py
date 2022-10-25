from enum import Enum
from dataclasses import dataclass
from dataclasses_json import dataclass_json


class HowToGet(Enum):
    Catalog = "Catalog"
    Other = "Other"
    Shop = "Shop"
    Uroko = "Uroko"


@dataclass_json
@dataclass
class TextColor:
    A: int
    B: float
    G: float
    R: float


@dataclass_json
@dataclass
class UrokoPrice:
    BronzeUrokoNum: int
    GoldUrokoNum: int
    SilverUrokoNum: int


@dataclass_json
@dataclass
class NamePlateBgElement:
    HowToGet: HowToGet
    Id: int
    Order: int
    Season: int
    TextColor: TextColor
    UrokoPrice: UrokoPrice
    UrokoUhlockLevel: int
    RowId: str
