import deepl
import os
import json
from dotenv import load_dotenv
from googletrans import Translator

if __name__=="__main__":
  load_dotenv()
  AUTH_KEY = os.getenv("DEEPL_AUTH_KEY")
  translator = deepl.Translator(AUTH_KEY)

  # 出力
  with open("sources.json", mode="r") as f:
    output = {}
    input = json.load(f)
    output["ja-JP"] = input["JA-JP"]
    output["en-US"] = input["EN-US"]
    # 英語を基準にしないとおかしくなるため
    values = input["EN-US"]
    target_langs = ["EN-GB", "DE", "IT", "FR", "NL", "RU", "ES", "ZH"]
    for target_lang in target_langs:
      print(f"Translating {target_lang}")
      results = translator.translate_text(values.values(), target_lang=target_lang, source_lang="EN")
      results = list(map(lambda x: x.text, results))
      if target_lang == "EN-GB":
        output['en-GB'] = dict(zip(values.keys(), results))
      if target_lang == "DE":
        output['de-DE'] = dict(zip(values.keys(), results))
      if target_lang == "IT":
        output['it-IT'] = dict(zip(values.keys(), results))
      if target_lang == "FR":
        output['fr-FR'] = dict(zip(values.keys(), results))
        output['fr-CA'] = dict(zip(values.keys(), results))
      if target_lang == "NL":
        output['nl-NL'] = dict(zip(values.keys(), results))
      if target_lang == "RU":
        output['ru-RU'] = dict(zip(values.keys(), results))
      if target_lang == "ZH":
        output['zh-CN'] = dict(zip(values.keys(), results))
        # google = Translator()
        # translated = []
        # for result in results:
        #   translated.append(google.translate(result, src="zh-cn", dest="zh-tw").text)
        # output['zh-TW'] = dict(zip(values.keys(), translated))
      if target_lang == "ES":
        output['es-ES'] = dict(zip(values.keys(), results))
        output['es-MX'] = dict(zip(values.keys(), results))
    with open(f"output.json", mode="w") as w:
      json.dump(output, w, indent=2, ensure_ascii=False)
