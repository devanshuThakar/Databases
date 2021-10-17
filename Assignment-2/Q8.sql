#insert some orders 
# insert into orders values ("O21", 9, "PR20", 400, 1, "2020-02-12 09:40:09");
# insert into orders values ("O22", 9, "PR21", 2250, 2, "2020-08-12 09:40:09");
# insert into orders values ("O23", 9, "PR22", 18999, 1, "2020-12-12 09:40:09");
select * from orders 
where user_id in(select user_id from users where sign_up in(select max(sign_up) as sign_up from users)) 
order by datetime desc 
limit 3;