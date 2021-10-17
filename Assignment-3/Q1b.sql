select player_name as name, 
case 
	when frequency is not null then frequency 
    else 0 
end as frequency 
from 
(select player_out, count(kind_out) as frequency, kind_out  
from wicket_taken where kind_out='caught' group by player_out) as caught_out 
right outer join player on player_id=player_out 
order by frequency asc, player_name asc;