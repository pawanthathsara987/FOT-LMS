--atten_count_each_subject--
CREATE VIEW atten_count_each_subject AS
SELECT
    stu_id,
    cour_code,
    COUNT(atten_id) AS total_attendance,
    SUM(CASE WHEN atten_status = 'present' THEN 1 ELSE 0 END) AS atten_count
FROM
    attendance
GROUP BY
    stu_id, cour_code;


--atten_count_each_subject_with_medical--
CREATE VIEW atten_count_each_subject_with_medical AS 
SELECT
    a.stu_id,
    a.cour_code,
    SUM(CASE WHEN a.atten_status = 'present' THEN 1 ELSE 0 END) AS atten_count_without_medical,
    SUM(
        CASE 
            WHEN a.atten_status = 'absent' AND m.med_date IS NOT NULL THEN 1 
            ELSE 0 
        END
    ) + SUM(CASE WHEN a.atten_status = 'present' THEN 1 ELSE 0 END) AS atten_count_with_medical,
    COUNT(a.atten_id) AS total_attendance
FROM
    attendance a
LEFT JOIN
    medical m ON a.stu_id = m.stu_id
               AND a.atten_date = m.med_date
GROUP BY
    a.stu_id, a.cour_code;


--check_eligible_with_medical_and_without_medical--
CREATE VIEW check_eligible_with_medical_and_without_medical AS
SELECT
    stu_id,
    cour_code,
    CASE
        WHEN
            (atten_count_without_medical / total_attendance) * 100 >= 80 THEN 'eligible'
        ELSE 'not eligible'
    END AS check_eligible_without_medical,
    CASE
        WHEN
            (atten_count_with_medical / total_attendance) * 100 >= 80 THEN 'eligible'
        ELSE 'not eligible'
    END AS check_eligible_with_medical
FROM
    atten_count_each_subject_with_medical
GROUP BY
    stu_id, cour_code;