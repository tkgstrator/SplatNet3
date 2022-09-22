from nameplate import *
from badge import * 
from content import *
import requests
import json
import base64
import hashlib
import os
import re

def get_base64(plain: str) -> str:
  return base64.b64encode(plain.encode())

def get_hash(plain: str) -> str:
  return hashlib.sha256(plain.encode()).hexdigest()

def format(key: str, value: str) -> str:
  return f"\"{get_hash(key.strip())}\" = \"{value.strip()}\";\n"

def get_localized():
  languages = [
    "CNzh",
    "EUde",
    "EUen",
    "EUes",
    "EUfr",
    "EUit",
    "EUnl",
    "EUru",
    "JPja",
    "KRko",
    "TWzh",
    "USen",
    "USes",
    "USfr",
  ]

  for language in languages:
    print(f"Downloading {language}")
    # 内部データから検索
    url = f"https://leanny.github.io/splat3/data/language/{language}.json"
    params = []

    with open(f"languages/{language}.json", mode="w") as f:
      res: dict = requests.get(url).json()
      
      data= res["CommonMsg/Coop/CoopEnemy"]
      for k, v in data.items():
        params.append(format(k, v))

      data= res["CommonMsg/Coop/CoopGrade"]
      for k, v in data.items():
        params.append(format(k, v))
      
      data = res["CommonMsg/Coop/CoopSkinName"]
      for k, v in data.items():
        params.append(format(k, v))

      data = res["CommonMsg/Coop/CoopStageName"]
      for k, v in data.items():
        params.append(format(k, v))
      
      data = res["CommonMsg/Weapon/WeaponName_Main"]
      for k, v in data.items():
        params.append(format(k, v))
      
      data = res["CommonMsg/Weapon/WeaponName_Special"]
      for k, v in data.items():
        params.append(format(k, v))
      
      data = res["CommonMsg/Manual/ManualCoop"]
      for k, v in data.items():
        if re.search(r'T_TitleCoop_\d{2}', k) is not None:
          v = v.split()[1]
          params.append(format(k, v))
      k = "T_TitleCoop_45"
      v = "-"
      params.append(format(k, v))

    # 国コードからXcodeの翻訳コードに変換
    if language == "EUen":
      language = "en-GB"
    if language == "USen":
      language = "en"
    if language == "JPja":
      language = "ja"
    if language == "CNzh":
      language = "zh-Hans"
    if language == "TWzh":
      language = "zh-Hant"
    if language == "EUes":
      language = "es"
    if language == "USes":
      language = "es-MX"
    if language == "EUde":
      language = "de"
    if language == "USfr":
      language = "fr-CA"
    if language == "EUfr":
      language = "fr"
    if language == "EUit":
      language = "it"
    if language == "KRko":
      language = "ko"
    if language == "EUnl":
      language = "nl"
    if language == "EUru":
      language = "ru"

    # ディレクトリ作成
    makdirs(f"../../Sources/SplatNet3/Resources/{language}.lproj")
    # 翻訳ファイルを書き込み
    with open(f"../../Sources/SplatNet3/Resources/{language}.lproj/localizable.strings", mode="w") as f:
      print(f"Converting {language}")
      for param in params:
        f.write(param)

def get_badge(version: str = "111"):
  url = f"https://leanny.github.io/splat3//data/mush/{version}/BadgeInfo.json"
  # そのままだと読み込めないので置換する
  response = requests.get(url).text.replace("__RowId", "RowId").replace("Sub1_", "Sub1").replace("Sub2_", "Sub2")
  badges = list(map(lambda nameplate: BadgeElement.from_json(json.dumps(nameplate)), json.loads(response)))

  for badge in badges:
    url = f"https://leanny.github.io/splat3/images/badge/Badge_{badge.Name}.png"
    print(url)

    makdirs(f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset")
    with open(f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset/{badge.Name}.png", mode="wb") as f:
      f.write(requests.get(url).content)
    
    with open(f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset/Contents.json", mode="w") as f:
      content = to_dict(Content(f"{badge.Name}"))
      f.write(json.dumps(content))
  
  makdirs(f"../Sources/SplatNet3/Enum/")
  with open(f"../Sources/SplatNet3/Enum/BadgeType.swift", mode="w") as f:
    headers = [
      "//\n",
      "//  BadgeType.swift\n",
      "//  SplatNet3\n",
      "//\n",
      "//  Created by tkgstrator on 2022/09/22\n",
      "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
      "//\n",
      "\n\n",
      "import Foundation\n\n",
      "public enum BadgeType: Int, CaseIterable, Identifiable {\n",
      "\tpublic var id: Int { rawValue }\n",
    ]
    f.writelines(headers)
    for badge in badges:
      f.write(f"\tcase {badge.Name} = {badge.Id}\n")
    f.write("}")


def get_nameplate(version: str = "111"):
  url = f"https://leanny.github.io/splat3//data/mush/{version}/NamePlateBgInfo.json"
  # そのままだと読み込めないので置換する
  response = requests.get(url).text.replace("__RowId", "RowId")
  nameplates = list(map(lambda nameplate: NamePlateBgElement.from_json(json.dumps(nameplate)), json.loads(response)))

  for nameplate in nameplates:
    url = f"https://leanny.github.io/splat3/images/npl/{nameplate.RowId}.png"

    makdirs(f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset")
    with open(f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset/{nameplate.RowId}.png", mode="wb") as f:
      f.write(requests.get(url).content)
    
    with open(f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset/Contents.json", mode="w") as f:
      content = to_dict(Content(f"{nameplate.RowId}"))
      f.write(json.dumps(content))
  
  makdirs(f"../Sources/SplatNet3/Enum/")
  with open(f"../Sources/SplatNet3/Enum/NameplateType.swift", mode="w") as f:
    headers = [
      "//\n",
      "//  NameplateType.swift\n",
      "//  SplatNet3\n",
      "//\n",
      "//  Created by tkgstrator on 2022/09/22\n",
      "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
      "//\n",
      "\n\n",
      "import Foundation\n\n",
      "public enum NamePlateType: Int, CaseIterable, Identifiable {\n",
      "\tpublic var id: Int { rawValue }\n",
    ]
    f.writelines(headers)
    for nameplate in nameplates:
      f.write(f"\tcase {nameplate.RowId} = {nameplate.Id}\n")
    f.write("}")

def makdirs(path: str):
  if os.path.exists(path) == False:
    os.makedirs(path)

def to_dict(obj):
    return json.loads(json.dumps(obj, default=lambda o: o.__dict__))

if __name__=="__main__":
  # 翻訳ファイル
  # get_localized()
  # バッジ
  get_badge("111")
  # ネームプレート
  # get_nameplate("111")
