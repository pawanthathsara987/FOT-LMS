--CA Mark whole bacth--

CREATE VIEW show_ca_marks_whole_batch AS
SELECT
	stu_id,
	cour_code,
	quiz_1,
	quiz_2,
	quiz_3,
	mid_theory,
	mid_practical,
	assessment,
	ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0), 2)
	AS CA_Marks
    
FROM
	exam_marks;


--CA Mark eligibility student--

CREATE VIEW show_ca_marks_eligibility_student AS
SELECT
	stu_id,
	cour_code,
	ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0), 2)
	AS CA_Marks
FROM
	exam_marks
WHERE
	((IFNULL(quiz_1, 0) +
	IFNULL(quiz_2, 0) +
	IFNULL(quiz_3, 0) -
	LEAST(
		IFNULL(quiz_1, 0),
		IFNULL(quiz_2, 0),
		IFNULL(quiz_3, 0)
	)) / 2) +
	(IFNULL(assessment, 0) / 2) +
	IFNULL(mid_theory, 0) +
	IFNULL(mid_practical, 0) >= 20;


--Final marks whole bacth--

CREATE VIEW show_final_marks_whole_batch AS
SELECT
	stu_id,
	cour_code,
	ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0) +
		IFNULL(end_theory, 0) +
		IFNULL(end_practical, 0), 2)
	AS final_marks,

	IF(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0) +
		IFNULL(end_theory, 0) +
		IFNULL(end_practical, 0) >= 20,

		'Pass',
		'Fail' 
	) AS status
FROM 
	exam_marks;


--see_grade--

CREATE VIEW show_grade_whole_batch AS
SELECT
	e.stu_id,
	e.cour_code,
	e.quiz_1,
	e.quiz_2,
	e.quiz_3,
	e.mid_theory,
	e.mid_practical,
    e.end_theory,
    e.end_practical,
	e.assessment,
	ROUND(
		((IFNULL(e.quiz_1, 0) +
		IFNULL(e.quiz_2, 0) +
		IFNULL(e.quiz_3, 0) -
		LEAST(
			IFNULL(e.quiz_1, 0),
			IFNULL(e.quiz_2, 0),
			IFNULL(e.quiz_3, 0)
		)) / 2) +
		(IFNULL(e.assessment, 0) / 2) +
		IFNULL(e.mid_theory, 0) +
		IFNULL(e.mid_practical, 0) +
		IFNULL(e.end_theory, 0) +
		IFNULL(e.end_practical, 0), 2)
	AS FINAL_Marks,
	CASE
        WHEN
            s.stu_status = 'Rejected' THEN 'WH'
        WHEN
            s.stu_status = 'Repeat' THEN 'C'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 85 THEN 'A+'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 75 THEN 'A'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 70 THEN 'A-'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 65 THEN 'B+'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 60 THEN 'B'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 55 THEN 'B-'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 50 THEN 'C+'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 45 THEN 'C'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 40 THEN 'C-'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 35 THEN 'D'
		ELSE 'E'
	END AS grade,

	CASE
        WHEN
            s.stu_status = 'Rejected' THEN '2.0'
        WHEN
            s.stu_status = 'Repeat' THEN '2.0'
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 85 THEN 4.0
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 75 THEN 4.0
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 70 THEN 3.7
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 65 THEN 3.3
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 60 THEN 3.0
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 55 THEN 2.7
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 50 THEN 2.3
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 45 THEN 2.0
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 40 THEN 1.7
		WHEN
			((IFNULL(e.quiz_1, 0) +
			IFNULL(e.quiz_2, 0) +
			IFNULL(e.quiz_3, 0) -
			LEAST(
				IFNULL(e.quiz_1, 0),
				IFNULL(e.quiz_2, 0),
				IFNULL(e.quiz_3, 0)
			)) / 2) +
			(IFNULL(e.assessment, 0) / 2) +
			IFNULL(e.mid_theory, 0) +
			IFNULL(e.mid_practical, 0) +
			IFNULL(e.end_theory, 0) +
			IFNULL(e.end_practical, 0) >= 35 THEN 1.3
		ELSE 0
	END AS grade_point
FROM
	exam_marks e
INNER JOIN
    student s ON s.stu_id = e.stu_id;


--Marks for each subject whole batch--

CREATE VIEW each_subject_marks_as_whole_batch AS
SELECT
    stu_id,
    cour_code,
	quiz_1,
	quiz_2,
	quiz_3,
	mid_theory,
	mid_practical,
	end_theory,
	end_practical,
	assessment,
	ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0), 2)
	AS CA_Marks,
	
	IF( ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0), 2) > 20, 
	
	ROUND(
		((IFNULL(quiz_1, 0) +
		IFNULL(quiz_2, 0) +
		IFNULL(quiz_3, 0) -
		LEAST(
			IFNULL(quiz_1, 0),
			IFNULL(quiz_2, 0),
			IFNULL(quiz_3, 0)
		)) / 2) +
		(IFNULL(assessment, 0) / 2) +
		IFNULL(mid_theory, 0) +
		IFNULL(mid_practical, 0) +
		IFNULL(end_theory, 0) +
		IFNULL(end_practical, 0), 2), NULL) AS final_marks

FROM
	exam_marks;


--SGPA calculate whole batch--

CREATE VIEW sgpa_of_whole_batch AS
SELECT
    s.stu_id,
    ROUND(
        SUM(s.grade_point * c.cour_credit) / SUM(c.cour_credit)
    , 2) AS SGPA
FROM
    show_grade_whole_batch s
INNER  JOIN
    course c ON s.cour_code = c.cour_code
GROUP BY
    s.stu_id;


-- --CGPA of whole batch---

-- CREATE VIEW cgpa_of_whole_batch AS
-- SELECT
--     s.stu_id,
--     ROUND(
--         SUM(s.grade_point * c.cour_credit) / 38
--     , 2) AS cgpa
-- FROM
--     show_grade_whole_batch s
-- INNER  JOIN
--     course c ON s.cour_code = c.cour_code
-- GROUP BY
--     s.stu_id;
    

--check eligibility for final exam whole batch--

CREATE VIEW eligible_of_final_exam_whole_batch AS
SELECT
    c.stu_id,
    c.cour_code,
    CASE
        WHEN m.med_attendance >= 80 THEN 'eligible'
        ELSE 'not eligible'
    END AS final_exam_eligible_student
FROM
    show_ca_marks_eligibility_student c
LEFT JOIN
    attendance_with_medical m ON c.stu_id = m.stu_id AND c.cour_code = m.cour_code;
