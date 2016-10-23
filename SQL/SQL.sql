/************* SELECT *************/
/* Round to near 1000 */
SELECT ROUND(num,-3) FROM table

/* Case statements */
SELECT name,
  CASE WHEN continent = 'Europe' THEN 'Eurasia'
  WHEN continent = 'Asia' THEN 'Eurasia'
  WHEN continent = 'North America' THEN 'America'
  WHEN continent = 'South America' THEN 'America'
  WHEN continent = 'Caribbean' THEN 'America'
  ELSE continent END
FROM world








/************* WHERE *************/

/* Exists, All, Any */
SELECT * FROM table
WHERE table.column EXISTS (SELECT 1 / SELECT *...)

SELECT * FROM table
WHERE table.column ALL (SELECT...)

SELECT * FROM table
WHERE table.column ANY (SELECT...)

/* Multiple OR */
SELECT * FROM table
WHERE table.column IN ('val1','val2','val3');

SELECT * FROM table
WHERE table.column NOT IN ('val1','val2','val3');

/* String matching */

/* _ => exactly one chars
   % => any num of chars */

SELECT * FROM table
WHERE table.name LIKE '_a%e%';


SELECT * FROM table
WHERE LEFT(table.name,2) = 'TA';

/* Regex */
SELECT * FROM table
WHERE table.name REGEXP '^[FG]';


/************* GROUP BY *************/

/* Show the grouping totals for other columns */
SELECT column1, SUM(column2), column3
FROM table
GROUP BY column3, column1 WITH ROLLUP (or WITH CUBE for all columns)
