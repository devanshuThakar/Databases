 select * from users order by sign_up asc limit 2;
 # From the output first and second users are user_id=1 and user_id=6
select product_name,product_id from products where product_id in(select product_id from cart where user_id in(1,6));