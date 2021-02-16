from bs4 import BeautifulSoup
import requests


# 用cookies得到简体中文语言的网页
cookies = dict(customLocale='zh_CN')


url = 'https://www.op.gg/champion/ajax/statistics/summonerRanking/championId=58'
r = requests.get(url, cookies=cookies)


s.h4.text.split(' ')[0]
