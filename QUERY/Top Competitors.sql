SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
-- Soal 3: Top Competitors
-- Deskripsi: Hacker yang memperoleh full score
--            pada lebih dari satu challenge

WITH challenge_max_score AS (
    -- CTE-1: Peta challenge ke skor maksimum
    SELECT
        c.challenge_id,
        d.score AS max_score
    FROM Challenges c
    JOIN Difficulty d
        ON c.difficulty_level = d.difficulty_level
),

hacker_full_score AS (
    -- CTE-2: Hitung jumlah challenge full score per hacker
    SELECT
        s.hacker_id,
        COUNT(DISTINCT s.challenge_id) AS count_max_score
    FROM Submissions s
    JOIN challenge_max_score cms
        ON s.challenge_id = cms.challenge_id
       AND s.score = cms.max_score
    GROUP BY s.hacker_id
    HAVING COUNT(DISTINCT s.challenge_id) > 1
)

-- Select final: ambil hacker_id dan name
SELECT
    hfs.hacker_id,
    h.name
FROM hacker_full_score hfs
JOIN Hackers h
    ON hfs.hacker_id = h.hacker_id
ORDER BY
    hfs.count_max_score DESC,
    hfs.hacker_id ASC;
    
go