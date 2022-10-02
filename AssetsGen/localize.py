# from this import d
import requests
import re
import json
import os
import base64
from collections import OrderedDict

from result import *
from locales import *


def get_plain(encoded: str) -> str:
    return base64.b64decode(encoded.encode()).decode()


def format(k: str, v: str) -> dict:
    return {f"CoopHistory_EventWave{get_plain(k)[-1]}": v}


def boss_format(k: str, v: str) -> dict:
    return {f"CoopHistory_KingSakelien{get_plain(k)[-1]}": v}


def dict_wave(values: list[dict]) -> dict:
    waves = {}
    for value in values:
        for k, v in value.items():
            waves[k] = v
    results = OrderedDict(sorted(waves.items()))
    return {"event_waves": list(results.values())}


def dict_sakelien(values: list[dict]) -> dict:
    sakelien = {}
    for value in values:
        for k, v in value.items():
            sakelien[k] = v
    results = OrderedDict(sorted(sakelien.items()))
    return {"king_sakelien": list(results.values())}


if __name__ == "__main__":
    with open("locales.json", mode="r") as f:
        locales = list(
            map(lambda locale: Locale.from_json(json.dumps(locale)), json.load(f))
        )

        for locale in locales:
            eventWaves = []
            kingSakelien = []

            results = os.listdir(
                f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{locale.internal_code}"
            )
            for result in results:
                with open(
                    f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{locale.internal_code}/{result}",
                    mode="r",
                ) as fw:
                    result: Result = Result.from_json(json.dumps(json.load(fw)))
                    waves: list[EventWave] = list(
                        map(
                            lambda wave: wave.eventWave,
                            list(
                                filter(
                                    lambda wave: wave.eventWave is not None,
                                    result.data.coopHistoryDetail.waveResults,
                                )
                            ),
                        )
                    )
                    events = list(
                        map(lambda event: format(event.id, event.name), waves)
                    )
                    bossResult: Optional[
                        BossResult
                    ] = result.data.coopHistoryDetail.bossResult
                    if bossResult is not None:
                        boss = boss_format(bossResult.boss.id, bossResult.boss.name)
                        kingSakelien.append(boss)
                    eventWaves.extend(events)
            z = dict_wave(eventWaves).copy()
            z.update(dict_sakelien(kingSakelien))
            with open(
                f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{locale.internal_code}.json",
                mode="w",
            ) as w:
                w.write(json.dumps(z, indent=2, ensure_ascii=False))
