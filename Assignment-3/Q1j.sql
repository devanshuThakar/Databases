select player_name as name, total as runs 
from player natural join
(select player_id, sum(match_runs) as total 
from
(select match_id, striker as player_id, season_id, sum(runs_scored) as match_runs 
		from ( (ball_by_ball natural join batsman_scored) natural join 
		(select match_id, season_id from sports_data.match 
		where season_id=3) as season3)  
group by striker, match_id) as season_3 natural join player_match 
where role = 'Captain' or role='Captainkeeper' 
group by player_id) as Captain_score 
where total>50 
order by player_name asc;