import mysql.connector
from mysql.connector import Error

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def all_laptops():
    cmd = ''' select * from products where subtype=%s order by price asc'''
    try:
        cursor.execute(cmd, ("laptop", ))
    except Error as e:
        print(e)


all_laptops()
x = cursor.fetchall()
for t in x:
    print(t)