SELECT
    stu_id,
    cour_code,
    COUNT(atten_id) AS total_attendance,
    SUM(CASE WHEN atten_status = 'present' THEN 1 ELSE 0 END) AS atten_count
FROM
    attendance
GROUP BY
    stu_id, cour_code;


    