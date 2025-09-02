select * from fifa limit 5;
select distinct fifa.name from fifa;
select count(distinct fifa.name) as cnt from fifa;

#How many players are there in the dataset?
select count(*) as total_players from fifa;

#How many nationalities do these players belong to?
select count(distinct Nationality) as unique_nation from fifa;

#What is the total wage given to all players? What's the average and standard deviation?
select sum(wage) as total_wage,
avg(wage) as avg_wage,
stddev(wage) as std_wage
from fifa;

#Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality, count(nationality) as uniq from fifa
group by nationality
order by uniq desc limit 3;

#Which player has the highest wage?
select fifa.name, wage
from fifa
group by 1,2
order by wage desc limit 1;

# Which player has the lowest?
select fifa.name, wage
from fifa
group by 1,2
order by wage asc limit 1; # I believe it has a different solution instead of writing 2 queries

#The player having the – best overall rating?
select * from fifa limit 7;
select fifa.name, Overall
from fifa
group by 1,2
order by overall desc limit 1;
# Player having the – Worst overall rating?
select fifa.name, Overall
from fifa
group by 1,2
order by overall limit 1;

# Club having the highest total of overall rating? Highest Average of overall rating?
select * from fifa limit 7;
select club, avg(overall) as avg_rating
from fifa
group by club
order by avg_rating desc limit 1;

#What are the top 5 clubs based on the average ratings of their players and their corresponding averages?
select * from fifa limit 7;
select club, avg(overall) as avg_rating
from fifa
group by club
order by avg_rating desc limit 5;

#What is the distribution of players whose preferred foot is left vs right?
select * from fifa limit 7;
select preferred_foot, count(*) as frequency
from fifa
group by preferred_foot
order by frequency desc;

#Which jersey number is the luckiest?
select * from fifa limit 7;
select fifa.name, fifa.value, jersey_number from fifa
order by fifa.value desc limit 1;

#What is the frequency distribution of nationalities among players whose club name starts with M?
select * from fifa limit 7;
select club, count(*) as frequency from fifa
where club like "m%"
group by club
order by frequency;

#How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select * from fifa limit 7;
select count(*) as frequency from fifa
where str_to_date(joined, '%Y-%m-%d') between "2018-05-20" and "2019-04-10";

#How many players have joined their respective clubs date wise
select count(*) as total_players, str_to_date(joined, '%Y-%m-%d') as date_wise
from fifa group by date_wise;

#------------------ Assignment ends ----------------------------------------------------------------

#Multi-row single column sub query
select fifa.name, age, nationality from fifa
where age IN (select max(age) from fifa group by nationality) order by nationality asc;

select count(*) from fifa
where overall <> ALL (select max(overall) from fifa
group by nationality);

select count(*) from fifa
where overall = ANY (select max(overall) from fifa
group by nationality);

