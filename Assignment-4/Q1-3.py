import mysql.connector 
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database = "e_commerce"
)

cursor = mydb.cursor()

def increment_price(price_below=5000, increment_percent=10, total_views=10, date_threshold='2020-10-31 00:00:00'):
    increment_percent = str(1 + increment_percent/100)
    cmd = ''' update products set price=price*%s
            where price<%s and 
            product_id in(select product_id from views where view_datetime > %s group by product_id having count(user_id)>%s) '''
    val = (increment_percent, str(price_below), date_threshold , str(total_views))
    cursor.execute(cmd, (val))

    mydb.commit()

increment_price()
x=cursor.fetchall
print(x)