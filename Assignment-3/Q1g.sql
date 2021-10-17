use sports_data;
select avg(value) as value, country_name from 
 (select player_name as batsman_name, country_name, (runs_scored/match_played) as value   
 from  (select sum(runs_scored) as runs_scored, striker  from  (ball_by_ball natural join batsman_scored)  
		group by striker) as runs_scored join  
(select count(distinct match_id) as match_played, striker  from  (ball_by_ball natural join batsman_scored)  
group by striker) as matchs_played using(striker) 
join  
player on striker=player_id ) as new_tab 
group by country_name 
order by value desc;