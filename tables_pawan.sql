
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