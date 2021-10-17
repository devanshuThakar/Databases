#deleting the record of deleted user in views, purchases, views, cart, and orders. 
# Deleting user from other tables first as user is foreign key
delete from address where user_id=5;
delete from views where user_id=5;
delete from cart where user_id=5;
delete from orders where user_id=5;
# purcahse of user_id=5 cannot be deleted since it is a foreign key for review;
#update purchases set user_id=NULL where user_id=5;
#deleting a user with user_id = 5 and user_name = "Wu"
delete from users where user_id=5;
update reviews set user_id=NULL, user_name="anonymous" where user_id=5;