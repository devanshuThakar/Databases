import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()  

def delete_user(user_id):
    cmd1 = "delete from users where user_id=%s"
    cursor.execute(cmd1, (user_id,))
    cmd2 = "update reviews set user_id=NULL, user_name=%s where user_id=%s"
    cursor.execute(cmd2, ("anonymous",user_id))

    mydb.commit()

delete_user('5')