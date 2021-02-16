from bs4 import BeautifulSoup
import requests
import mysql.connector

config = {
    'user': 'root',
    'password': '841117',
    'host': 'localhost',
    'database': 'league_of_legend_matchup'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()

# selectSQL = "SELECT IDonOPGG FROM champion"

# cursor.execute(selectSQL)

# IDonOPGGs = cursor.fetchall()

cookies = dict(customLocale='zh_CN')

"""
for idtuple in IDonOPGGs[29:]:
    id = idtuple[0]
    r = requests.get(f'https://www.op.gg/champion/ajax/statistics/summonerRanking/championId={id}')
    s = BeautifulSoup(r.text, 'lxml')
    print(f'https://www.op.gg/champion/ajax/statistics/summonerRanking/championId={id}')
    if s.h4 is not None:
        name = s.h4.text.split(' ')[0]
        sql = f'''UPDATE champion SET EnglishName = "{name}" WHERE IDonOPGG = {id}'''
        #sql = f"INSERT INTO champion(Name, IDonOPGG) VALUES ('{name}', {id})"
        cursor.execute(sql)
        db.commit()
        print(name + " " + str(id) + " Success!")
"""


def addChampionRole():
    errorList = []
    roleList = {'TOP': 1, 'JUNGLE': 2, 'MID': 3, 'ADC': 4, 'SUPPORT': 5}
    selectSQL = "SELECT ID, EnglishName FROM champion"
    cursor.execute(selectSQL)
    rows = cursor.fetchall()
    for row in rows:
        championID = row[0]
        name = row[1]
        r = requests.get(f'''https://www.op.gg/champion/{name}/statistics''')
        print(f'''https://www.op.gg/champion/{name}/statistics''')
        s = BeautifulSoup(r.text, 'lxml')
        roleTags = s.find_all(attrs={"data-position": True})
        if len(roleTags) >= 5:
            print(name + " Error!!!")
            errorList.append(name)
        else:
            for roleTag in roleTags:
                role = roleTag.get('data-position')
                roleID = roleList[role]
                insertSQL = f'''INSERT INTO champion_role(ChampionID, RoleID) VALUES ("{championID}", "{roleID}")'''
                cursor.execute(insertSQL)
                db.commit()
                print(name + " " + str(roleID) + " Success!")
    print("Error list: " + errorList)




addChampionRole()

