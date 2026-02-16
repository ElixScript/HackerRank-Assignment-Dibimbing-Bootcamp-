SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH wand_base AS (
    SELECT
        w.id,
        w.code,
        w.coins_needed,
        w.power,
        wp.age
    FROM Wands w
    JOIN Wands_Property wp
        ON w.code = wp.code
    WHERE wp.is_evil = 0
),
wand_min_price AS (
    SELECT
        id,
        age,
        coins_needed,
        power,
        MIN(coins_needed) OVER (PARTITION BY age, power) AS min_coins
    FROM wand_base
)
SELECT
    id,
    age,
    coins_needed,
    power
FROM wand_min_price
WHERE coins_needed = min_coins
ORDER BY
    power DESC,
    age DESC;

go