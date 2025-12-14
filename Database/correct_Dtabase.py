import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Nas!@San?"
)

mycursor = mydb.cursor()
mycursor.execute("SHOW DATABASES")
result = mycursor.fetchall()
for row in result:
    print(row)