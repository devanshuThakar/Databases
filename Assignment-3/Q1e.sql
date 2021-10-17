select player_name as batsman_name, max(runs_scored) as runs 
from player join 
(select striker, match_id , sum(runs_scored) as runs_scored 
	from batsman_scored natural join ball_by_ball group by striker, match_id  having sum(runs_scored)>100) 
as runs_scored on player_id=striker 
group by player_name 
order by player_name asc;