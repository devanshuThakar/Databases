#insert into purchases values("PU21", 1, "PR17", 3770, 1, "2020-12-20");
select retailer_id from products where product_id in(select product_id from  purchases where user_id=1);