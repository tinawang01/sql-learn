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

