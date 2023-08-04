USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE game (
	game_id int IDENTITY(1,1) NOT NULL,
	title varchar(50) NOT NULL,
	description varchar (MAX) NOT NULL,
	esrb_rating varchar (10) NOT NULL,
	release_date DATE NOT NULL,
	CONSTRAINT PK_games PRIMARY KEY (game_id)
)

CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE  genre (
    genre_id int IDENTITY(1,1) NOT NULL,
	genre_name varchar (200) NOT NULL,
	CONSTRAINT Pk_genre PRIMARY KEY (genre_id)
)
CREATE TABLE  company (
    company_id int IDENTITY(1,1) NOT NULL,
	company_name varchar (200) NOT NULL
    CONSTRAINT Pk_company PRIMARY KEY (company_id)

)

CREATE TABLE  platform (
    platform_id int IDENTITY(1,1) NOT NULL,
	platform_name varchar (200) NOT NULL,
	CONSTRAINT pk_platform PRIMARY KEY (platform_id)

)
CREATE TABLE game_platform(
  platform_id int NOT NULL ,
  game_id int NOT NULL,
  CONSTRAINT [PK_game_platform] PRIMARY KEY (game_id,platform_id),
  CONSTRAINT [FK_game_platform_game] FOREIGN KEY (game_id) REFERENCES [game] (game_id),
  CONSTRAINT [FK_game_platform_platform] FOREIGN KEY (platform_id) REFERENCES [platform] (platform_id)
)

CREATE TABLE game_publisher(
  publisher_id int NOT NULL ,
  game_id int NOT NULL,
  CONSTRAINT [PK_game_publisher] PRIMARY KEY (game_id,publisher_id),
  CONSTRAINT [FK_game_publisher_game] FOREIGN KEY (game_id) REFERENCES [game] (game_id),
  CONSTRAINT [FK_game_publisher_company] FOREIGN KEY (publisher_id) REFERENCES [company] (company_id)
)
CREATE TABLE game_developer(
  developer_id int NOT NULL ,
  game_id int NOT NULL,
  CONSTRAINT [PK_game_developer] PRIMARY KEY (game_id,developer_id),
  CONSTRAINT [FK_game_developer_game] FOREIGN KEY (game_id) REFERENCES [game] (game_id),
  CONSTRAINT [FK_game_developer_company] FOREIGN KEY (developer_id) REFERENCES [company] (company_id)
)



CREATE TABLE game_genre (
  genre_id int NOT NULL ,
  game_id int NOT NULL,
  CONSTRAINT [PK_game_genre] PRIMARY KEY (game_id,genre_id),
  CONSTRAINT [FK_game_genre_game] FOREIGN KEY (game_id) REFERENCES [game] (game_id),
  CONSTRAINT [FK_game_genre_genre] FOREIGN KEY (genre_id) REFERENCES [genre] (genre_id)
)



--populate default data
--game
INSERT INTO game (title, description, esrb_rating, release_date) VALUES ('Super Mario Bros','Super Mario Bros. is a platform game. In the game, Mario must race through the Mushroom Kingdom and save Princess Toadstool (later Princess Peach) from Bowser. Mario jumps, runs, and walks across each level. The worlds are full of enemies and platforms, and open holes.','E','09/13/1985');
INSERT INTO game (title, description, esrb_rating, release_date) VALUES ('Grand Theft Auto V','Grand Theft Auto V is an action-adventure game played from either a third-person or first-person perspective. Players complete missions�linear scenarios with set objectives�to progress through the story. Outside of the missions, players may freely roam the open world.','M','09/17/2013');
INSERT INTO game (title, description, esrb_rating, release_date) VALUES ('Prey',' In Prey, you awaken aboard Talos I, a space station orbiting the moon in the year 2032. You are the key subject of an experiment meant to alter humanity forever � but things have gone terribly wrong. The space station has been overrun by hostile aliens and you are now being hunted.','M','05/15/2017');


INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
--genre 
INSERT INTO genre (genre_name) VALUES ('Platformer');
INSERT INTO genre (genre_name) VALUES ('Third-Person Shooter');
INSERT INTO genre (genre_name) VALUES ('First-Person Shooter');
INSERT INTO genre (genre_name) VALUES ('Action');
INSERT INTO genre (genre_name) VALUES ('Adventure');
INSERT INTO genre (genre_name) VALUES ('Puzzle');
INSERT INTO genre (genre_name) VALUES ('Open-World');
INSERT INTO genre (genre_name) VALUES ('Horror');
INSERT INTO genre (genre_name) VALUES ('Sports');
INSERT INTO genre (genre_name) VALUES ('Role-Playing');
INSERT INTO genre (genre_name) VALUES ('Fighting');

INSERT INTO game_genre (game_id,genre_id) VALUES (1,1);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,2);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,3);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,4);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,5);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,6);
INSERT INTO game_genre (game_id,genre_id) VALUES (2,7);
INSERT INTO game_genre (game_id,genre_id) VALUES (3,3);
INSERT INTO game_genre (game_id,genre_id) VALUES (3,5);


--company
INSERT INTO company (company_name) VALUES ('Nintendo');
INSERT INTO company (company_name) VALUES ('Rockstar Games')
INSERT INTO company (company_name) VALUES ('Arkane Studios')
INSERT INTO company (company_name) VALUES ('2K')
INSERT INTO company (company_name) VALUES ('Bungie')
INSERT INTO company (company_name) VALUES ('Activision')
INSERT INTO company (company_name) VALUES ('Arc System Works')
INSERT INTO company (company_name) VALUES ('Artoon')
INSERT INTO company (company_name) VALUES ('Bethesda')
INSERT INTO company (company_name) VALUES ('BioWare')
INSERT INTO company (company_name) VALUES ('Capcom')
INSERT INTO company (company_name) VALUES ('Epic Games')
INSERT INTO company (company_name) VALUES ('Ubisoft')
INSERT INTO company (company_name) VALUES ('Sega')
INSERT INTO company (company_name) VALUES ('Microsoft')
INSERT INTO company (company_name) VALUES ('Square Enix')

INSERT INTO game_developer (game_id,developer_id) VALUES (1,1);
INSERT INTO game_developer (game_id,developer_id) VALUES (2,2);
INSERT INTO game_developer (game_id,developer_id) VALUES (3,3);

INSERT INTO game_publisher (game_id,publisher_id) VALUES (1,1);
INSERT INTO game_publisher (game_id,publisher_id) VALUES (2,2);
INSERT INTO game_publisher (game_id,publisher_id) VALUES (3,9);

--Platform

INSERT INTO platform (platform_name) VALUES ('NES');
INSERT INTO platform (platform_name) VALUES ('Xbox 360');
INSERT INTO platform (platform_name) VALUES ('Xbox one');
INSERT INTO platform (platform_name) VALUES ('PlayStation 3');
INSERT INTO platform (platform_name) VALUES ('PlayStation 4');
INSERT INTO platform (platform_name) VALUES ('PlayStation 5');
INSERT INTO platform (platform_name) VALUES ('PC');
INSERT INTO platform (platform_name) VALUES ('Nintendo 64');
INSERT INTO platform (platform_name) VALUES ('GameCube');
INSERT INTO platform (platform_name) VALUES ('Xbox X/S');


INSERT INTO game_platform (game_id,platform_id) VALUES (1,1);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,3);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,4);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,5);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,6);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,7);
INSERT INTO game_platform (game_id,platform_id) VALUES (2,10);
INSERT INTO game_platform (game_id,platform_id) VALUES (3,5);
INSERT INTO game_platform (game_id,platform_id) VALUES (3,3);
INSERT INTO game_platform (game_id,platform_id) VALUES (3,7);

GO