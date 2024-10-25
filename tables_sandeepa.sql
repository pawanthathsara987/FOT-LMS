CREATE TABLE exam_marks(
    stu_id CHAR (8) NOT NULL,
    cour_code CHAR (10) NOT NULL,
    quiz_1 TINYINT UNSIGNED,
    quiz_2 TINYINT UNSIGNED,
    quiz_3 TINYINT UNSIGNED,
    mid_theory TINYINT UNSIGNED,
    mid_practical TINYINT UNSIGNED,
    end_theory TINYINT UNSIGNED,
    end_practical TINYINT  UNSIGNED,
    assessment TINYINT UNSIGNED,
    grade CHAR (1),
    PRIMARY KEY (stu_id,cour_code),
    CHECK (quiz_1 BETWEEN 0 AND 10),
    CHECK (quiz_2 BETWEEN 0 AND 10),
    CHECK (quiz_3 BETWEEN 0 AND 10),
    CHECK (mid_theory BETWEEN 0 AND 100),
    CHECK (mid_practical BETWEEN 0 AND 100),
    CHECK (end_theory BETWEEN 0 AND 100),
    CHECK (end_practical BETWEEN 0 AND 100),
    CHECK (assessment BETWEEN 0 AND 10),
    CHECK (grade IN ('A','B','C','S','F'))
);


CREATE TABLE admin(
    adm_id CHAR (8) PRIMARY KEY,
    adm_fname VARCHAR (20) NOT NULL,
    adm_lname VARCHAR (20) NOT NULL,
    adm_email VARCHAR (50) NOT NULL,
    adm_dob DATE,
    adm_gender CHAR (1),
    adm_mobile INT (10),
    CHECK (adm_gender IN ('M','F'))
);