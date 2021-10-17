import mysql.connector
from mysql.connector import Error

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def retailers_of_user(user_id=1):
    cmd = ''' select retailer_id from products 
        where product_id in(select product_id from  purchases where user_id=%s); '''
    try:
        cursor.execute(cmd, (user_id, ))
    except Error as e:
        print(e)

retailers_of_user()
x = cursor.fetchall()
for t in x:
    print(t)