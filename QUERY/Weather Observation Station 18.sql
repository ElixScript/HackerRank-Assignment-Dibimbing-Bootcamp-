-- buat CTE untuk mendapatkan semua nilai 
WITH semua_nilai AS (
    SELECT
        MIN(LAT_N) AS min_lat, 
        MIN(LONG_W) AS min_long,
        MAX(LAT_N) AS max_lat,
        MAX(LONG_W) AS max_long
    FROM STATION
)

-- ini untuk menghitung manhattan distance 
-- jangan lupa diround 4 
SELECT 
    ROUND(ABS(max_lat-min_lat) + ABS(max_long-min_long),4) AS manhattan_distance
FROM semua_nilai; 