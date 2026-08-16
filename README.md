# Esports-Events-Management-System
A relational database system for managing esports tournaments — tracking games, teams, players, matches, results, and sponsorships in MySQL, with analytical queries and views for tournament, player, and team performance insights.
# 🎮 Esports Management System

A relational database project for managing esports tournaments, teams, players, matches, and performance statistics — built in MySQL.

## Overview

This project models the core operations of an esports organization: games, teams, players, tournaments, match scheduling, results, sponsorships, and prize distribution. It includes sample data for a set of Indian esports tournaments and teams, plus analytical queries for tournament, player, and team performance.

## Project Structure

```
esports-management-system/
├── README.md
├── database/
│   ├── 01_create_database.sql   # Database creation
│   ├── 02_create_tables.sql     # Table schema
│   ├── 03_insert_data.sql       # Sample data
│   └── 04_queries.sql           # Analysis queries & views
├── diagrams/
│   └── er-diagram.png           # Entity-relationship diagram
└── screenshots/
    ├── tournament-analysis.png
    ├── player-performance.png
    └── team-performance.png
```

## Database Schema

| Table | Description |
|---|---|
| `games` | Games featured in tournaments (genre, developer, team size) |
| `teams` | Registered esports teams |
| `players` | Players and their team affiliation |
| `tournaments` | Tournament details, prize pools, and status |
| `tournament_teams` | Team registrations per tournament |
| `matches` | Scheduled and completed matches |
| `match_results` | Match outcomes and scores |
| `player_stats` | Per-match player stats (kills, deaths, assists, score) |
| `sponsors` | Sponsor details |
| `tournament_sponsors` | Sponsorship amounts per tournament |
| `prizes` | Prize distribution by tournament and placement |

## Setup

Run the SQL files in order using MySQL Workbench or the CLI:

```bash
mysql -u <username> -p < database/01_create_database.sql
mysql -u <username> -p < database/02_create_tables.sql
mysql -u <username> -p < database/03_insert_data.sql
mysql -u <username> -p < database/04_queries.sql
```

## Sample Analysis

`04_queries.sql` includes queries and views for:

- **Tournament analysis** — upcoming/completed tournaments, prize pool rankings, average prize pool, teams per tournament, and a `tournament_overview` view
- **Player performance** — total kills/deaths/assists, K/D ratio, top 5 leaderboards by kills/score/K-D, and a `player_performance` view
- **Team & match insights** — match schedules with team names, scheduled matches, and player-to-team lookups

## Screenshots

See `screenshots/` for sample query results from MySQL Workbench, including tournament analysis, player performance, and team performance views.
