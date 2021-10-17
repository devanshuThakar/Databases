 use sports_data;
 -- Ignore the commented queries
 select * from (
 select player_name as batsman_name, (runs_scored/match_played) as value  from 
 (select sum(runs_scored) as runs_scored, striker,  season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=2) as season5 using(match_id)) 
group by striker) as runs_scored join 
(select count(distinct match_id) as match_played, striker,  season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=2) as season5 using(match_id)) 
group by striker) as matchs_played using(striker) 
join 
player on striker=player_id 
order by (runs_scored/match_played) desc 
limit 3 ) as top_3 
order by batsman_name;
 
 -- Finding the runs scored by a player in season=2
 /* select sum(runs_scored) as runs_scored, striker,  season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=2) as season5 using(match_id)) 
group by striker limit 10;  */

-- Finding number of matches played in season 2 by a player
 /* select count(distinct match_id) as match_played, striker,  season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=2) as season5 using(match_id)) 
group by striker limit 10; */