import mysql.connector
import datetime

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def find_products(containing):
    cmd = ''' select * from products where  
        (product_name like %s and product_id in (select product_id from purchases)) '''
    cursor.execute(cmd, (containing, ))

find_products('%mi%')
x=cursor.fetchall()
for t in x:
    print(t)
