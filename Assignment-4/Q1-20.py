import mysql.connector
from mysql.connector import Error

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def update_discount(percent_discount=15, added_after='2014-09-22'):
    # Assuming today’s date is 2014-12-31, the products added in last 100 days will be those before 2014-09-22
    cmd1 = ''' update products set percent_discount=%s where date_added>%s  '''
    cmd2 = ''' create table holi_deals select * from products where date_added>%s '''
    cmd3 = ''' select * from holi_deals '''

    try:
        cursor.execute(cmd1, (percent_discount, added_after))
        mydb.commit()
        cursor.execute(cmd2, (added_after, ))
        mydb.commit()
        cursor.execute(cmd3)
    except Error as e:
        print(e)

update_discount()
x=cursor.fetchall()
for t in x:
    print(t)    