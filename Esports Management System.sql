CREATE DATABASE ESPORTS;
USE ESPORTS;
CREATE TABLE games(
game_id INT PRIMARY KEY,
game_name VARCHAR(50) NOT NULL,
genre VARCHAR(50) NOT NULL,
developer_name VARCHAR(50) NOT NULL,
maximum_team_size INT NOT NULL
);
DESC games;
CREATE TABLE teams(
team_id INT PRIMARY KEY NOT NULL,
team_name VARCHAR(50) UNIQUE NOT NULL,
country VARCHAR(50) NOT NULL,
team_leader_name VARCHAR(50) NOT NULL,
forming_year YEAR NOT NULL
);
DESC teams;
CREATE TABLE players(
player_id INT PRIMARY KEY NOT NULL,
player_game_name VARCHAR(50) NOT NULL,
real_name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
team_role VARCHAR(50) NOT NULL,
team_id INT NOT NULL
);
CREATE TABLE tournaments(
tournament_id INT PRIMARY KEY NOT NULL,
tournament_name VARCHAR(50) NOT NULL,
game_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
location VARCHAR(100) NOT NULL,
prize_pool DECIMAL(12,2) NOT NULL,
tournament_status VARCHAR(50) NOT NULL
);
DESC players;
DESC tournaments;
CREATE TABLE tournament_teams(
tournament_id INT NOT NULL,
team_id INT NOT NULL,
registration_date DATE NOT NULL,
seed_number INT NOT NULL
);
DESC tournament_teams;
CREATE TABLE matches(          /*for single and individual matches between two teams*/
match_id INT PRIMARY KEY NOT NULL,
tournament_id INT NOT NULL,
team1_id INT NOT NULL,
team2_id INT NOT NULL,
match_date DATE NOT NULL,
match_time TIME NOT NULL,
round_name VARCHAR(50) NOT NULL,  /*for eg:semifinal or final or quarter finals etc*/
match_status VARCHAR(50) NOT NULL
);
DESC matches;
CREATE TABLE match_results(
result_id INT PRIMARY KEY NOT NULL,
match_id INT NOT NULL,
winning_team_id INT NOT NULL,
team1_score INT NOT NULL,
team2_score INT NOT NULL
);
DESC match_results;
CREATE TABLE player_stats(
stat_id INT PRIMARY KEY NOT NULL,
match_id INT NOT NULL,
player_id INT NOT NULL,
kills INT NOT NULL,
deaths INT NOT NULL,
assists INT NOT NULL,
score INT NOT NULL
);
DESC player_stats;
CREATE TABLE sponsors(
sponsor_id INT PRIMARY KEY NOT NULL,
sponsor_name VARCHAR(50) NOT NULL,
industry VARCHAR(50) NOT NULL,                 /*WHAT KIND OF COMPANY IS THE SPONSOR?*/
contact_email VARCHAR(50) NOT NULL
);
DESC sponsors;
CREATE TABLE tournament_sponsors(
tourunament_id INT PRIMARY KEY NOT NULL,
sponsor_id INT NOT NULL,
sponsorhsip_amount FLOAT(50) NOT NULL
);
DESC tournament_sponsors;
CREATE TABLE prizes(
prize_id INT PRIMARY KEY NOT NULL,
tournament_id INT NOT NULL,
team_id INT NOT NULL,
position INT NOT NULL,
prize_amount FLOAT(50) NOT NULL
);
DESC prizes;
/*insertion of sample data------------------------------>*/
INSERT INTO games VALUES
(1,'VALORANT','FPS','RIOT GAMES',5),
(2,'COUNTER STRIKE 2','FPS','VALVE',5),
(3,'BGMI','BATTLE ROYALE','KRAFTON',4),
(4,'LEAGUE OF LEGENDS','MOBA','RIOT GAMES',5),
(5,'DOTA 2','MOBA','VALVE',5),
(6,'APEX LEGENDS','BATTLE ROYALE','RESPAWN ENTERTAINMENT EA',5),
(7,'FORTNITE','BATTLE ROYALE','EPIC GAMES',6),
(8,'RAINBOW SIX SIEGE','FPS','UBISOFT',4),
(9,'OVERWATCH 2','HERO SHOOTER','BLIZZARD ENTERTAINMENT',5),
(10,'ROCKET LEAGUE','SPORTS','PSYONIX AND EPIC GAMES',5),
(11,'MOBILE LEGENDS: BANG BANG ','MOBA','MOONTON',5),
(12,'HONOR OF KINGS','MOBA','TIMI STUDIO GROUP',6),
(13,'FREE FIRE INDIA','BATTLE ROYALE','GARENA',4),
(14,'EA SPORTS FC 26','SPORTS','EA SPORTS',11),
(15,'CALL OF DUTY: WARZONE','BATTLE ROYALE','INFINITY WARD/ RAVEN/ ACTIVISION','4'),
(16,'CALL OF DUTY: BLACK OPS 7','FPS','TREYARCH/ RAVEN/ ACTIVISION',4),
(17,'STREET FIGHTER 6','FIGHTING','CAPCOM',2),
(18,'TEKKEN 8','FIGHTING','BANDAI NAMCO STUDIOS',2),
(19,'TEAMFIGHT TACTICS','AUTO BATTLER','RIOT GAMES',2),
(20,'TRACKMANIA','RACING','UBISOFT NADEO/ UBISOFT',4),
(21,'CROSSFIRE','FPS','SMILE GATE',4),
(22,'STAR CRAFT II','RTS','BLIZZARD ENTERTAINMENT',4),
(23,'AGE OF EMPIRES IV','RTS','RELIC ENTERTAINMENT',6),
(24,'CHESS.com','STRATEGY/ BOARD','Chess.com',1);
SELECT * FROM games;
USE esports;
SELECT*FROM games;
/*team_id INT PRIMARY KEY NOT NULL,
team_name VARCHAR(50) UNIQUE NOT NULL,
country VARCHAR(50) NOT NULL,
team_leader_name VARCHAR(50) NOT NULL,
forming_year YEAR NOT NULL*/
INSERT INTO teams VALUES
(1, 'Team Alpha', 'India', 'Arjun', 2022),
(2, 'Team Nova', 'India', 'Rahul', 2021),
(3, 'Team Phoenix', 'India', 'Rohan', 2023),
(4, 'Team Titans', 'India', 'Aman', 2020),
(5, 'Team X', 'India', 'Sahil', 2022),
(6, 'Shadow Esports', 'India', 'Karan', 2021),
(7, 'Vortex Gaming', 'India', 'Aditya', 2023),
(8, 'Thunder Squad', 'India', 'Vikram', 2019),
(9, 'Blaze Esports', 'India', 'Rohit', 2022),
(10, 'Elite Warriors', 'India', 'Ankit', 2020),
(11, 'Dragon Force', 'India', 'Aryan', 2021),
(12, 'Night Hawks', 'India', 'Abhishek', 2023),
(13, 'Cyber Kings', 'India', 'Dev', 2022),
(14, 'Storm Breakers', 'India', 'Yash', 2020),
(15, 'Infinity Esports', 'India', 'Raj', 2019),
(16, 'Galaxy Warriors', 'India', 'Neeraj', 2021),
(17, 'Venom Gaming', 'India', 'Harsh', 2023),
(18, 'Fire Dragons', 'India', 'Manish', 2020),
(19, 'Rising Stars', 'India', 'Ayush', 2022),
(20, 'Dark Knights', 'India', 'Varun', 2021),
(21, 'Team Rabona', 'Nepal', 'Suman', 2020),
(22, 'Ethador Warriors', 'Germany', 'Raymond', 2022),
(23, 'Colombo Kings', 'Sri Lanka', 'Dilan', 2021),
(24, 'GOD MODE', 'Israel', 'John', 2020),
(25, 'Seoul Titans', 'South Korea', 'Min-jun', 2019),
(26, 'Tokyo Storm', 'Japan', 'Haruto', 2021),
(27, 'Singapore Phoenix', 'Singapore', 'Wei', 2022),
(28, 'London Knights', 'UK', 'Oliver', 2019),
(29, 'Berlin Wolves', 'Germany', 'Lukas', 2020),
(30, 'American Eagles', 'USA', 'Ethan', 2021);
SELECT*FROM teams;
INSERT INTO players VALUES
(1, 'ShadowX', 'Arjun Das', 'India', 'Duelist', 1),
(2, 'Blaze', 'Rahul Sen', 'India', 'Controller', 1),
(3, 'Frost', 'Rohan Roy', 'India', 'Sentinel', 1),
(4, 'Phantom', 'Karan Das', 'India', 'Duelist', 2),
(5, 'Nova', 'Aditya Paul', 'India', 'Initiator', 2),
(6, 'Ghost', 'Aman Singh', 'India', 'Controller', 2),
(7, 'Phoenix', 'Rishi Das', 'India', 'Duelist', 3),
(8, 'ViperX', 'Sahil Roy', 'India', 'Controller', 3),
(9, 'Ace', 'Dev Sharma', 'India', 'Sentinel', 3),
(10, 'Titan', 'Vikram Das', 'India', 'Duelist', 4),
(11, 'Storm', 'Yash Singh', 'India', 'Initiator', 4),
(12, 'Hawk', 'Raj Paul', 'India', 'Sentinel', 4),
(13, 'Venom', 'Aryan Das', 'India', 'Duelist', 5),
(14, 'Cobra', 'Harsh Roy', 'India', 'Controller', 5),
(15, 'Spark', 'Ayush Sharma', 'India', 'Initiator', 5),
(16, 'Reaper', 'Karan Singh', 'India', 'Duelist', 6),
(17, 'Cypher', 'Ankit Das', 'India', 'Sentinel', 6),
(18, 'Rush', 'Rohit Paul', 'India', 'Initiator', 6),
(19, 'Vortex', 'Neeraj Das', 'India', 'Duelist', 7),
(20, 'Zero', 'Dev Roy', 'India', 'Controller', 7),
(21, 'Matrix', 'Abhishek Singh', 'India', 'Sentinel', 7),
(22, 'Thunder', 'Vikram Roy', 'India', 'Duelist', 8),
(23, 'Bolt', 'Manish Das', 'India', 'Initiator', 8),
(24, 'Dark', 'Varun Sharma', 'India', 'Controller', 8),
(25, 'BlazeX', 'Rohit Das', 'India', 'Duelist', 9),
(26, 'Inferno', 'Yash Roy', 'India', 'Controller', 9),
(27, 'Silent', 'Ayush Das', 'India', 'Sentinel', 9),
(28, 'Elite', 'Ankit Sharma', 'India', 'Duelist', 10),
(29, 'Warrior', 'Aryan Roy', 'India', 'Initiator', 10),
(30, 'Sniper', 'Raj Singh', 'India', 'Sentinel', 10);
SELECT*FROM players;
INSERT INTO tournaments VALUES
(1, 'India Esports Championship', 1, '2026-09-01', '2026-09-05', 'Guwahati', 500000.00, 'Upcoming'),
(2, 'Assam Valorant Cup', 1, '2026-09-10', '2026-09-12', 'Dibrugarh', 200000.00, 'Upcoming'),
(3, 'National Valorant League', 1, '2026-10-01', '2026-10-15', 'Mumbai', 1000000.00, 'Upcoming'),
(4, 'CS2 India Masters', 2, '2026-09-20', '2026-09-25', 'Delhi', 750000.00, 'Upcoming'),
(5, 'Northeast Gaming Cup', 2, '2026-08-01', '2026-08-04', 'Shillong', 300000.00, 'Completed'),
(6, 'Indian MOBA Championship', 3, '2026-10-05', '2026-10-12', 'Bengaluru', 900000.00, 'Upcoming'),
(7, 'Battlegrounds India Cup', 5, '2026-09-15', '2026-09-18', 'Kolkata', 600000.00, 'Upcoming'),
(8, 'PUBG Mobile Masters', 6, '2026-11-01', '2026-11-07', 'Hyderabad', 1200000.00, 'Upcoming'),
(9, 'Battle Royale India Open', 7, '2026-08-10', '2026-08-14', 'Chennai', 400000.00, 'Completed'),
(10, 'Fortnite India Challenge', 8, '2026-10-20', '2026-10-23', 'Pune', 350000.00, 'Upcoming'),
(11, 'Rainbow Six India League', 9, '2026-11-10', '2026-11-15', 'Mumbai', 500000.00, 'Upcoming'),
(12, 'Overwatch India Cup', 10, '2026-09-25', '2026-09-28', 'Delhi', 300000.00, 'Upcoming'),
(13, 'Rocket League India Open', 11, '2026-10-05', '2026-10-08', 'Bengaluru', 250000.00, 'Upcoming'),
(14, 'Mobile Legends India Cup', 12, '2026-08-20', '2026-08-23', 'Kolkata', 450000.00, 'Upcoming'),
(15, 'Honor of Kings Championship', 13, '2026-11-20', '2026-11-25', 'Hyderabad', 700000.00, 'Upcoming'),
(16, 'Free Fire India Masters', 14, '2026-09-05', '2026-09-10', 'Mumbai', 550000.00, 'Upcoming'),
(17, 'Street Fighter India Clash', 17, '2026-10-15', '2026-10-17', 'Delhi', 150000.00, 'Upcoming'),
(18, 'Tekken India Championship', 18, '2026-11-05', '2026-11-07', 'Pune', 200000.00, 'Upcoming'),
(19, 'TFT India Invitational', 19, '2026-09-28', '2026-09-30', 'Chennai', 180000.00, 'Upcoming'),
(20, 'Trackmania India Cup', 20, '2026-10-25', '2026-10-27', 'Bengaluru', 120000.00, 'Upcoming');
SELECT*FROM tournaments;
INSERT INTO tournament_teams VALUES
-- India Esports Championship
(1, 1, '2026-08-01', 1),
(1, 2, '2026-08-01', 2),
(1, 3, '2026-08-02', 3),
(1, 4, '2026-08-02', 4),
(1, 5, '2026-08-03', 5),
(1, 6, '2026-08-03', 6),
(1, 7, '2026-08-04', 7),
(1, 8, '2026-08-04', 8),
-- Assam Valorant Cup
(2, 1, '2026-08-05', 1),
(2, 3, '2026-08-05', 2),
(2, 5, '2026-08-06', 3),
(2, 7, '2026-08-06', 4),
-- CS2 India Masters
(4, 2, '2026-08-10', 1),
(4, 4, '2026-08-10', 2),
(4, 6, '2026-08-11', 3),
(4, 8, '2026-08-11', 4);
 ALTER TABLE tournament_teams 
 MODIFY tournament_id INT NOT NULL;
 DESC tournament_teams;
 ALTER TABLE tournament_sponsors
 MODIFY tournament_id INT NOT NULL;
 ALTER TABLE tournament_sponsors
 RENAME COLUMN tourunament_id TO tournament_id;
 DESC tournament_sponsors;
 DESC tournament_teams;
 ALTER TABLE tournament_teams MODIFY tournament_id INT;
 DESC tournament_teams;
 ALTER TABLE tournaments MODIFY tournament_id INT;
 INSERT INTO tournament_teams VALUES
-- India Esports Championship
(1, 1, '2026-08-01', 1),
(1, 2, '2026-08-01', 2),
(1, 3, '2026-08-02', 3),
(1, 4, '2026-08-02', 4),
(1, 5, '2026-08-03', 5),
(1, 6, '2026-08-03', 6),
(1, 7, '2026-08-04', 7),
(1, 8, '2026-08-04', 8),
-- Assam Valorant Cup
(2, 1, '2026-08-05', 1),
(2, 3, '2026-08-05', 2),
(2, 5, '2026-08-06', 3),
(2, 7, '2026-08-06', 4),
-- CS2 India Masters
(4, 2, '2026-08-10', 1),
(4, 4, '2026-08-10', 2),
(4, 6, '2026-08-11', 3),
(4, 8, '2026-08-11', 4);
ALTER TABLE tournament_teams DROP PRIMARY KEY;
DESC tournament_teams;
 INSERT INTO tournament_teams VALUES
-- India Esports Championship
(1, 1, '2026-08-01', 1),
(1, 2, '2026-08-01', 2),
(1, 3, '2026-08-02', 3),
(1, 4, '2026-08-02', 4),
(1, 5, '2026-08-03', 5),
(1, 6, '2026-08-03', 6),
(1, 7, '2026-08-04', 7),
(1, 8, '2026-08-04', 8),
-- Assam Valorant Cup
(2, 1, '2026-08-05', 1),
(2, 3, '2026-08-05', 2),
(2, 5, '2026-08-06', 3),
(2, 7, '2026-08-06', 4),
-- CS2 India Masters
(4, 2, '2026-08-10', 1),
(4, 4, '2026-08-10', 2),
(4, 6, '2026-08-11', 3),
(4, 8, '2026-08-11', 4);
SELECT*FROM tournament_teams;
INSERT INTO matches VALUES
-- India Esports Championship
(1, 1, 1, 2, '2026-09-01',' 18:00:00', 'Quarter Final', 'Completed'),
(2, 1, 3, 4, '2026-09-01','20:00:00', 'Quarter Final', 'Completed'),
(3, 1, 5, 6, '2026-09-02','18:00:00', 'Quarter Final', 'Completed'),
(4, 1, 7, 8, '2026-09-02','20:00:00', 'Quarter Final', 'Completed'),
(5, 1, 1, 3, '2026-09-03','18:00:00', 'Semi Final', 'Completed'),
(6, 1, 5, 7, '2026-09-03','20:00:00', 'Semi Final', 'Completed'),
(7, 1, 1, 5, '2026-09-05','19:00:00', 'Final', 'Scheduled'),
-- Assam Valorant Cup
(8, 2, 1, 3, '2026-09-10','18:00:00', 'Semi Final', 'Scheduled'),
(9, 2, 5, 7, '2026-09-10','20:00:00', 'Semi Final', 'Scheduled'),
-- CS2 India Masters
(10, 4, 2, 4, '2026-09-20','18:00:00', 'Semi Final', 'Scheduled'),
(11, 4, 6, 8, '2026-09-20','20:00:00', 'Semi Final', 'Scheduled');
DESC matches;
INSERT INTO matches VALUES
-- India Esports Championship
(1, 1, 1, 2, '2026-09-01','18:00:00', 'Quarter Final', 'Completed'),
(2, 1, 3, 4, '2026-09-01','20:00:00', 'Quarter Final', 'Completed'),
(3, 1, 5, 6, '2026-09-02','18:00:00', 'Quarter Final', 'Completed'),
(4, 1, 7, 8, '2026-09-02','20:00:00', 'Quarter Final', 'Completed'),
(5, 1, 1, 3, '2026-09-03','18:00:00', 'Semi Final', 'Completed'),
(6, 1, 5, 7, '2026-09-03','20:00:00', 'Semi Final', 'Completed'),
(7, 1, 1, 5, '2026-09-05','19:00:00', 'Final', 'Scheduled'),
-- Assam Valorant Cup
(8, 2, 1, 3, '2026-09-10','18:00:00', 'Semi Final', 'Scheduled'),
(9, 2, 5, 7, '2026-09-10','20:00:00', 'Semi Final', 'Scheduled'),
-- CS2 India Masters
(10, 4, 2, 4, '2026-09-20','18:00:00', 'Semi Final', 'Scheduled'),
(11, 4, 6, 8, '2026-09-20','20:00:00', 'Semi Final', 'Scheduled');
DESC matches;
ALTER TABLE matches DROP PRIMARY KEY;
SELECT*FROM matches;
INSERT INTO match_results VALUES
(1, 6, 12, 10,6),
(3, 1, 11, 8,6),
(2, 2, 7, 7,8),
(4, 3, 8, 11,7),
(5, 4, 6, 9,6),
(6, 5, 10, 6,4);
DESC match_results;
SELECT*FROM match_results;
INSERT INTO player_stats VALUES  /*MATCH 1*/
(1, 1, 1, 24, 12, 8, 320),
(2, 1, 2, 19, 13, 11, 285),
(3, 1, 3, 17, 14, 9, 260),
(4, 1, 4, 18, 16, 6, 250),
(5, 1, 5, 15, 18, 7, 225),
(6, 1, 6, 12, 19, 5, 200);
INSERT INTO player_stats VALUES   /*MATCH 2*/
(7, 2, 7, 26, 11, 10, 340),
(8, 2, 8, 21, 13, 8, 300),
(9, 2, 9, 18, 15, 7, 275),
(10, 2, 10, 19, 17, 6, 260),
(11, 2, 11, 15, 20, 8, 230),
(12, 2, 12, 13, 21, 5, 205);
INSERT INTO player_stats VALUES    /*MATCH 3*/
(13, 3, 13, 25, 10, 9, 335),
(14, 3, 14, 20, 13, 11, 295),
(15, 3, 15, 16, 15, 8, 260),
(16, 3, 16, 14, 19, 7, 230),
(17, 3, 17, 12, 20, 9, 215),
(18, 3, 18, 10, 22, 6, 190);
INSERT INTO player_stats VALUES     /*MATCH 4*/
(19, 4, 19, 27, 12, 12, 350),
(20, 4, 20, 22, 14, 9, 310),
(21, 4, 21, 18, 16, 8, 275),
(22, 4, 22, 20, 18, 7, 270),
(23, 4, 23, 16, 20, 10, 240),
(24, 4, 24, 14, 21, 6, 215);
INSERT INTO player_stats VALUES      /*MATCH 5*/
(25, 5, 1, 28, 11, 10, 365),
(26, 5, 2, 22, 14, 12, 315),
(27, 5, 3, 19, 15, 8, 285),
(28, 5, 7, 20, 19, 9, 280),
(29, 5, 8, 17, 21, 7, 250),
(30, 5, 9, 14, 20, 8, 230);
INSERT INTO player_stats VALUES      /*MATCH 6*/
(31, 6, 13, 23, 16, 9, 310),
(32, 6, 14, 19, 18, 11, 285),
(33, 6, 15, 15, 20, 7, 245),
(34, 6, 19, 29, 13, 12, 380),
(35, 6, 20, 24, 15, 10, 330),
(36, 6, 21, 18, 17, 9, 290);
SELECT*FROM player_stats;
/*to see each players total performane*/
UPDATE match_results
SET winning_team_id=7 WHERE result_id=6;
SELECT*FROM match_results;
UPDATE match_results
SET winning_team_id = 1
WHERE result_id = 1;
UPDATE match_results
SET winning_team_id = 5
WHERE result_id = 2;
UPDATE match_results
SET winning_team_id = 3
WHERE result_id = 3;
UPDATE match_results
SET winning_team_id = 7
WHERE result_id = 4;
UPDATE match_results
SET winning_team_id = 1
WHERE result_id = 5;
UPDATE match_results
SET winning_team_id = 19
WHERE result_id = 6;
SELECT*FROM match_results;
ALTER TABLE match_results DROP PRIMARY KEY;
SELECT*FROM match_results;



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




 







 