from enum import Enum
from dataclasses_json import dataclass_json
from dataclasses import dataclass
from typing import List, Optional
from datetime import datetime

@dataclass_json
@dataclass
class Image:
    url: str


@dataclass_json
@dataclass
class Weapon:
    id: str
    name: str
    image: Image
    specialWeaponId: Optional[int] = None
    subWeaponId: Optional[int] = None


@dataclass_json
@dataclass
class Stats:
    # lastUsedTime: datetime
    paint: int
    level: int
    expToLevelUp: int
    win: int
    vibes: int


@dataclass_json
@dataclass
class WeaponCategory:
    weaponCategoryId: int
    id: str


@dataclass_json
@dataclass
class Node:
    weaponId: int
    subWeapon: Weapon
    specialWeapon: Weapon
    weaponCategory: WeaponCategory
    name: str
    image3d: Image
    image2d: Image
    image3dThumbnail: Image
    image2dThumbnail: Image
    image: Image
    originalImage: Image
    id: str
    stats: Optional[Stats] = None


@dataclass_json
@dataclass
class WeaponRecords:
    nodes: List[Node]


@dataclass_json
@dataclass
class Data:
    weaponRecords: WeaponRecords

@dataclass_json
@dataclass
class Weapons:
    data: WeaponRecords
