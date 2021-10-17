#Q1-21
import mysql.connector
from mysql.connector import Error
import pandas as pd

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="e_commerce"
)

cursor = mydb.cursor()

def recommand(user_id=1, product_type="electronics"):
    cmd = ''' select product_id, quantity, purchase_date, type, subtype, product_name, creator, price from 
                purchases join products using(product_id) where user_id=%s and type=%s; '''
    cursor.execute(cmd, (user_id, product_type))
    purchased = cursor.fetchall()
    purchased = [('product_id', 'quantity', 'purcahse_date', 'type', 'subtype', 'product_name', 'creator', 'price')]+purchased
    
    preferences = {}
    
    for i in range(1, len(purchased)):
        # Storing a score to corrosponding to subtype attribute
        if (not (purchased[i][4] in preferences) ):
            preferences[purchased[i][4]] = 10
        else:
            preferences[purchased[i][4]]+=1
        # Storing a scroe to creator attribute
        if (not (purchased[i][6] in preferences) ):
            preferences[purchased[i][6]] = 20
        else:
            preferences[purchased[i][6]]+=2
    
    cmd = ''' select product_id, view_datetime, type, subtype, product_name, creator, price 
            from views join products using(product_id) where user_id=%s and type=%s; ''' 
    cursor.execute(cmd, (user_id, product_type))
    viewed = cursor.fetchall()
    viewed = [('product_id', 'quantity', 'purcahse_date', 'type', 'subtype', 'product_name', 'creator', 'price')]+viewed

    for i in range(1 ,len(viewed)):
        # Storing a score to corrosponding to subtype attribute
        if (not (viewed[i][3] in preferences)):
            preferences[viewed[i][3]] = 5
        else:
            preferences[viewed[i][3]]+=0.5
        # Storing a scroe to creator attribute
        if (not (viewed[i][5] in preferences)):
            preferences[viewed[i][5]] = 10
        else:
            preferences.update({viewed[i][5] : preferences[viewed[i][5]]+1 }) 
            
    cmd = ''' select product_id, product_name, subtype, product_name, creator from products where type=%s; '''
    cursor.execute(cmd, (product_type, ))
    products = cursor.fetchall()
    
    recommended = []
    
    for p in products:
        p_subtype_score, p_creator_score = 0, 0
        F_score = 0
        if(p[2] in preferences and p[4] in preferences):
            p_subtype_score, p_creator_score = preferences[p[2]], preferences[p[4]]
            F_score = p_creator_score*p_subtype_score
        elif (p[2] in preferences):
            p_subtype_score = preferences[p[2]]
            F_score = p_subtype_score + p_creator_score
        elif (p[4] in preferences):
            p_creator_score = preferences[p[4]]
            F_score = p_subtype_score + p_creator_score
        recommended.append((p[0], F_score))

    recommended.sort(key= lambda x:x[1], reverse=True)
    
    top10 = []
    for i in range(10):
        cmd = ''' select product_id, type, subtype, product_name, creator, price from products where product_id=%s '''
        cursor.execute(cmd, (recommended[i][0], ))
        top10 += cursor.fetchall()
    top10 = pd.DataFrame(top10)
    print(top10)
print("Top 10 recommended electronics product for user_id=1")
recommand()
