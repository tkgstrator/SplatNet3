import requests
import os, json, base64
from enum import Enum
import weapons as wp

class Endpoint(Enum):
  WEAPON        = "a0c277c719b758a926772879d8e53ef8"
  COOP_HISTORY  = "817618ce39bcf5570f52a97d73301b30"
  COOP_DETAILS  = "f3799a033f0a7ad4b1b396f9a3bafb1e"
  
languages = [
  'de-de',
  'en-gb',
  'en-us',
  'es-es',
  'es-mx',
  'fr-ca',
  'fr-fr',
  'it-it',
  'ja-jp',
  'ko-kr',
  'nl-nl',
  'ru-ru',
  'zh-tw',
  'zh-cn',
]


def request(endpoint: Endpoint, lang: str = 'en-us', variables: dict = {}) -> str:
  bullet_token = "s6V38Q0gmkmYkyq3r6ajit16Qy0uTouQfsmEpB8UrIC-MV0aUvhzAJiveMDo6IicdRzAQ8IY63H_6wxs4BT0tUfR-S2_drmGh4z3ZF0fbMT5FK2Zs2DEUISqrEg="
  session_token = "eyJhbGciOiJIUzI1NiJ9.eyJzdDpzY3AiOlswLDgsOSwxNywyM10sImlhdCI6MTY2MjcyMTg5OCwidHlwIjoic2Vzc2lvbl90b2tlbiIsInN1YiI6ImE4MzZhMWQ0NjI1YWZhYjQiLCJleHAiOjE3MjU3OTM4OTgsImF1ZCI6IjcxYjk2M2MxYjdiNmQxMTkiLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTc4NzkxMDI4Mn0.UUZ8l4neAp0nZPbcQU7EoUUo02GVI6pg1OeijE9zp1o"
  version = "1.0.0-d3a90678"
  url = 'https://api.lp1.av5ja.srv.nintendo.net/api/graphql'
  headers = {
    'Accept-Language': lang,
    'X-Web-View-Ver': version,
    'Authorization': f'Bearer {bullet_token}' 
  }
  parameters = {
      'variables': variables,
      'extensions': {
        'persistedQuery': {
          'version': 1,
          'sha256Hash': endpoint.value
        }
      }
  }
  response = requests.post(url, headers=headers, json=parameters)
  if response.status_code != 200:
    print(response.status_code, response.text)
  return response.json()

def get_summary():
  endpoints = [Endpoint.WEAPON, Endpoint.COOP_HISTORY]
      
  if os.path.exists("results") == False:
    os.mkdir("results")
  
  for language in languages:
    for endpoint in endpoints:
      if os.path.exists(f"results/{endpoint.value}") == False:
        os.mkdir(f"results/{endpoint.value}")
      
      with open(f"results/{endpoint.value}/{language}.json", mode="w") as f:
        json.dump(request(endpoint, language), f, indent=2, ensure_ascii=False)

flatten = lambda x: [z for y in x for z in (flatten(y) if hasattr(y, '__iter__') and not isinstance(y, str) else (y,))]

def get_result_ids(language: str) -> list[str]:
  with open(f"results/817618ce39bcf5570f52a97d73301b30/{language}.json", mode="r") as f:
    summary = json.load(f)
    nodes = summary['data']['coopResult']['historyGroups']['nodes']
    results = sum(list(map(lambda x: x['historyDetails']['nodes'], nodes)), [])
    return list(map(lambda x: x['id'], results))

def get_result(id: str, lang: str):
  parameters = {
    'coopHistoryDetailId': id
  }
  with open(f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{lang}/{id}.json", mode="w") as f:
    result = request(Endpoint.COOP_DETAILS, lang, parameters)
    json.dump(result, f, indent=2, ensure_ascii=False)

def get_coop_results():
  if os.path.exists(f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{language}") == False:
    os.makedirs(f"results/f3799a033f0a7ad4b1b396f9a3bafb1e/{language}")
  ids: list[int] = get_result_ids(language)
  for id in ids:
    get_result(id, language)


if __name__=="__main__":
  for language in languages:
    with open(f"results/{Endpoint.WEAPON.value}/{language}.json", mode="r") as f:
      print(f.read())
      weapons = wp.Weapons.from_json(f.read())
