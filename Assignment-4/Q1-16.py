import mysql.connector
from mysql.connector import Error

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def user_details(min_quantity=5):
    cmd = ''' select user_id, phone, email from 
        users where user_id in(select user_id from cart where quantity<%s); '''
    try:
        cursor.execute(cmd, (min_quantity, ))
    except Error as e:
        print(e)


user_details()
x = cursor.fetchall()
for t in x:
    print(t)