import mysql.connector 
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database = "e_commerce"
)

cursor = mydb.cursor()

def phone_email(city_name, min_tot_purchase):
    cmd = '''select phone, email 
            from users 
        where (city=%s and user_id in(select user_id from purchases where (purchase_price*quantity > %s)));'''
    val = (city_name, min_tot_purchase)
    cursor.execute(cmd, val)

    x=cursor.fetchall()
    for t in x:
        print(t)

phone_email("Madrid", "10000")