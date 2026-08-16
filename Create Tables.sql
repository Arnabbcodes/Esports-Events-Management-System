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
