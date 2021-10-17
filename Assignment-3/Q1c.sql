select venue, total_legby_runs as  number_of_lebgy_runs  
from (select * 
from (select venue, count(extra_type) as number_of_legby, sum(extra_runs) as total_legby_runs, extra_type 
from extra_runs join sports_data.match using(match_id) 
where extra_type='legbyes'  group by venue) as total_legby_runs ) as legby_runs 
where  total_legby_runs= (select max(total_legby_runs) 
from (select venue, count(extra_type) as number_of_legby, sum(extra_runs) as total_legby_runs, extra_type 
from extra_runs join sports_data.match using(match_id) where extra_type='legbyes'  group by venue) as total_legby_runs );