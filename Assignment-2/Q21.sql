-- insert into purchases values("PU29", 1, "PR22", 18990, 1, "2020-11-20");
-- insert into purchases values("PU30", 1, "PR23", 2250, 1, "2019-11-20");
-- insert into purchases values("PU31", 1, "PR25", 99, 1, "2020-10-20");
-- insert into purchases values("PU32", 1, "PR35", 320, 1, "2019-09-20");
-- insert into purchases values("PU33", 1, "PR32", 12980, 1, "2019-12-20");
-- insert into purchases values("PU34", 1, "PR43", 1840, 1, "2020-12-20");
-- insert into purchases values("PU35", 1, "PR35", 320, 1, "2020-08-20"); 
-- insert into purchases values("PU36", 1, "PR40", 12500, 1, "2019-12-20");
select type, product_id from products natural join views where user_id=1;
# Selecting which type of prducts are liked by user, From the above query the answer is 
# electronics type of products were most viewd by user, Based on the latest purchases, top
# 10 electronics product are recommended for the user_id=1
select product_id, product_name 
from purchases 
natural join products where type="electronics" order by purchase_date limit 10; 