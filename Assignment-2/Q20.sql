 update products set percent_discount=15 where date_added>"2014-09-22";
 create table holi_deals select * from products where date_added>"2014-09-22";
 select * from holi_deals;