

SELECT *
FROM table8

SELECT s1.Score, s1.Id, COUNT(DISTINCT s2.Score) AS Rank
FROM table8 AS s1 JOIN table8 s2 ON s1.Score <= s2.Score
GROUP BY s1.Id
ORDER BY 1 DESC;


SELECT 
    s.Score,
    (
    SELECT COUNT(DISTINCT S2.Score)
    FROM table8 AS s2
    WHERE s2.Score >= s.Score    
    ) Rank
FROM table8 AS s
ORDER BY s.Score DESC;


Select Score, (
			select count(distinct Score) 
			from table8 
			where Score >= s.Score ) AS Rank 
from table8 s 
ORDER BY Score DESC;

SELECT Score, (
			SELECT Count(DISTINCT Score)
			FROM table8 AS s2
			where s2.Score >= s1.Score) As Rank
FROM table8 AS s1
ORDER BY s1.Score DESC;

select *
from table8


select *
from training_details


select *
from users






  select u.username, training_id, training_date, count(*) as count
from users u JOIN training_details t ON u.user_id = t.user_id
GROUP BY u.username, training_id, training_date
having count(*)>1
ORDER BY training_date DESC;



SELECT username, training_date
FROM users u
INNER JOIN training_details t ON(u.user_id = t.user_id)
GROUP BY username, training_date
HAVING COUNT(*) > 1
ORDER BY username, training_date DESC

SELECT
      u.user_id,
      username,
      training_id,
      training_date,
      count( user_training_id ) AS count
  FROM users u JOIN training_details t ON t.user_id = u.user_id
  GROUP BY u.user_id,
           username,
           training_id,
           training_date
  HAVING count( user_training_id ) > 1
  ORDER BY training_date DESC;

--------------

SELECT * FROM runners

SELECT * FROM races


select *
from runners a, races b
where a.id = b.winner_id


SELECT * 
FROM runners 
WHERE id NOT IN (select a.id
from runners a, races b
where a.id = b.winner_id)

-- WRONG ONE
SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races WHERE winner_id IS NOT NULL)