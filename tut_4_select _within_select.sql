-- 1 Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2 Richer than UK
SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

--3 Neighbours of Argentina and Australia
SELECT name, continent FROM world
WHERE continent = 'South America' OR continent ='Oceania'
ORDER BY name

--4 between canada and poland
SELECT name, population FROM world
WHERE population > 38007166 AND population < 38379000

-- 5 percentaes of Germany
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100), '%') AS percentage
FROM world 
WHERE continent = 'Europe'

--6 Bigger than every country in Europe
SELECT name FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

--7 Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)