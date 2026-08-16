/*QUERIES*/




SELECT*FROM games;
SELECT*FROM teams;
SELECT*FROM players;
SELECT*FROM tournaments WHERE tournament_status='UPCOMING';
SELECT*FROM tournaments WHERE tournament_status='COMPLETED';
SELECT*FROM games WHERE genre='FPS';
SELECT tournament_id,tournament_name,tournament_status,start_date FROM tournaments WHERE prize_pool>500000 ORDER BY prize_pool DESC;
USE ESPORTS;
USE ESPORTS;
SELECT * FROM teams WHERE forming_year>2021 ORDER BY forming_year DESC;
SELECT player_id, player_game_name, real_name,country FROM players WHERE country='INDIA'AND player_game_name LIKE 'A%'; 
SELECT p.player_id,p.player_game_name,p.real_name,p.country,t.team_name FROM players p JOIN teams t ON p.team_id=t.team_id;
SELECT m.match_id,m.tournament_id,t1.team_name AS team1,t2.team_name AS team2,m.match_date,m.match_time,m.match_status,m.round_name FROM matches m JOIN teams t1 ON m.team1_id=t1.team_id JOIN teams t2 ON m.team2_id=t2.team_id;
SELECT t.tournament_name,t.prize_pool,COUNT(tt.tournament_id) AS TOTAL_TEAMS_PLAYED FROM tournaments t JOIN tournament_teams tt ON t.tournament_id=tt.tournament_id GROUP BY t.tournament_id,t.tournament_name;
SELECT tournament_name,tournament_id,prize_pool FROM tournaments ORDER BY prize_pool DESC;
SELECT AVG(prize_pool) FROM tournaments AS AVERAGE_PRIZE_POOL;
SELECT*FROM tournaments WHERE tournament_status='Completed';
SELECT*FROM matches WHERE match_status='Scheduled' ORDER BY match_date,match_time DESC;
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.kills) AS TOTAL_KILLS FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY TOTAL_KILLS DESC;
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.deaths) AS TOTAL_DEATHS FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY TOTAL_DEATHS DESC;
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.assists) AS TOTAL_ASSISTS FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY TOTAL_ASSISTS DESC;
USE ESPORTS;
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.kills)AS TOTAL_KILLS,SUM(ps.deaths) AS TOTAL_DEATHS,ROUND(SUM(ps.kills)/NULLIF(SUM(ps.deaths),0),2) AS KD_RATIO FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_game_name,p.player_id ORDER BY KD_RATIO DESC;
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.kills) AS TOTAL_KILLS FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY TOTAL_KILLS DESC LIMIT 5;
SELECT p.player_game_name,p.real_name,p.country,AVG(ps.score) AS AVERAGE_SCORE FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY AVERAGE_SCORE DESC LIMIT 5; 
SELECT p.player_game_name,p.real_name,p.country,SUM(ps.kills) AS TOTAL_KILLS,SUM(ps.deaths) AS TOTAL_DEATHS,ROUND(SUM(ps.kills)/NULLIF(SUM(ps.deaths),0),2) AS KD_RATIO FROM players p JOIN player_stats ps ON p.player_id=ps.player_id GROUP BY p.player_id,p.player_game_name ORDER BY KD_RATIO DESC LIMIT 5;
CREATE VIEW tournament_overview AS SELECT t.tournament_name,g.game_name,t.location,t.start_date,t.end_date,t.prize_pool,t.tournament_status FROM tournaments t JOIN games g ON t.game_id=g.game_id;
SELECT*FROM tournament_overview;
CREATE VIEW player_performance AS
SELECT
p.player_id,
p.player_game_name,
t.team_name,
SUM(ps.kills) AS total_kills,
SUM(ps.deaths) AS total_deaths,
SUM(ps.assists) AS total_assists,
ROUND(AVG(ps.score), 2) AS average_score,
ROUND(
	SUM(ps.kills) / NULLIF(SUM(ps.deaths), 0),
        2
    ) AS kd_ratio
FROM players p
JOIN teams t
ON p.team_id = t.team_id
JOIN player_stats ps
ON p.player_id = ps.player_id
GROUP BY
p.player_id,
p.player_game_name,
t.team_name;
SELECT*FROM player_performance;




 







 
