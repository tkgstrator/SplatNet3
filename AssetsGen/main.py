# from threading import local
from locales import *
from nameplate import *
from badge import *
from content import *
import requests
import json
import base64
import hashlib
import os
import re

def get_merged_json(locale: str) -> json:
    # JSONをマージして読み込み
    revisions = os.listdir("resources")
    data = list(map(lambda x: json.load(open(f"resources/{x}/{locale}.json")), revisions))
    return {**data[0], **data[1]}

def get_base64(plain: str) -> str:
    return base64.b64encode(plain.encode())


def get_hash(plain: str) -> str:
    return hashlib.sha256(plain.encode()).hexdigest()


def format(key: str, value: str) -> str:
    key = key.replace("_%", "").replace("-", "_").strip()
    value = value.replace('"', '')
    value = value.replace("\n", "")
    return f'// {key}\n"{get_hash(key.strip())}" = "{value.strip()}";\n'


def localized_format(key: str, value: str) -> str:
    key = key.replace("_%", "").replace("-", "_").strip()
    value = value.replace("\n", "")
    value = value.replace('"', '')
    return f'\t/// {value}\n\tcase {key} = "{get_hash(key)}"\n'


def get_locales() -> list[Locale]:
    with open("locales.json", mode="r") as f:
        return list(
            map(lambda locale: Locale.from_json(json.dumps(locale)), json.load(f))
        )


def camel_case(dict):
    keys = dict.copy().keys()
    for key in keys:
        value = dict[key]
        del dict[key]
        camel_key = re.sub("_(.)", lambda x: x.group(1).upper(), key)
        camel_key = re.sub("\.(.)", lambda x: f"_{x.group(1).upper()}", camel_key)
        dict[camel_key] = value
    return dict


def tuple_to_dict(tuple) -> dict:
    dict = {}
    for k, v in tuple:
        dict[k] = v
    return dict

def get_revision() -> str:
    # Revisionを取得
    url = "https://api.lp1.av5ja.srv.nintendo.net/?lang=ja-JP"
    response = requests.get(url)
    response.encoding = response.apparent_encoding
    revision = re.search(
        'src="/static/js/main\.([a-f0-9]{8}).js"', response.text
    ).group(1)
    print("Revision:", revision)
    return revision

def get_localized(revision):
    # JavaScriptからlocaleとhashを取得
    base_url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
    response = requests.get(base_url).text
    locales = tuple_to_dict(re.findall('([\d]{2,3}):"(locale[\d]{1,2})"', response))
    hashes = tuple_to_dict(re.findall('([\d]{2,3}):"([a-f0-9]{8})"', response))

    # Internal codeを取得
    codes = re.findall('"./([a-z]{2}-[A-Z]{2}).json":\[(.*?)\]', response)
    codes = tuple_to_dict(list(map(lambda x: (x[1].split(",")[-1], x[0]), codes)))

    # イカリング3から言語データのマップを作成
    data: list[Locale] = get_locales()
    languages = {}
    for key in hashes.keys():
        lang: Locale = list(filter(lambda x: x.locale == locales[key], data))[0]
        languages[key] = {
            "locale": locales[key],
            "hash": hashes[key],
            "code": codes[key],
            "xcode": lang.xcode,
            "internal": lang.internal_code,
            "event_type": lang.event_waves,
            "king_sakelien": lang.king_sakelien,
        }
    # 英語を追加
    lang: Locale = list(filter(lambda x: x.locale == "locale99", data))[0]
    languages[65468] = {
        "locale": "locale14",
        "hash": None,
        "code": "en-US",
        "xcode": lang.xcode,
        "internal": lang.internal_code,
        "event_type": lang.event_waves,
        "king_sakelien": lang.king_sakelien,
    }

    languages: list[Language] = list(map(lambda v: Language(**v), languages.values()))
    deep = json.load(open("output.json", mode="r"))

    for language in languages:
        # 内部データから検索
        print(f"Downloading {language.xcode}")
        url = f"https://leanny.github.io/splat3/data/language/{language.internal}.json"
        params = []
        localized = []

        res: dict = requests.get(url).json()

        data = res["CommonMsg/Coop/CoopEnemy"]
        for k, v in data.items():
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        data = res["CommonMsg/Coop/CoopGrade"]
        for k, v in data.items():
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        # data = res["CommonMsg/Coop/CoopSkinName"]
        # for k, v in data.items():
        #     params.append(format(k, v))

        data = res["CommonMsg/Coop/CoopStageName"]
        for k, v in data.items():
            k = f"Cop_{k}"
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        data = res["CommonMsg/Weapon/WeaponName_Main"]
        for k, v in data.items():
            if "_00" in k and "Rival" not in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif "Bear_Coop" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        data = res["CommonMsg/Weapon/WeaponName_Special"]
        for k, v in data.items():
            if "_Coop" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        data = res["LayoutMsg/Cmn_Menu_00"]
        for k, v in data.items():
            if "L_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif "T_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        data = res["LayoutMsg/Lobby_MenuMode_00"]
        for k, v in data.items():
            if "L_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif "T_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        data = res["LayoutMsg/Plz_ItemMenu_00"]
        for k, v in data.items():
            if "L_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif "T_" in k:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        data = res["CommonMsg/Weapon/WeaponParamName"]
        for k, v in data.items():
            params.append(format(k, v))
            localized.append(localized_format(k, v))

        # data = res["CommonMsg/Byname/BynameAdjective"]
        # for k, v in data.items():
        #     v = "".join(re.findall("([^\[\]]+(?=\[[^\[\]]+\])|[^\[\]]+$)", v))
        #     if len(v) != 0:
        #         params.append(format(k, v))

        # data = res["CommonMsg/Byname/BynameSubject"]
        # for k, v in data.items():
        #     v = "".join(re.findall("([^\[\]]+(?=\[[^\[\]]+\])|[^\[\]]+$)", v))
        #     if len(v) != 0:
        #         params.append(format(k, v))

        data = res["CommonMsg/Manual/ManualCoop"]
        for k, v in data.items():
            if re.search(r"T_TitleCoop_\d{2}", k) is not None:
                v = v.split()[1]
                params.append(format(k, v))
                localized.append(localized_format(k, v))
        k = "T_TitleCoop_45"
        v = "-"
        params.append(format(k, v))
        localized.append(localized_format(k, v))

        # フォントデータを追加
        if language.locale == "locale12":
            params.append(format("Common_Locale_Lang", "1"))
        elif language.locale == "locale13":
            params.append(format("Common_Locale_Lang", "2"))
        else:
            params.append(format("Common_Locale_Lang", "0"))

        # フォントデータを追加
        params.append(format("Common_SplatNet3_Locale", language.code))

        # DeepL翻訳データを変換
        try:
            for k, v in deep[language.code].items():
                params.append(format(k, v))
                localized.append(localized_format(k, v))
        except:
            for k, v in deep["en-US"].items():
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        # イカリング3からデータ取得
        if language.code == "en-US":
            url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
        else:
            url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/{language.locale}.{language.hash}.chunk.js"
        # JavaScriptの中身
        response = requests.get(url).text

        match = re.search("JSON.parse\('(.*)'\)\}\}", response).group(1)
        data = json.loads(match.encode("utf-8").decode("unicode-escape"))
        makdirs(f"resources/{revision}")
        with open(f"resources/{revision}/{language.locale}.json", mode="w") as w:
            w.write(json.dumps(data, indent=2, ensure_ascii=False))
        
        data = camel_case(get_merged_json(language.locale))
        for k, v in data.items():
            if k == "Challenge_Challenge29Title":
                params.append(format(k, v))
                localized.append(localized_format(k, v))
                k = "Cop_Shakeship"
                params.append(format(k, v))
                localized.append(localized_format(k, v))
            elif k == "CoopHistory_Wave":
                value = v.split(" ")[0]
                params.append(format("CoopHistory_Wave1", f"{value} 1"))
                params.append(format("CoopHistory_Wave2", f"{value} 2"))
                params.append(format("CoopHistory_Wave3", f"{value} 3"))
                localized.append(localized_format("CoopHistory_Wave1", f"{value} 1"))
                localized.append(localized_format("CoopHistory_Wave2", f"{value} 2"))
                localized.append(localized_format("CoopHistory_Wave3", f"{value} 3"))
            else:
                params.append(format(k, v))
                localized.append(localized_format(k, v))

        # イベント情報を取得
        for index, wave in enumerate(language.event_type):
            params.append(format(f"CoopHistory_EventWave{index+1}", wave))
            localized.append(localized_format(f"CoopHistory_EventWave{index+1}", wave))

        for index, sakelien in enumerate(language.king_sakelien):
            params.append(format(f"CoopHistory_KingSakelien{index+3}", sakelien))
            localized.append(
                localized_format(f"CoopHistory_KingSakelien{index+3}", sakelien)
            )

        if language.code == "ja-JP":
            get_localized_text(localized)
        # ディレクトリ作成
        makdirs(f"../Sources/SplatNet3/Resources/{language.xcode}.lproj")
        # 翻訳ファイルを書き込み
        with open(
            f"../Sources/SplatNet3/Resources/{language.xcode}.lproj/localizable.strings",
            mode="w",
        ) as f:
            print(f"Converting {language.xcode}")
            f.writelines(params)


def get_localized_text(localized: list[str]):
    makdirs(f"../Sources/SplatNet3/Enum/")
    with open(f"../Sources/SplatNet3/Enum/LocalizedType.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  LocalizedType.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n",
            "\n\n",
            "import Foundation\n\n",
            "public enum LocalizedType: String, CaseIterable {\n",
        ]
        f.writelines(headers)
        # hashes = sorted(hashes, key=lambda tup: tup[1].capitalize())
        for line in localized:
            f.write(line)
        f.write("}")


def get_hashes(revision):
    url = f"https://api.lp1.av5ja.srv.nintendo.net/static/js/main.{revision}.js"
    response = requests.get(url).text
    # Hash
    hashes = re.findall('id:"([a-f0-9]{32})",metadata:{},name:"([A-z]*)"', response)
    makdirs(f"../Sources/SplatNet3/Enum/")
    with open(f"../Sources/SplatNet3/Enum/SHA256Hash.swift", mode="w") as f:
        headers = [
            "//\n",
            "//  SHA256Hash.swift\n",
            "//  SplatNet3\n",
            "//\n",
            "//  Created by tkgstrator on 2022/09/22\n",
            "//  Copyright © 2022 Magi, Corporation. All rights reserved.\n",
            "//\n",
            "\n\n",
            "import Foundation\n\n",
            "public enum SHA256Hash: String, CaseIterable {\n",
        ]
        f.writelines(headers)
        hashes = sorted(hashes, key=lambda tup: tup[1].capitalize())
        for hash in hashes:
            f.write(f'\tcase {hash[1]} = "{hash[0]}"\n')
        f.write("}")


def get_badge(version: str = "111"):
    url = f"https://leanny.github.io/splat3//data/mush/{version}/BadgeInfo.json"
    # そのままだと読み込めないので置換する
    response = (
        requests.get(url)
        .text.replace("__RowId", "RowId")
        .replace("Sub1_", "Sub1")
        .replace("Sub2_", "Sub2")
    )
    badges = list(
        map(
            lambda nameplate: BadgeElement.from_json(json.dumps(nameplate)),
            json.loads(response),
        )
    )

    for badge in badges:
        url = f"https://leanny.github.io/splat3/images/badge/Badge_{badge.Name}.png"
        print(url)

        makdirs(f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset")
        with open(
            f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset/{badge.Name}.png",
            mode="wb",
        ) as f:
            f.write(requests.get(url).content)

        with open(
            f"../Sources/SplatNet3/Assets.xcassets/Badges/{badge.Id}.imageset/Contents.json",
            mode="w",
        ) as f:
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
            "public enum BadgeType: Int, CaseIterable, Identifiable, Codable {\n",
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
    nameplates = list(
        map(
            lambda nameplate: NamePlateBgElement.from_json(json.dumps(nameplate)),
            json.loads(response),
        )
    )

    for nameplate in nameplates:
        url = f"https://leanny.github.io/splat3/images/npl/{nameplate.RowId}.png"

        makdirs(
            f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset"
        )
        with open(
            f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset/{nameplate.RowId}.png",
            mode="wb",
        ) as f:
            f.write(requests.get(url).content)

        with open(
            f"../Sources/SplatNet3/Assets.xcassets/NamePlates/{nameplate.Id}.imageset/Contents.json",
            mode="w",
        ) as f:
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
            "public enum NamePlateType: Int, CaseIterable, Identifiable, Codable {\n",
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


if __name__ == "__main__":
    revision = get_revision()
    # 翻訳ファイル
    get_localized(revision)
    # ハッシュ
    # get_hashes(revision)
    # バッジ
    # get_badge("120")
    # ネームプレート
    # get_nameplate("120")
