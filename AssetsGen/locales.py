from dataclasses import dataclass
from lib2to3.pgen2.token import OP
from typing import Optional
from dataclasses_json import dataclass_json


@dataclass_json
@dataclass
class Locale:
    locale: str
    # code: Optional[str]
    # hash: Optional[str]
    xcode: str
    internal_code: str
    event_waves: list[str]
    king_sakelien: list[str]


@dataclass_json
@dataclass
class Language:
    locale: str
    code: str
    hash: str
    xcode: str
    internal: str
    event_type: list[str]
    king_sakelien: list[str]
