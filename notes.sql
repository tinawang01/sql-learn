# sql-learn
# notes of SQLzoo tutorial

#Show the Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 UNION SELECT * FROM nobel WHERE subject = 'Chemistry' AND yr = 1984

#List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner ASC

#The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
#Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner

#SELECT within SELECT Tutorial
#1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
      
#2
SELECT name FROM world WHERE continent='Europe' AND gdp/population>(SELECT gdp/population FROM world WHERE name='United Kingdom')

#3
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name

#4
SELECT name,population FROM world WHERE population>(SELECT population FROM world WHERE name='Canada') and population<(SELECT population FROM world WHERE name='Poland')

#5
SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name='Germany')), '%') FROM world WHERE continent='Europe'

#6
SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE continent='Europe' and gdp>0)

#7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
#8
select continent, name from world x
where name = (select name 
                  from world y 
                  where  x.continent =  y.continent 
                  order by name asc 
                  limit 1)
      

