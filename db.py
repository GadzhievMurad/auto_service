import sqlite3

connector = sqlite3.connect('auto.db')

cursor = connector.cursor()

###cursor.execute('''
###INSERT INTO "должности" VALUES (1,'автомеханик','чинит автомобили');''')

###cursor.execute('''
###INSERT INTO "должности" VALUES (2,'начальник смены','распеределяет работу автомеханикам'); ''')

info = cursor.execute ("SELECT * FROM 'сотрудники'")

for row in info:
    print(f'id: {row[0]}, last name: {row[1]}, first name: {row[2]}, date: {row[4]}, phone: {row[5]}' )

cursor.close()
connector.close()
