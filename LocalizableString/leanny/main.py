from textwrap import indent
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

if __name__=="__main__":
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

    if os.path.exists(f"../../Sources/SplatNet3/Resources/{language}.lproj") == False:
      os.makedirs(f"../../Sources/SplatNet3/Resources/{language}.lproj")
    with open(f"../../Sources/SplatNet3/Resources/{language}.lproj/localizable.strings", mode="w") as f:
      for param in params:
        f.write(param)
