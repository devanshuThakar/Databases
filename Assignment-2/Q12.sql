-- insert into purchases values("PU22", 7, "PR22", 18990, 1, "2020-11-20");
-- insert into purchases values("PU26", 7, "PR23", 2250, 1, "2019-11-20");
-- insert into purchases values("PU22", 7, "PR25", 99, 1, "2020-10-20");
-- insert into purchases values("PU23", 7, "PR35", 320, 1, "2019-09-20");
-- insert into purchases values("PU24", 7, "PR32", 12980, 1, "2019-12-20");
-- insert into purchases values("PU25", 7, "PR43", 1840, 1, "2020-12-20");
-- insert into purchases values("PU27", 7, "PR35", 320, 1, "2020-08-20"); 
-- insert into purchases values("PU28", 28, "PR40", 12500, 1, "2019-12-20"); 
 select user_id, purchase_id, type, product_id 
 from users natural join purchases natural join products group by type having count(type)>3;
