from dataclasses import dataclass
from typing import List
from dataclasses_json import dataclass_json


@dataclass_json
@dataclass
class Image:
    filename: str
    idiom: str

    def __init__(self, rowId: str):
        self.filename = f"{rowId}.png"
        self.idiom = "universal"


@dataclass_json
@dataclass
class Info:
    author: str
    version: int

    def __init__(self):
        self.author = "xcode"
        self.version = 1


@dataclass_json
@dataclass
class Content:
    images: List[Image]
    info: Info

    def __init__(self, rowId: str):
        self.info = Info()
        self.images = [Image(rowId)]
