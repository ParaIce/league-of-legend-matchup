import mysql.connector

config = {
    'user': 'root',
    'password': '841117',
    'host': 'localhost',
    'database': 'league_of_legend_matchup'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()

def add_champion(name, idonopgg):
    sql = ("INSERT INTO champion(Name, IDonOPGG) VALUES (%s, %s)")
    cursor.execute(sql, (name, idonopgg))
    db.commit()

add_champion("testname2", 7)

