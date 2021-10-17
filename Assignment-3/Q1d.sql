-- Ignore the commented queries
-- Finding the runs given by a bowler
-- Finding all the wickets taken by a boweler in season=5
select player_name as bowler_name, (runs_given/wicket_taken) as average from 

( (select sum(net_runs) as runs_given, bowler, season_id  from ( (ball_by_ball natural join 
		(select *,
		case 
		when extra_runs is not null then runs_scored+extra_runs 
		else runs_scored  end as net_runs 
		from batsman_scored natural left outer join extra_runs) as net_runs	) join 
		(select match_id, season_id from sports_data.match 
		where season_id=5) as season5 using(match_id)) 
group by bowler) as runs_given join 

(select bowler, count(*) as wicket_taken from 
ball_by_ball natural join wicket_taken join  (select match_id, season_id from sports_data.match  
	where season_id=5 ) as season5 using(match_id) 
    where kind_out not in ('run out','obstructing the field', 'retired hurt')
group by bowler) as wickect_take using(bowler) ) join player on player_id=bowler 
where runs_given/wicket_taken =  
( select min((runs_given/wicket_taken)) as average from 
(  (select sum(net_runs) as runs_given, bowler, season_id  from ( (ball_by_ball natural join 
		(select *,
		case 
		when extra_runs is not null then runs_scored+extra_runs 
		else runs_scored  end as net_runs 
		from batsman_scored natural left outer join extra_runs) as net_runs	) join 
		(select match_id, season_id from sports_data.match 
		where season_id=5) as season5 using(match_id)) 
group by bowler) as runs_given join 

(select bowler, count(*) as wicket_taken from 
ball_by_ball natural join wicket_taken join  (select match_id, season_id from sports_data.match  
	where season_id=5 ) as season5 using(match_id) 
    where kind_out not in ('run out','obstructing the field', 'retired hurt')
group by bowler) as wickect_take using(bowler) ) join player on player_id=bowler );

-- Finding the runs given by a bowler
/* select sum(net_runs) as runs_given, bowler, season_id  from ( (ball_by_ball natural join 
		(select *,
		case 
		when extra_runs is not null then runs_scored+extra_runs 
		else runs_scored  end as net_runs 
		from batsman_scored natural left outer join extra_runs) as net_runs	) join 
		(select match_id, season_id from sports_data.match 
		where season_id=5) as season5 using(match_id)) 
group by bowler;  */

-- (select *,
-- case 
-- when extra_runs is not null then runs_scored+extra_runs 
-- else runs_scored  end as net_runs 
-- from batsman_scored natural left outer join extra_runs) as net_runs

/* select sum(runs_scored) as runs_given, bowler, season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=5) as season5 using(match_id)) 
group by bowler */

-- Finding all the wickets taken by a boweler in season=5
/* select bowler, count(*) as wicket_taken from 
ball_by_ball natural join wicket_taken join  (select match_id, season_id from sports_data.match  
	where season_id=5 and kind_out not in ('run out','obstructing the field', 'retired hurt')) as season5 using(match_id) 
group by bowler limit 10; */

/* select player_name as name, (runs_given/wicket_taken) as average from 
( (select sum(runs_scored) as runs_given, bowler, season_id  from ( (ball_by_ball natural join batsman_scored) join 
		(select match_id, season_id from sports_data.match 
		where season_id=5) as season5 using(match_id)) 
group by bowler) as runs_given join 
(select bowler, count(*) as wicket_taken from 
ball_by_ball natural join wicket_taken join  (select match_id, season_id from sports_data.match  
	where season_id=5) as season5 using(match_id) 
group by bowler) as wickect_take using(bowler) ) join player on player_id=bowler 
limit 10; */