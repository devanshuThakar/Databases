import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()  

def insert_user(unser_id, user_name, last_name, city, phone, email, password, sign_up):
    cmd = "insert into users values(%s, %s, %s, %s, %s, %s, %s, %s)"
    cursor.execute(cmd, (unser_id, user_name, last_name, city, phone, email, password, sign_up))
    mydb.commit()

def insert_address(address_id, user_id, address):
    cmd = ''' insert into address values(%s, %s, %s) '''
    cursor.execute(cmd, (address_id, user_id, address))
    mydb.commit()

def insert_order(order_id, user_id, product_id, price, quantity, datetime):
    cmd = "insert into order values(%s, %s, %s, %s, %s, %s)"
    cursor.execute(cmd, (order_id, user_id, product_id, price, quantity, datetime))
    mydb.commit()

def insert_product(product_id, retailer_id, type, subtype, product_name, creator, date_launch,  price, date_added, percent_discount=0):
    cmd = "insert into products values(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    cursor.execute(cmd, (product_id, retailer_id, type, subtype, product_name, creator, date_launch,  price, date_added, percent_discount))
    mydb.commit()

def insert_purchase(purcahse_id, user_id, product_id, purcahse_price, quantity, purcahse_date):
    cmd = "insert into purchases values(%s, %s, %s, %s, %s, %s)"
    cursor.execute(cmd, (purcahse_id, user_id, product_id, purcahse_price, quantity, purcahse_date))
    mydb.commit()

def insert_retailer(retailer_id, retialer_name, retailer_city, retailer_email):
    cmd = "insert into retailers values(%s, %s, %s, %s)"
    cursor.execute(cmd, (retailer_id, retialer_name, retailer_city, retailer_email))
    mydb.commit()

def insert_review(review_id, user_id, user_name, product_id, purcahse_id, rating, review):
    cmd = "insert into reviews values(%s, %s, %s, %s, %s, %s, %s,)"
    cursor.execute(cmd, (review_id, user_id, user_name, product_id, purcahse_id, rating, review))
    mydb.commit()

def insert_view(user_id, product_id, view_datetime):
    cmd = ''' insert views values(%s, %s, %s) '''
    cursor.execute(cmd, (user_id, product_id, view_datetime))
    mydb.commit()