---------------------------------CA marks using course code------------------------------

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
END //

DELIMITER ;

------------------------------ca marks using student id and course code-------------------------------

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
END //

DELIMITER ;


-----------------------------------calulate ca marks by student id--------------------------------------------

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
END //

DELIMITER ;


--------------------------------------------Show final mark using student ID ---------------------------------

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
END //

DELIMITER ;



--Marks for each subject as individual--

DELIMITER //

CREATE PROCEDURE show_marks_each_subject_as_individual(
	IN student_id CHAR(6)
)
BEGIN
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
        exam_marks
    WHERE
        stu_id = student_id;
END //

DELIMITER ;


----Marks for one subject as individual--

DELIMITER //

CREATE PROCEDURE show_marks_one_subject_as_individual(
	IN student_id CHAR(6),
    IN course_code CHAR(8)
)
BEGIN
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
        exam_marks
    WHERE
        stu_id = student_id && cour_code = course_code;
END //

DELIMITER ;

----Grade for each subject as individual--

DELIMITER //

CREATE PROCEDURE grade_for_each_subject_as_individual(
    IN student_id CHAR(6)
)
BEGIN
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
            IFNULL(mid_practical, 0) +
            IFNULL(end_theory, 0) +
            IFNULL(end_practical, 0), 2)
        AS CA_Marks,
        CASE
            WHEN
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
                IFNULL(end_practical, 0) >= 90 THEN 'A+'
            WHEN
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
                IFNULL(end_practical, 0) >= 80 THEN 'A'
            WHEN
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
                IFNULL(end_practical, 0) >= 70 THEN 'A-'
            WHEN
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
                IFNULL(end_practical, 0) >= 65 THEN 'B+'
            WHEN
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
                IFNULL(end_practical, 0) >= 60 THEN 'B'
            WHEN
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
                IFNULL(end_practical, 0) >= 55 THEN 'B-'
            WHEN
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
                IFNULL(end_practical, 0) >= 50 THEN 'C+'
            WHEN
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
                IFNULL(end_practical, 0) >= 45 THEN 'C'
            WHEN
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
                IFNULL(end_practical, 0) >= 40 THEN 'C-'
            WHEN
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
                IFNULL(end_practical, 0) >= 35 THEN 'D+'
            WHEN
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
                IFNULL(end_practical, 0) >= 30 THEN 'D'
            WHEN
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
                IFNULL(end_practical, 0) >= 25 THEN 'D-'
            ELSE 'E'
        END AS grade
    FROM
        exam_marks
    WHERE
        stu_id = student_id;
END //

DELIMITER ;


----Grade for one subject as individual--

DELIMITER //

CREATE PROCEDURE grade_for_one_subject_as_individual(
    IN student_id CHAR(6),
    IN course_code CHAR(8)
)
BEGIN
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
            IFNULL(mid_practical, 0) +
            IFNULL(end_theory, 0) +
            IFNULL(end_practical, 0), 2)
        AS CA_Marks,
        CASE
            WHEN
                s.stu_status = 'Rejected' THEN 'WH'
            WHEN
                s.stu_status = 'Repeat' THEN 'C'
            WHEN
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
                IFNULL(end_practical, 0) >= 90 THEN 'A+'
            WHEN
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
                IFNULL(end_practical, 0) >= 80 THEN 'A'
            WHEN
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
                IFNULL(end_practical, 0) >= 70 THEN 'A-'
            WHEN
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
                IFNULL(end_practical, 0) >= 65 THEN 'B+'
            WHEN
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
                IFNULL(end_practical, 0) >= 60 THEN 'B'
            WHEN
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
                IFNULL(end_practical, 0) >= 55 THEN 'B-'
            WHEN
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
                IFNULL(end_practical, 0) >= 50 THEN 'C+'
            WHEN
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
                IFNULL(end_practical, 0) >= 45 THEN 'C'
            WHEN
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
                IFNULL(end_practical, 0) >= 40 THEN 'C-'
            WHEN
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
                IFNULL(end_practical, 0) >= 35 THEN 'D+'
            WHEN
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
                IFNULL(end_practical, 0) >= 30 THEN 'D'
            WHEN
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
                IFNULL(end_practical, 0) >= 25 THEN 'D-'
            ELSE 'E'
        END AS grade,

        CASE
            WHEN
                s.stu_status = 'Rejected' THEN '2.0'
            WHEN
                s.stu_status = 'Repeat' THEN '2.0'
            WHEN
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
                IFNULL(end_practical, 0) >= 85 THEN 4.0
            WHEN
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
                IFNULL(end_practical, 0) >= 75 THEN 4.0
            WHEN
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
                IFNULL(end_practical, 0) >= 70 THEN 3.7
            WHEN
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
                IFNULL(end_practical, 0) >= 65 THEN 3.3
            WHEN
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
                IFNULL(end_practical, 0) >= 60 THEN 3.0
            WHEN
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
                IFNULL(end_practical, 0) >= 55 THEN 2.7
            WHEN
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
                IFNULL(end_practical, 0) >= 50 THEN 2.3
            WHEN
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
                IFNULL(end_practical, 0) >= 45 THEN 2.0
            WHEN
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
                IFNULL(end_practical, 0) >= 40 THEN 1.7
            WHEN
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
                IFNULL(end_practical, 0) >= 35 THEN 1.3
            ELSE 0
        END AS grade_point
    FROM
        exam_marks
    INNER JOIN
        student s ON stu_id = exam_marks.stu_id
    WHERE
        stu_id = student_id && cour_code = course_code;
END //

DELIMITER ;

--sgpa_of_student_as_individual

DELIMITER //
CREATE PROCEDURE sgpa_of_student_as_individual(
    IN student_id CHAR(6)
)
BEGIN
    SELECT
        s.stu_id,
        ROUND(
            SUM(s.grade_point * c.cour_credit) / SUM(c.cour_credit)
        , 2) AS sgpa
    FROM
        show_grade_whole_batch s
    INNER  JOIN
        course c ON s.cour_code = c.cour_code
    WHERE
        stu_id = student_id
    GROUP BY
        s.stu_id;
END //

DELIMITER ;