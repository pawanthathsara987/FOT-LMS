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



    -- Final marks whole bacth--

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
	IFNULL(mid_practical, 0) >= 20;


    DELIMITER //



    

CREATE PROCEDURE show_ca_marks_by_course_id(
	IN course_code CHAR(8)
)
BEGIN
	SELECT
		stu_id,
		cour_code,
		ROUND(
			IFNULL(quiz_1, 0) +
			IFNULL(quiz_2, 0) +
			IFNULL(quiz_3, 0) -
			LEAST(
				IFNULL(quiz_1, 0),
				IFNULL(quiz_2, 0),
				IFNULL(quiz_3, 0)
			) +
			(IFNULL(assessment, 0) / 2) +
			IFNULL(mid_theory, 0) +
			IFNULL(mid_practical, 0), 2)
		AS CA_Marks
	FROM exam_marks
	WHERE cour_code = course_code;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE show_ca_marks_by_student_id_and_course_id(
	IN student_id CHAR(6),
	IN course_code CHAR(8)
)
BEGIN
	SELECT
		stu_id,
		cour_code,
		ROUND(
			IFNULL(quiz_1, 0) +
			IFNULL(quiz_2, 0) +
			IFNULL(quiz_3, 0) -
			LEAST(
				IFNULL(quiz_1, 0),
				IFNULL(quiz_2, 0),
				IFNULL(quiz_3, 0)
			) +
			(IFNULL(assessment, 0) / 2) +
			IFNULL(mid_theory, 0) +
			IFNULL(mid_practical, 0), 2)
		AS CA_Marks
	FROM
		exam_marks
	WHERE
		stu_id = student_id AND cour_code = course_code;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE show_ca_marks_using_student_id(
	IN student_id CHAR(6)
)

BEGIN
	SELECT
		stu_id,
		cour_code,
		quiz_1,
		quiz_2,
		quiz_3,
		assessment,
		mid_theory,
		mid_practical,
		ROUND(
			IFNULL(quiz_1, 0) +
			IFNULL(quiz_2, 0) +
			IFNULL(quiz_3, 0) -
			LEAST(
				IFNULL(quiz_1, 0),
				IFNULL(quiz_2, 0),
				IFNULL(quiz_3, 0)
			) +
			(IFNULL(assessment, 0) / 2) +
			IFNULL(mid_theory, 0) +
			IFNULL(mid_practical, 0), 2)
		AS CA_Marks
	FROM
		exam_marks
	WHERE
		stu_id = student_id;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE show_final_marks_using_student_id(
	IN student_id CHAR(6)
)
BEGIN
	SELECT
		stu_id,
		cour_code,
		ROUND(
			IFNULL(quiz_1, 0) +
			IFNULL(quiz_2, 0) +
			IFNULL(quiz_3, 0) -
			LEAST(
				IFNULL(quiz_1, 0),
				IFNULL(quiz_2, 0),
				IFNULL(quiz_3, 0)
			) +
			(IFNULL(assessment, 0) / 2) +
			IFNULL(mid_theory, 0) +
			IFNULL(mid_practical, 0) +
			IFNULL(end_theory, 0) +
			IFNULL(end_practical, 0), 2)
		AS final_marks
	FROM
		exam_marks
	WHERE
		stu_id = student_id;
END //

DELIMITER ;



CREATE USER 'admin'@'localhost'IDENTIFIED BY '1234';
CREATE USER 'lecturer'@'localhost'IDENTIFIRD BY '1234';
