SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH max_score_per_challenge AS (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY
        hacker_id,
        challenge_id
),
total_score_per_hacker AS (
    SELECT
        hacker_id,
        SUM(max_score) AS total_score
    FROM max_score_per_challenge
    GROUP BY hacker_id
    HAVING SUM(max_score) > 0
)
SELECT
    t.hacker_id,
    h.name,
    t.total_score
FROM total_score_per_hacker t
JOIN Hackers h
    ON t.hacker_id = h.hacker_id
ORDER BY
    t.total_score DESC,
    t.hacker_id ASC;

go