select user_id, phone, email from users where user_id in(select user_id from cart where quantity<5);