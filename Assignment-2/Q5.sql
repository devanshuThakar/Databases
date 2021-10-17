select phone, email 
from users 
where (city="Madrid" and user_id in(select user_id from purchases where (purchase_price*quantity > 10000)));