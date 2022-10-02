from dataclasses import dataclass
from dataclasses_json import dataclass_json
from typing import List, Optional
from datetime import datetime


@dataclass_json
@dataclass
class Image:
    url: str


@dataclass_json
@dataclass
class CoopStage:
    name: str
    image: Image
    id: str


@dataclass_json
@dataclass
class EnemyResult:
    defeatCount: int
    teamDefeatCount: int
    popCount: int
    enemy: CoopStage


@dataclass_json
@dataclass
class TextColor:
    a: int
    b: int
    g: int
    r: int


@dataclass_json
@dataclass
class Background:
    textColor: TextColor
    image: Image
    id: str


@dataclass_json
@dataclass
class Badge:
    id: str
    image: Image


@dataclass_json
@dataclass
class MemberResultPlayer:
    byname: str
    name: str
    nameId: int
    uniform: CoopStage
    id: str
    isMyself: bool
    species: str


@dataclass_json
@dataclass
class Weapon:
    name: str
    image: Image


@dataclass_json
@dataclass
class MemberResult:
    player: MemberResultPlayer
    weapons: List[Weapon]
    specialWeapon: CoopStage
    defeatEnemyCount: int
    deliverCount: int
    goldenAssistCount: int
    goldenDeliverCount: int
    rescueCount: int
    rescuedCount: int


@dataclass_json
@dataclass
class MyResult:
    weapons: List[Weapon]
    specialWeapon: CoopStage
    defeatEnemyCount: int
    deliverCount: int
    goldenAssistCount: int
    goldenDeliverCount: int
    rescueCount: int
    rescuedCount: int


@dataclass_json
@dataclass
class HistoryDetail:
    id: str


@dataclass_json
@dataclass
class EventWave:
    id: str
    name: str


@dataclass_json
@dataclass
class WaveResult:
    waveNumber: int
    waterLevel: int
    eventWave: Optional[EventWave]
    deliverNorm: Optional[int]
    goldenPopCount: int
    teamDeliverCount: Optional[int]
    specialWeapons: List[CoopStage]


@dataclass_json
@dataclass
class Boss:
    name: str
    id: str


@dataclass_json
@dataclass
class BossResult:
    boss: Boss


@dataclass_json
@dataclass
class CoopHistoryDetail:
    id: str
    rule: str
    myResult: MyResult
    memberResults: List[MemberResult]
    enemyResults: List[EnemyResult]
    waveResults: List[WaveResult]
    bossResult: Optional[BossResult]
    resultWave: int
    coopStage: CoopStage
    dangerRate: int
    weapons: List[Weapon]


@dataclass_json
@dataclass
class Data:
    coopHistoryDetail: CoopHistoryDetail


@dataclass_json
@dataclass
class Result:
    data: Data
