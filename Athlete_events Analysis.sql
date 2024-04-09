use games;

select * from athlete_events;

/* 1.Count the total number of records in the dataset. */
select count(id) as Total_Records
from athlete_events;

/* 2.Display the first 10 rows of the dataset. */
select * 
from athlete_events
limit 10 ; 

/*3.Display the last 5 rows of the dataset.*/
SELECT *
FROM athlete_events
ORDER BY ID DESC
LIMIT 5;

/*4.Find the number of unique athletes in the dataset.*/
select count(distinct name) as unique_athletes
from athlete_events;

/*5.Find the number of unique sports in the dataset. */
select count(distinct games) as total_unique_sports
from athlete_events;

/*6.List all the unique countries present in the dataset. */
select count(distinct NOC) as total_unique_country
from athlete_events;

/*7.Count the number of male athletes in the dataset.*/
select count(Name) as Total_males
from athlete_events
where Sex='M';

/*8.Count the number of female athletes in the dataset.*/
select count(Name) as Total_males
from athlete_events
where Sex='F';

/* 9.Find the average age of athletes.*/
select avg(age) as avg_age
from athlete_events;

/* 10.List the countries with the highest number of athletes*/
select noc,count(id) as total_athletes
from athlete_events
group by NOC
order by total_athletes desc
limit 1;

/*11.List the countries with the lowest number of athletes.*/
select noc,count(id) as total_athletes
from athlete_events
group by NOC
order by total_athletes asc
limit 1;

/* 12.Count the number of athletes who participated in the Summer Olympics.*/
select count(id) as total_athletes
from athlete_events
where season = 'summer';

/* 12.Count the number of athletes who participated in the winter Olympics.*/
select count(id) as total_athletes
from athlete_events
where season = 'winter';

/*13.Find the year with the highest number of participants*/
select year,count(id) as total_participants
from athlete_events
group by year
order by total_participants desc
limit  1;

/* 14.Find the year with the lowest number of participants.*/
select year,count(id) as total_participants
from athlete_events
group by year
order by total_participants asc
limit  1;

/*15.Find the total number of medals won by each country.*/
select noc,count(id) as total_medals
from athlete_events
where medal = 'Gold' or medal = 'silver' or  medal = 'bronze'
group by noc
order by total_medals desc;

/*16.List the top 10 countries with the highest number of gold medals.*/
select noc,count(id) as total_medals
from athlete_events
where medal = 'Gold' 
group by noc
order by total_medals desc
limit 10;

/*17 List the top 10 countries with the highest number of silver medals.*/
select noc,count(id) as total_medals
from athlete_events
where medal = 'silver' 
group by noc
order by total_medals desc
limit 10;

/*18 List the top 10 countries with the highest number of bronze medals */
select noc,count(id) as total_medals
from athlete_events
where medal = 'bronze' 
group by noc
order by total_medals desc
limit 10;

/*19 Find the athlete who won the most medals.*/
select name,count(medal) as total_medal
from athlete_events
where medal = 'Gold' or medal = 'silver' or  medal = 'bronze'
group by name
order by total_medal desc
limit 1;

/*20 Find the athlete who won the most gold medals. */
select name,count(medal) as total_medal
from athlete_events
where medal = 'Gold' 
group by name
order by total_medal desc
limit 1;

/*21 Find the athlete who won the most silver medals. */

select name,count(medal) as total_medal
from athlete_events
where medal = 'silver' 
group by name
order by total_medal desc
limit 1;

/*22 Find the athlete who won the most bronze medals. */
select name,count(medal) as total_medal
from athlete_events
where medal = 'bronze' 
group by name
order by total_medal desc
limit 1;

/*23 Find the country with the highest average age of athletes. */
select team,avg(age) as avg_age
from athlete_events
group by team
order by avg_age desc 
limit 1;

/* 24 Find the country with the lowest average age of athletes. */
select team,avg(age) as avg_age
from athlete_events
group by team
order by avg_age asc
limit 1;

/* 25 Find the most popular sport in terms of the number of participants.*/
select sport, count(id) as total_participant
from athlete_events
group by sport 
order by total_participant desc
limit 1;

/* 26 List the athletes who participated in both the Summer and Winter Olympics. */
SELECT DISTINCT a1.Name, a1.ID
FROM athlete_events a1
JOIN athlete_events a2 ON a1.ID = a2.ID
WHERE a1.Season = 'Summer' AND a2.Season = 'Winter';

/*27 List all the unique events (sports + discipline) in the dataset. */
select distinct sport
 from athlete_events;
 
 /* 28 Find the event with the highest number of participants.    */
 select event, count(id) as total_participant
 from athlete_events
 group by event
 order by total_participant desc
 limit 1;
 
 /* 29 Find the event with the lowest number of participants. */
 select event, count(id) as total_participant
 from athlete_events
 group by event
 order by total_participant asc
 limit 1;
 
 /* 30 Calculate the average height of male athletes. */
 select avg(height) as avg_height
 from athlete_events
 where sex ='m';
 
 /* 31 Calculate the average height of female athletes. */
 select avg(height) as avg_height
 from athlete_events
 where sex ='f';
 
 /*32 Calculate the average weight of male athletes.*/
 select avg(weight) as avg_weight
 from athlete_events
 where sex ='m';
 
 /*33 Calculate the average weight of female athletes.*/
 select avg(weight) as avg_weight
 from athlete_events
 where sex ='f';
 
 /* 34 Find the tallest athlete in the dataset. */
 select max(height) as max_height
 from athlete_events;
 
 /* 35  Find the shortest  athlete in the dataset. */
 select min(height) as min_height
 from athlete_events; 
 
 /* 36 List the athletes who participated in the most number of events. */
 select name,count(event) as total_event
 from athlete_events
 group by name 
 order by total_event desc 
 limit 1;
 
 /* 37 List the athletes who won medals in more than one sport. */
SELECT Name, COUNT(DISTINCT Sport) AS num_sports_with_medals
FROM athlete_events
WHERE Medal IS NOT NULL
GROUP BY Name
HAVING COUNT(DISTINCT Sport) > 1;

/* 38 Find the country with the highest number of athletes who participated only once. */
SELECT noc, COUNT(*) AS num_athletes_participated_once
FROM (
    SELECT noc, id
    FROM athlete_events
    GROUP BY noc, id
    HAVING COUNT(*) = 1
) AS temp
GROUP BY noc
ORDER BY num_athletes_participated_once DESC
LIMIT 1;

/* 39 Find the country with the highest number of athletes who participated multiple times. */
SELECT noc, COUNT(*) AS num_athletes_participated_once
FROM (
    SELECT noc, id
    FROM athlete_events
    GROUP BY noc, id
    HAVING COUNT(*) > 1
) AS temp
GROUP BY noc
ORDER BY num_athletes_participated_once DESC
LIMIT 1;

/* 40 Find the athlete who won the most medals in a single Olympics.. */
SELECT Name, Games, COUNT(*) AS num_medals
FROM athlete_events
WHERE Medal IS NOT NULL
GROUP BY Name, Games
ORDER BY num_medals DESC
LIMIT 1;


/* 41 Find the country that has won medals in the most number of sports. */
select sport, noc,count(medal) as num_medals
from athlete_events
group by sport, noc
order by num_medals desc
limit 1;

