update products
set price=price*1.1
 where product_id in(select product_id from views where view_datetime > "2020-10-31 00:00:00" 
 group by product_id having count(user_id)>10);
/* select product_id, price 
 from products 
 where product_id in(select product_id from views where view_datetime > "2020-10-31 00:00:00" 
 group by product_id having count(user_id)>10);  */