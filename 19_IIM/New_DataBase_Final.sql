CREATE schema marvel;
use marvel;

CREATE TABLE SERIES_NAME (
Series VARCHAR(45),
CONSTRAINT Series_PK PRIMARY KEY(Series));

INSERT INTO SERIES_NAME VALUES ('Ant-Man');
INSERT INTO SERIES_NAME VALUES ('Avengers');
INSERT INTO SERIES_NAME VALUES ('Captain America');
INSERT INTO SERIES_NAME VALUES ('Doctor Strange');
INSERT INTO SERIES_NAME VALUES ('Guardians of the Galaxy');
INSERT INTO SERIES_NAME VALUES ('Iron man');
INSERT INTO SERIES_NAME VALUES ('Spider-Man');
INSERT INTO SERIES_NAME VALUES ('Thor');
INSERT INTO SERIES_NAME VALUES ('etc');

CREATE TABLE MOVIE (
  Title VARCHAR(50) NOT NULL,
  Release_date DATE DEFAULT NULL,
  Series VARCHAR(45) DEFAULT NULL,
  Director VARCHAR(45) DEFAULT NULL,
  RunningTime INT(10) DEFAULT NULL,
  Rotten_Tomato INT(10) DEFAULT NULL,
  World_View_Order INT(5) DEFAULT 9999,
  
  CONSTRAINT MOVIE_PK PRIMARY KEY (Title),
  CONSTRAINT MOVIE_FK FOREIGN KEY (Series) REFERENCES SERIES_NAME(Series) 
  ON DELETE CASCADE ON UPDATE CASCADE
  );

INSERT INTO MOVIE  VALUES ('Ant-Man', '2015-09-03', 'Ant-Man', 'Peyton Reed', 117, 86, 14);
INSERT INTO MOVIE  VALUES ('Ant-Man and the Wasp', '2018-07-04', 'Ant-Man', 'Peyton Reed', 118, 76, 20);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Ant-Man 3', '2099-01-01', 'Ant-Man', 'Peyton Reed');
INSERT INTO MOVIE  VALUES ('Avengers: Age of Ultron', '2015-04-23', 'Avengers', 'Joss Whedon', 141, 83, 13);
INSERT INTO MOVIE  VALUES ('Avengers: Infinity War', '2018-04-25', 'Avengers', 'Russo brothers', 149, 91, 21);
INSERT INTO MOVIE  VALUES ('Avengers: End Game', '2019-04-24', 'Avengers', 'Russo brothers', 181, 91, 22);
INSERT INTO MOVIE  VALUES ('Black Panther', '2018-02-14', 'etc', 'Ryan Coogler', 135, 79, 18);
INSERT INTO MOVIE (Title, Release_date, Series, Director)  
	VALUES ('Black Panther 2', '2022-05-06', 'etc', 'Ryan Coogler');
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Black Widow', '2020-05-01', 'etc', 'Cate Shortland');
INSERT INTO MOVIE  VALUES ('Captain America: Civil War', '2016-04-27', 'Captain America', 'Russo brothers', 136, 89, 15);
INSERT INTO MOVIE  VALUES ('Captain America: The First Avenger', '2011-07-28', 'Captain America', 'Joe Johnston', 123, 74, 1);
INSERT INTO MOVIE  VALUES ('Captain America: The Winter Soldier', '2014-04-26', 'Captain America', 'Russo brothers', 147, 92, 10);
INSERT INTO MOVIE  VALUES ('Captain Marvel', '2019-03-06', 'etc', 'Anna Boden', 123, 55, 2);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Captain Marvel 2', '2099-01-01', 'etc', 'Unknown');
INSERT INTO MOVIE  VALUES ('Doctor Strange', '2016-10-26', 'Doctor Strange', 'Scott Derrickson', 115, 86, 17);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Doctor Strange in the Multiverse of Madness', '2021-05-07', 'Doctor Strange', 'Scott Derrickson');
INSERT INTO MOVIE  VALUES ('Guardians of the Galaxy', '2014-07-31', 'Guardians of the Galaxy', 'James Gunn', 122, 92, 11);
INSERT INTO MOVIE  VALUES ('Guardians of the Galaxy Vol. 2', '2017-04-27', 'Guardians of the Galaxy', 'James Gunn', 136, 87, 12);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Guardians of the Galaxy Vol. 3', '2099-01-01', 'Guardians of the Galaxy', 'James Gunn');
INSERT INTO MOVIE  VALUES ('Iron man', '2008-04-30', 'Iron man', 'Jon Favreau', 125, 91, 3);
INSERT INTO MOVIE  VALUES ('Iron Man 2', '2010-04-29', 'Iron man', 'Jon Favreau', 125, 71, 4);
INSERT INTO MOVIE  VALUES ('Iron Man 3', '2013-04-25', 'Iron man', 'Shane Black', 129, 78, 8);
INSERT INTO MOVIE  VALUES ('Marvel`s The Avengers', '2012-04-26', 'Avengers', 'Joss Whedon', 142, 91, 7);
INSERT INTO MOVIE  VALUES ('Spider-Man: Homecoming', '2017-07-05', 'Spider-Man', 'Jon Watts', 133, 87, 16);
INSERT INTO MOVIE  VALUES ('Spider-Man: Far From Home', '2019-07-02', 'Spider-Man', 'Jon Watts', 129, 95, 23);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Spider-Man 3', '2021-07-16', 'Spider-Man', 'Jon Watts');
INSERT INTO MOVIE  VALUES ('The Incredible Hulk', '2008-06-12', 'etc', 'Louis Leterrier', 113, 70, 5);
INSERT INTO MOVIE  VALUES ('Thor', '2011-04-28', 'Thor', 'Kenneth Branagh', 112, 76, 6);
INSERT INTO MOVIE  VALUES ('Thor: Ragnarok', '2017-10-25', 'Thor', 'Taika Waititi', 130, 87, 19);
INSERT INTO MOVIE  VALUES ('Thor: The Dark World', '2013-10-30', 'Thor', 'Alan Taylor', 112, 76, 9);
INSERT INTO MOVIE (Title, Release_date, Series, Director)
	VALUES ('Thor: Love and Thunder', '2021-11-05', 'Thor', 'Taika Waititi');



CREATE TABLE FILMOGRAPHY (
Actor VarChar(40) NOT NULL,
AnotherMovie VarChar(50) NOT NULL,
CharacterName VarChar(40) NOT NULL,
MovieYear INT NOT NULL,
Genre Varchar(20) DEFAULT NULL,

CONSTRAINT FILMO_PK PRIMARY KEY(Actor, AnotherMovie, CharacterName)
);



INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear) 
	VALUES('Robert_Downey_Jr', 'Dolittle', 'Dr. John Dolittle', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Robert_Downey_Jr', 'The Judge', 'Hank Palmer', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Robert_Downey_Jr', 'Chef', 'Marvin', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Robert_Downey_Jr', 'Sherlock Holmes: A Game of Shadows', 'Sherlock Holmes', 2011);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Robert_Downey_Jr', 'Due Date', 'Peter Highman', 2010);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Rudd', 'Mute', 'Cactus Bill', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Rudd', 'Ideal Home', 'Paul', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Rudd', 'A Futile and Stupid Gesture', 'Lawrence KrogerBill', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Rudd', 'The Catcher Was a Spy', 'Cactus Bill', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Rudd', 'Fun Mom Dinner', 'Brady', 2017);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chadwick_Boseman', 'Marshall', 'Thurgood Marshall', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chadwick_Boseman', 'Message from the King', 'Jacob King', 2016);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chadwick_Boseman', 'Gods of Egypt', 'Thoth', 2016);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chadwick_Boseman', 'Get on Up', 'James Brown', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chadwick_Boseman', 'Draft Day', 'Vontae Mack', 2014);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Benedict_Cumberbatch', '1917', 'Colonel Mackenzie', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Benedict_Cumberbatch', 'Between Two Ferns: The Movie', 'Himself', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Benedict_Cumberbatch', 'The Current War', 'Thomas Edison', 2017);    
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Benedict_Cumberbatch', 'Zoolander2', 'All', 2016);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Benedict_Cumberbatch', 'Black Mass', 'William M.Bulger', 2015);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Pratt', 'The Kid', 'Grant Cutler', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Pratt', 'The Lego Movie2', 'Emmnet Brickowski', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Pratt', 'The Lego Movie2', 'Rex Dangervest', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Pratt', 'Jurassic Wolrd: Fallen Kingdom', 'Owen Grady', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Pratt', 'Passengers', 'Jim Preston', 2016);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Bettany', 'Journeys End', 'Osborne', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Bettany', 'Legend', 'Charlie Richardson', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Bettany', 'Mortdecai', 'Jock Strapp', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Bettany', 'Transcendence', 'Max Waters', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Paul_Bettany', 'Blood', 'Joe Fairburn', 2013);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Sebastian_Stan', 'The Devil All the Time', 'Lee Bodecker', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Sebastian_Stan', 'Endings, Beginnings', 'Frank', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Sebastian_Stan', 'We Have Always Lived in the Castle', 'Charles Blackwood', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Sebastian_Stan', 'Destroyer', 'Det. Chris', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Sebastian_Stan', 'Im Not Here', 'Steve', 2017);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Holland', 'Uncharted', 'Nathan Drake', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Holland', 'Chaos Walking', 'Todd Hewitt', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Holland', 'Onward', 'lan Lightfoot', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Holland', 'Dolittle', 'Jip', 2020);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Holland', 'Spies in Disguise', 'Walter Beckett', 2020);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Hemsworth', 'Jay and Silent Bob Reboot', 'Chris_Hemsworth', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Hemsworth', 'Men in Black 4', 'Henry', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Hemsworth', 'Bad Times at the El Royale', 'Billy Lee', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Hemsworth', '12 Strong', 'Captain Mitch Nelson', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Hemsworth', 'Ghostbusters', 'Kevin Beckman', 2016);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Hiddleston', 'Early Man', 'Lord Nooth', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Hiddleston', 'Kong: Skull Island', 'Catain James Conrad', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Hiddleston', 'I Saw the Light', 'Hank Williams', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Hiddleston', 'High-Rise', 'Dr. Robert Laing', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Tom_Hiddleston', 'The Pirate Fairy', 'James Hook', 2014);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Mark_Ruffalo', 'Now You See Me 2', 'Agent Dylan Rhodes', 2016);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Mark_Ruffalo', 'Spotlight', 'Michael Rezendes', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Mark_Ruffalo', 'Foxcatcher', 'Dave Schultz', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Mark_Ruffalo', 'Infinitely Polar Bear', 'Cam Stuart', 2014);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Mark_Ruffalo', 'Begin Again', 'Dan Mulligan', 2013);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Evans', 'Knives Out', 'Ranson Drysdale-Thrombey', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Evans', 'The Red Sea Diving Resort', 'Ari Levinson', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Evans', 'Gifted', 'Frank Adler', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Evans', 'Playing It Cool', 'Me', 2015);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Chris_Evans', 'Before We Go', 'Nick Vaughan', 2014);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Brie_Larson', 'Just Mercy', 'Eva Ansley', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Brie_Larson', 'Basmati Blues', 'Linda', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Brie_Larson', 'Unicorn Store', 'Kit', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Brie_Larson', 'The Glass Castle', 'Jeannette Walls', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Brie_Larson', 'Kong: Skull Island', 'Mason Weaver', 2017);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Scarlett_Johansson', 'Jojo Rabiit', 'Rosie Betzler', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Scarlett_Johansson', 'Marriage Story', 'Nicole Barber', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Scarlett_Johansson', 'Isle of Dogs', 'Nutmeg', 2018);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Scarlett_Johansson', 'Rough Night', 'Jess', 2017);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Scarlett_Johansson', 'Ghost in the Shell', 'Major Mira Killian', 2017);

INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Edward_Norton', 'Alita: Battle Angel', 'Nova', 2019);
INSERT INTO FILMOGRAPHY(Actor, AnotherMovie, CharacterName, MovieYear)
	VALUES('Edward_Norton', 'Isle of Dogs', 'Rex', 2018);



CREATE TABLE HERO (
HeroName VarChar(20) NOT NULL,
Actor VarChar(40) NOT NULL,
CONSTRAINT HeroPK PRIMARY KEY(HeroName, Actor),
CONSTRAINT HERO_FK1 FOREIGN KEY (Actor) REFERENCES FILMOGRAPHY(Actor)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO HERO VALUES('Ant_Man', 'Paul_Rudd');
INSERT INTO HERO VALUES('Black_Panther', 'Chadwick_Boseman');
INSERT INTO HERO VALUES('Doctor_Strange','Benedict_Cumberbatch');
INSERT INTO HERO VALUES('Iron_Man','Robert_Downey_Jr');
INSERT INTO HERO VALUES('Starload','Chris_Pratt');
INSERT INTO HERO VALUES('Vision','Paul_Bettany');
INSERT INTO HERO VALUES('Winter_Soldier','Sebastian_Stan');
INSERT INTO HERO VALUES('Spider_Man','Tom_Holland');
INSERT INTO HERO VALUES('Thor','Chris_Hemsworth');
INSERT INTO HERO VALUES('Loki','Tom_Hiddleston');
INSERT INTO HERO VALUES('Hulk','Edward_Norton');
INSERT INTO HERO VALUES('Captain_America','Chris_Evans');
INSERT INTO HERO VALUES('Captain_Marvel','Brie_Larson');
INSERT INTO HERO VALUES('Black_Widow','Scarlett_Johansson');

CREATE TABLE MOVIE_QUOTES (
Heroname VarChar(40) NOT NULL,
Movie VarChar(40) NOT NULL,
Famous_Line VARCHAR(400) NOT NULL,
CONSTRAINT Movie_Quotes_PK PRIMARY KEY(Heroname, Movie,Famous_Line),
CONSTRAINT Movie_Quotes_FK1 FOREIGN KEY (Heroname) REFERENCES Hero(Heroname)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Movie_Quotes_FK2 FOREIGN KEY (Movie) REFERENCES Movie(Title)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man', 'Iron Man', "I Am Iron Man");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Hulk', 'The Incredible Hulk', "Hulk smash!" );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Thor', 'Thor', "This drink, I like it. Another!" );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America', 'Captain America: The First Avenger', "I don’t want to kill anyone. I don’t like bullies. I don’t care where they’re from." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America', 'Captain America: The First Avenger',"I can do this all day." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America', 'Captain America: The First Avenger',"I’m gonna need a rain check on that dance." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Captain America: The First Avenger',"I’m just a kid from Brooklyn." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man', 'Marvel`s The Avengers', "We have a Hulk.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America', 'Marvel`s The Avengers', "There’s only one God, ma’am, and I’m pretty sure he doesn’t dress like that."   );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Thor', 'Marvel`s The Avengers', "He’s adopted");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Hulk', 'Marvel`s The Avengers', "Puny god.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man', 'Marvel`s The Avengers', "Doth mother know you weareth her drapes?");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man', 'Iron Man 3', "You’re in a relationship with me. Everything will never be okay.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Loki', 'Thor: The Dark World', "This is so unlike you, brother. So clandestine. Are you sure you wouldn’t rather just punch your way out?");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Loki', 'Thor: The Dark World', "I can feel the righteousness surging. Hey, wanna have a rousing discussion about truth? Honor? Patriotism? God bless America!");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Captain America: The Winter Soldier',"Before we get started, does anyone want to get out?" );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Captain America: The Winter Soldier',"On your left." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Black_Widow','Captain America: The Winter Soldier',"Hey fellas, either one of you know where the Smithsonian is? I’m here to pick up a fossil." );
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Avengers: Age of Ultron',"Language.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Avengers: Age of Ultron',"You get hurt, hurt ’em back. You get killed… walk it off.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Ant_Man','Ant-Man',"Pick on someone your own size!");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man','Captain America: Civil War',"Anybody on our side hiding any shocking and fantastic abilities they’d like to disclose? I’m open to suggestions.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Doctor_Strange','Doctor Strange',"Dormammu, I’ve come to bargain.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Doctor_Strange','Doctor Strange',"Just Wong? Like Adele? Or Aristotle? Drake, Bono, Eminem…");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Starload','Guardians of the Galaxy Vol. 2',"You shouldn’t have killed my mom and squished my Walkman.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man','Spider-Man: Homecoming',"Don’t do anything I would do, and definitely don’t do anything I wouldn’t do. There’s a little gray area in there, and that’s where you operate.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Spider-Man: Homecoming',"So… you got detention.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Thor','Thor: Ragnarok',"We know each other! He’s a friend from work!");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Thor','Thor: Ragnarok',"There was one time when we were children. He transformed himself into a snake, and he knows that I love snakes. So I went to pick up the snake to admire it, and he transformed back into himself and he was like, ‘Blech, it’s me!’ And he stabbed me. We were 8 at the time.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man','Avengers: Infinity War',"Dude, you’re embarrassing me in front of the wizards.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Spider_Man','Avengers: Infinity War',"I don’t want to go.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man','Avengers: Infinity War',"Get lost, Squidward.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Thor','Avengers: Infinity War',"They taught it on Asgard. It was an elective.");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Starload','Avengers: Infinity War',"What master do I serve? What am I supposed to say, Jesus?");
INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_Marvel','Captain Marvel',"If toast is cut diagonally, I can’t eat it.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Iron_Man','Avengers: End Game',"Honestly, until this exact second, I thought you were a Build-a-Bear.");
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Black_Widow','Avengers: End Game',"I get emails from a raccoon, so nothing sounds crazy.");    
 INSERT INTO MOVIE_QUOTES(Heroname, Movie, Famous_Line)
	VALUES('Captain_America','Avengers: End Game',"That is America’s ass.");

 
 CREATE TABLE CUSTOMER (
	CustomerID 			 Varchar(25) 			NOT NULL,
	FullName 			 Varchar(25) 		 	NOT NULL,
    EncryptedPassword	 Varchar(50)			NOT NULL,	
	Address				 Varchar(100)			Null,
	CONSTRAINT 	CustomerPK			   	PRIMARY KEY(CustomerID)
	);
 
 INSERT INTO CUSTOMER VALUES('2015147018', 'Jungwoon', 'qwerty', 'Guro, Seoul');
 INSERT INTO CUSTOMER VALUES('2015147013', 'Dongyoung', 'asdfg', 'Gaengseo, Seoul');
 INSERT INTO CUSTOMER VALUES('2015147040', 'Yongwoo', 'zxcvb', 'Jamsil, Seoul');
 INSERT INTO CUSTOMER VALUES('2018147039', 'Yerim', 'shit', 'Ilsan, Gyung-gi');
 INSERT INTO CUSTOMER VALUES('2016147023', 'Dongin', '12345', 'Bupyeong, Incheon');
 INSERT INTO CUSTOMER VALUES('2016147039', 'Hyeonjin', 'hahaha', 'Daecheon, Chungnam');
 INSERT INTO CUSTOMER VALUES('2018147009', 'Junhyeong', 'wooek', 'Mapo, Seoul');
 
 
CREATE TABLE REVIEW (
CustomerID Varchar(25) NOT NULL,
Title VarChar(40) NOT NULL,
Score int DEFAULT NULL,

CONSTRAINT Review_PK PRIMARY KEY(CustomerID, Title),
CONSTRAINT Review_FK1 FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Review_FK2 FOREIGN KEY (Title) REFERENCES MOVIE(Title)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO REVIEW VALUES('2015147018', 'Marvel`s The Avengers', 95);
INSERT INTO REVIEW VALUES('2015147018', 'Thor: Ragnarok', 90);
INSERT INTO REVIEW VALUES('2015147013', 'Thor: Ragnarok', 95);
INSERT INTO REVIEW VALUES('2018147039', 'Marvel`s The Avengers', 100);
INSERT INTO REVIEW VALUES('2016147023', 'Iron man', 95);
INSERT INTO REVIEW VALUES('2016147039', 'Captain America: Civil War', 100);
INSERT INTO REVIEW VALUES('2018147009', 'Ant-Man', 90);


CREATE VIEW NOT_RELEASED AS
    SELECT Title, Series, Release_date
    FROM MOVIE
    WHERE Release_date >= curdate()
	order by Release_date asc;

CREATE TABLE MOVIE_has_HERO (
Title Varchar(50) NOT NULL,
HeroName Varchar(20) NOT NULL,
Actor VarChar(40) NOT NULL,
CONSTRAINT MovieHero_PK PRIMARY KEY(Title, HeroName, Actor),
CONSTRAINT MovieHero_FK1 FOREIGN KEY(Title) REFERENCES Movie(Title)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT MovieHero_FK2 FOREIGN KEY(HeroName) REFERENCES Hero(HeroName)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT MovieHero_FK3 FOREIGN KEY(Actor) REFERENCES Hero(Actor)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Ant-Man', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Ant-Man and the Wasp', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Ant-Man 3', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Iron_Man','Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Vision', 'Paul_Bettany');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Age of Ultron', 'Black_Widow','Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Black_Panther', 'Chadwick_Boseman');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Doctor_Strange', 'Benedict_Cumberbatch');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Starload', 'Chris_Pratt');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Vision', 'Paul_Bettany');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Winter_Soldier', 'Sebastian_Stan');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Loki', 'Tom_HiddleSton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Captain_Marvel', 'Brie_Larson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: Infinity War', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Black_Panther', 'Chadwick_Boseman');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Doctor_Strange', 'Benedict_Cumberbatch');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Starload', 'Chris_Pratt');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Winter_Soldier', 'Sebastian_Stan');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Captain_Marvel', 'Brie_Larson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Avengers: End Game', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Black Panther', 'Black_Panther', 'Chadwick_Boseman');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Black Panther 2', 'Black_Panther', 'Chadwick_Boseman');
 INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Black Widow', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Ant_Man', 'Paul_Rudd');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Black_Panther', 'Chadwick_Boseman');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Vision', 'Paul_Bettany');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Winter_Soldier', 'Sebastian_Stan');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: Civil War', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The First Avenger', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The First Avenger', 'Winter_Soldier', 'Sebastian_Stan');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The Winter Soldier', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The Winter Soldier', 'Winter_Soldier', 'Sebastian_Stan');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The Winter Soldier', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain America: The Winter Soldier', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain Marvel', 'Captain_Marvel', 'Brie_Larson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Captain Marvel 2', 'Captain_Marvel', 'Brie_Larson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Doctor Strange', 'Doctor_Strange', 'Benedict_Cumberbatch');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Doctor Strange in the Multiverse of Madness', 'Doctor_Strange', 'Benedict_Cumberbatch');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Guardians of the Galaxy', 'Starload', 'Chris_Pratt');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Guardians of the Galaxy Vol. 2', 'Starload', 'Chris_Pratt');   
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Guardians of the Galaxy Vol. 3', 'Starload', 'Chris_Pratt');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Iron Man', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Iron Man 2', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Iron Man 2', 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Iron Man 3', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Iron Man 3', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Marvel`s The Avengers', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES("Marvel`s The Avengers", 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES("Marvel`s The Avengers", 'Loki', 'Tom_Hiddleston');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES("Marvel`s The Avengers", 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES("Marvel`s The Avengers", 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES("Marvel`s The Avengers", 'Black_Widow', 'Scarlett_Johansson');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Spider-Man: Homecoming', 'Iron_Man', 'Robert_Downey_Jr');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Spider-Man: Homecoming', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Spider-Man: Homecoming', 'Captain_America', 'Chris_Evans');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Spider-Man: Far From Home', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Spider-Man 3', 'Spider_Man', 'Tom_Holland');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('The Incredible Hulk', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor', 'Loki', 'Tom_Hiddleston');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: Ragnarok', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: Ragnarok', 'Loki', 'Tom_Hiddleston');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: Ragnarok', 'Hulk', 'Edward_Norton');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: The Dark World', 'Thor', 'Chris_Hemsworth');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: The Dark World', 'Loki', 'Tom_Hiddleston');
INSERT INTO Movie_has_HERO(Title, HeroName, Actor)
   VALUES('Thor: Love and Thunder', 'Thor', 'Chris_Hemsworth');

