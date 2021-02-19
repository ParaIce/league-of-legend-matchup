from bs4 import BeautifulSoup
import requests
import mysql.connector

roleList = {'TOP': 1, 'JUNGLE': 2, 'MID': 3, 'ADC': 4, 'SUPPORT': 5}

config = {
    'user': 'root',
    'password': 'OOjun123',
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
    print("Error list: " + str(errorList))

def updateChampion():
    selectSQL = "SELECT IDonOPGG FROM champion"
    cursor.execute(selectSQL)
    IDonOPGGs = cursor.fetchall()
    for idtuple in IDonOPGGs:
        id = idtuple[0]
        r = requests.get(f'https://www.op.gg/champion/ajax/statistics/summonerRanking/championId={id}')
        s = BeautifulSoup(r.text, 'lxml')
        print(f'https://www.op.gg/champion/ajax/statistics/summonerRanking/championId={id}')
        name = s.h4.text[:-8]
        sql = f'''UPDATE champion SET EnglishName = "{name}" WHERE IDonOPGG = {id}'''
        # sql = f"INSERT INTO champion(Name, IDonOPGG) VALUES ('{name}', {id})"
        cursor.execute(sql)
        db.commit()
        print(name + " " + str(id) + " Success!")

def insertChampionMatchup():
    selectSQL = "SELECT ChampionID, RoleID from champion_role"
    cursor.execute(selectSQL)
    rows = cursor.fetchall()
    topList, jugList, midList, botList, supList = []
    # row[0] is ChampionID, row[1] is RoleID
    for row in rows:
        if row[1] == 1:
            topList.append(row[0])
        elif row[1] == 2:
            jugList.append(row[0])
        elif row[1] == 3:
            midList.append(row[0])
        elif row[1] == 4:
            botList.append(row[0])
        elif row[1] == 5:
            supList.append(row[0])

    matchups = []
    k = 0
    role = 'top'
    for i in topList[:-1]:
        k += 1
        for j in topList[k:]:
            matchups.append((i, k, role))
    k = 0
    role = 'jungle'
    for i in jugList[:-1]:
        k += 1
        for j in jugList[k:]:
            matchups.append((i, k, role))
    role = 'mid'
    k = 0
    for i in midList[:-1]:
        k += 1
        for j in midList[k:]:
            matchups.append((i, k, role))
    role = 'adc'
    k = 0
    for i in botList[:-1]:
        k += 1
        for j in botList[k:]:
            matchups.append((i, k, role))
    role = 'support'
    k = 0
    for i in supList[:-1]:
        k += 1
        for j in supList[k:]:
            matchups.append((i, k, role))

    for matchup in matchups:
        id1 = matchup[0]
        id2 = matchup[1]
        position = matchup[2]
        r = requests.get(f'https://www.op.gg/champion/ajax/statistics/counterChampion/championId={id1}&targetChampionId={id2}&position={position}')
        s = BeautifulSoup(r.text, 'lxml')
        print(f'https://www.op.gg/champion/ajax/statistics/counterChampion/championId={id1}&targetChampionId={id2}&position={position}')
        if position == 'jungle':

        elif position == 'support':

        else:







    insertSQL = f"https://www.op.gg/champion/ajax/statistics/counterChampion/championId={id1}&targetChampionId={id2}&position={position}"




addChampionRole()

