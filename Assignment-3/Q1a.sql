select player_name as bowler_name, net_runs as runs_scored from ball_by_ball natural join 
(select * from 
(select match_id, innings_no, over_id, 
case 
when extras is not null then extras + over_run  
else over_run end as net_runs  
from ( select match_id, over_id, innings_no, over_run, extras 
from ( select match_id, over_id, innings_no, sum(runs_scored) as over_run 
from batsman_scored group by match_id, over_id, innings_no) as over_runs 
natural left outer join (select  match_id, over_id, innings_no, sum(extra_runs) as extras 
from extra_runs where extra_type in ('noballs', 'wides') group by match_id, over_id, innings_no) as extra_runs) 
as net_over)  as minOve where net_runs= ( select min(net_runs) from (select match_id, innings_no, over_id, 
case when extras is not null then extras + over_run  else over_run end as net_runs  
from ( select match_id, over_id, innings_no, over_run, extras 
from ( select match_id, over_id, innings_no, sum(runs_scored) as over_run 
from batsman_scored group by match_id, over_id, innings_no) as over_runs 
natural left outer join (select  match_id, over_id, innings_no, sum(extra_runs) 
as extras from extra_runs where extra_type in ('noballs', 'wides') group by match_id, over_id, innings_no) 
as extra_runs) as net_over) as minOV ) ) as minOVer join player on bowler=player_id 
group by match_id, over_id, innings_no;