from dataclasses import dataclass
from dataclasses_json import dataclass_json


@dataclass_json
@dataclass
class BadgeElement:
    Category: str
    Id: int
    MsgLabelEx: str
    Name: str
    Order: int
    Sub1Int: int
    Sub1Str: str
    Sub2Int: int
    RowId: str
