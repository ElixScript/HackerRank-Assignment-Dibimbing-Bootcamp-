WITH nilai_siswa AS (
    SELECT 
        Students.id,
        Students.name,
        Students.marks,
        Grades.grade
    FROM Students 
    JOIN Grades ON Students.marks BETWEEN Grades.min_mark AND Grades.max_mark
)

SELECT
    CASE 
        WHEN grade < 8 THEN NULL 
        ELSE name 
    END AS name , grade , marks 
FROM nilai_siswa 
ORDER BY grade DESC , name ASC , marks ASC ;