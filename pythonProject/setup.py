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
    selectSQL = "SELECT IDonOPGG, EnglishName FROM champion"
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
    # get champion matchup base on role
    selectSQL = "SELECT ChampionID, RoleID from champion_role"
    cursor.execute(selectSQL)
    rows = cursor.fetchall()
    topList = []
    jugList = []
    midList = []
    botList = []
    supList = []
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
            matchups.append((i, j, role))
    k = 0
    role = 'jungle'
    for i in jugList[:-1]:
        k += 1
        for j in jugList[k:]:
            matchups.append((i, j, role))
    role = 'mid'
    k = 0
    for i in midList[:-1]:
        k += 1
        for j in midList[k:]:
            matchups.append((i, j, role))
    role = 'adc'
    k = 0
    for i in botList[:-1]:
        k += 1
        for j in botList[k:]:
            matchups.append((i, j, role))
    role = 'support'
    k = 0
    for i in supList[:-1]:
        k += 1
        for j in supList[k:]:
            matchups.append((i, j, role))
    print(matchups)

    errorList = []

    # scrap data base on matchup
    for matchup in matchups:
        id1 = matchup[0]
        id2 = matchup[1]
        position = matchup[2]
        print(position, id1, id2)
        r = requests.get(f'https://www.op.gg/champion/ajax/statistics/counterChampion/championId={id1}&targetChampionId={id2}&position={position}')
        s = BeautifulSoup(r.text, 'lxml')
        print(f'https://www.op.gg/champion/ajax/statistics/counterChampion/championId={id1}&targetChampionId={id2}&position={position}')

        if s.find_all(attrs={"class": "champion-matchup-data"}) == []:
            errorList.append((id1, id2, position))
            print(f"({id1}, {id2}, {position}) error!")
        else:
            # store matchup data
            data = {}
            if position == 'jungle':
                rawdatas = s.find_all(attrs={"class": "champion-matchup-data"})
                data['KDA1'] = rawdatas[0].get_text(strip=True)[:4]  # not including ' : 1'
                data['KDA2'] = rawdatas[1].get_text(strip=True)[:4]
                data['KP1'] = rawdatas[2].get_text(strip=True).replace('%', '')
                data['KP2'] = rawdatas[3].get_text(strip=True).replace('%', '')
                data['Damage1'] = rawdatas[4].get_text(strip=True).replace(',', '')
                data['Damage2'] = rawdatas[5].get_text(strip=True).replace(',', '')
                data['WinRate1'] = rawdatas[6].get_text(strip=True).replace('%', '')
                data['WinRate2'] = rawdatas[7].get_text(strip=True).replace('%', '')

                insertSQL = f'''INSERT INTO champion_matchup(ChampionID1, ChampionID2, RoleID, WinRate1, WinRate2, KDA1, KDA2, KP1, KP2, Damage1, Damage2) 
                                                VALUES ("{id1}", "{id2}", "2", "{data['WinRate1']}", "{data['WinRate2']}", 
                                                    "{data['KDA1']}", "{data['KDA2']}", "{data['KP1']}", "{data['KP2']}", "{data['Damage1']}", "{data['Damage2']}")'''
                cursor.execute(insertSQL)
                db.commit()
                print(f"id1: {id1} id2: {id2} position: {position} Success!")

            elif position == 'support':
                rawdatas = s.find_all(attrs={"class": "champion-matchup-data"})
                data['KillRate1'] = rawdatas[0].get_text(strip=True).replace('%', '')  # not including '%'
                data['KillRate2'] = rawdatas[1].get_text(strip=True).replace('%', '')
                data['KDA1'] = rawdatas[2].get_text(strip=True)[:4]  # not including ' : 1'
                data['KDA2'] = rawdatas[3].get_text(strip=True)[:4]
                data['KP1'] = rawdatas[4].get_text(strip=True).replace('%', '')
                data['KP2'] = rawdatas[5].get_text(strip=True).replace('%', '')
                data['WinRate1'] = rawdatas[6].get_text(strip=True).replace('%', '')
                data['WinRate2'] = rawdatas[7].get_text(strip=True).replace('%', '')

                insertSQL = f'''INSERT INTO champion_matchup(ChampionID1, ChampionID2, RoleID, WinRate1, WinRate2, KillRate1, KillRate2, KDA1, KDA2, KP1, KP2) 
                                                VALUES ("{id1}", "{id2}", "5", "{data['WinRate1']}", "{data['WinRate2']}", "{data['KillRate1']}", "{data['KillRate2']}", 
                                                    "{data['KDA1']}", "{data['KDA2']}", "{data['KP1']}", "{data['KP2']}")'''
                cursor.execute(insertSQL)
                db.commit()
                print(f"id1: {id1} id2: {id2} position: {position} Success!")

            else:  # top, mid, adc
                rawdatas = s.find_all(attrs={"class": "champion-matchup-data"})
                data['KillRate1'] = rawdatas[0].get_text(strip=True).replace('%', '')  # not including '%'
                data['KillRate2'] = rawdatas[1].get_text(strip=True).replace('%', '')
                data['KDA1'] = rawdatas[2].get_text(strip=True)[:4]  # not including ' : 1'
                data['KDA2'] = rawdatas[3].get_text(strip=True)[:4]
                data['KP1'] = rawdatas[4].get_text(strip=True).replace('%', '')
                data['KP2'] = rawdatas[5].get_text(strip=True).replace('%', '')
                data['Damage1'] = rawdatas[6].get_text(strip=True).replace(',', '')
                data['Damage2'] = rawdatas[7].get_text(strip=True).replace(',', '')
                data['TowerDestroyTime1'] = rawdatas[8].get_text(strip=True).replace('\'', '').replace('"', '')
                data['TowerDestroyTime2'] = rawdatas[9].get_text(strip=True).replace('\'', '').replace('"', '')
                data['WinRate1'] = rawdatas[10].get_text(strip=True).replace('%', '')
                data['WinRate2'] = rawdatas[11].get_text(strip=True).replace('%', '')

                if position == 'top':
                    role = 1
                elif position == 'mid':
                    role = 3
                elif position == 'adc':
                    role = 4
                insertSQL = f'''INSERT INTO champion_matchup(ChampionID1, ChampionID2, RoleID, WinRate1, WinRate2, KillRate1, KillRate2, KDA1, KDA2, KP1, KP2, Damage1, Damage2, TowerDestroyTime1, TowerDestroyTIme2) 
                                    VALUES ("{id1}", "{id2}", "{role}", "{data['WinRate1']}", "{data['WinRate2']}", "{data['KillRate1']}", "{data['KillRate2']}", 
                                        "{data['KDA1']}", "{data['KDA2']}", "{data['KP1']}", "{data['KP2']}", "{data['Damage1']}", "{data['Damage2']}", "{data['TowerDestroyTime1']}", "{data['TowerDestroyTime2']}")'''
                print(insertSQL)
                cursor.execute(insertSQL)
                db.commit()
                print(f"id1: {id1} id2: {id2} position: {position} Success!")


    print(f"ErrorList: {errorList}")




insertChampionMatchup()

