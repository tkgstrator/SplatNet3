from enum import Enum
from dataclasses_json import dataclass_json
from dataclasses import dataclass
from typing import List, Optional
from datetime import datetime

@dataclass_json
@dataclass
class AfterGrade:
    name: str
    id: str


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
class Nameplate:
    # badges: List[None]
    background: Background


@dataclass_json
@dataclass
class MemberResultPlayer:
    # isPlayer: str
    byname: str
    name: str
    nameId: int
    nameplate: Nameplate
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
class MyResultPlayer:
    # isPlayer: str
    byname: str
    name: str
    nameId: int
    uniform: CoopStage
    id: str
    isMyself: bool
    species: str


@dataclass_json
@dataclass
class MyResult:
    player: MyResultPlayer
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
class WaveResult:
    waveNumber: int
    waterLevel: int
    eventWave: int
    deliverNorm: int
    goldenPopCount: int
    teamDeliverCount: int
    specialWeapons: List[CoopStage]


@dataclass_json
@dataclass
class CoopHistoryDetail:
    # __typename: str
    id: str
    afterGrade: Optional[AfterGrade]
    rule: str
    myResult: MyResult
    memberResults: List[MemberResult]
    # bossResult: None
    enemyResults: List[EnemyResult]
    waveResults: List[WaveResult]
    resultWave: int
    playedTime: str
    coopStage: CoopStage
    dangerRate: float
    # scenarioCode: None
    smellMeter: int
    weapons: List[Weapon]
    afterGradePoint: int
    # scale: None
    jobPoint: Optional[int]
    jobScore: Optional[int]
    jobRate: Optional[float]
    jobBonus: Optional[int]
    nextHistoryDetail: Optional[HistoryDetail]
    previousHistoryDetail: Optional[HistoryDetail]


@dataclass_json
@dataclass
class Data:
    coopHistoryDetail: CoopHistoryDetail


@dataclass_json
@dataclass
class CoopResult:
    data: Data
