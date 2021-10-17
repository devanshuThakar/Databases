select * from products 
where (product_name like '%mi%' and product_id in (select product_id from purchases));