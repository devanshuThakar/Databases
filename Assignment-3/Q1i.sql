create view India_Players as
(select player_name as name, sum(runs_scored) as runs  
from ball_by_ball natural join batsman_scored join player on player_id=striker 
where country_name='India'
group by striker  
order by player_name, runs);
select * from India_Players;