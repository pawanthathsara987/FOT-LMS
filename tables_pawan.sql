
CREATE TABLE department(
    dep_id CHAR(4) PRIMARY KEY,
    dep_name VARCHAR(25)

);

CREATE TABLE course(
    cour_code CHAR(10) PRIMARY KEY,
    dep_id CHAR(4),
    cour_name VARCHAR(50),
    cour_status VARCHAR(50),
    cour_credit INT(1),
    FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);

CREATE TABLE dean(
    dean_id CHAR(4) PRIMARY KEY,
    dean_fname VARCHAR(50),
    dean_lname VARCHAR(50),
    dean_email VARCHAR(50),
    gender ENUM('M', 'F'),
    dean_dob DATE,
    dean_mobile INT(10)
);

CREATE TABLE stu_course(
    stu_id CHAR(8),
    cour_code CHAR(10),

    FOREIGN KEY (stu_id) REFERENCES student(stu_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code)
);

CREATE USER 'admin'@'localhost'  IDENTIFIED BY 'admin1234';
GRANT ALL PRIVILEGES ON fot_lms.* TO  'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'dean'@'localhost' IDENTIFIED BY 'dean1234';
GRANT ALL PRIVILEGES ON fot_lms.* TO 'dean'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecture1234';
GRANT ALL PRIVILEGES ON fot_lms.* TO 'lecturer'@'localhost';
REVOKE CREATE USER ON *.* FROM 'lecturer'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'technicalofficer'@'localhost' IDENTIFIED BY 'to1234';

GRANT SELECT,SHOW VIEW,INSERT,UPDATE ON fot_lms.attendance TO 'technicalofficer'@'localhost';
GRANT SELECT,SHOW VIEW,INSERT,UPDATE ON fot_lms.attendance_with_medical TO 'technicalofficer'@'localhost';
GRANT SELECT,SHOW VIEW,INSERT,UPDATE ON fot_lms.attendance_without_medical TO 'technicalofficer'@'localhost';

FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE fot_lms.show_ca_marks_by_course_id TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.show_ca_marks_by_student_id_and_course_id TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.show_ca_marks_using_student_id TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.show_final_marks_using_student_id TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.show_marks_each_subject_as_individual TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.show_marks_one_subject_as_individual TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.grade_for_each_subject_as_individual TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.grade_for_one_subject_as_individual TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.sgpa_of_student_as_individual TO 'technicalofficer'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.eligible_for_final_exam_as_individual TO 'technicalofficer'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'technicalofficer'@'localhost';

CREATE USER 'student'@'localhost' IDENTIFIED BY 'student1234';
GRANT EXECUTE ON PROCEDURE fot_lms.show_final_marks_using_student_id TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE fot_lms.eligible_for_final_exam_as_individual TO 'student'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'student'@'localhost';