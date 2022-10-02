from dataclasses import dataclass
from dataclasses_json import dataclass_json


@dataclass_json
@dataclass
class Locale:
    id: int
    locale: str
    hash: str
    xcode: str
    internal_code: str
    event_waves: list[str]
    king_sakelien: list[str]
