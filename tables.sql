
CREATE TABLE department(
    dep_id CHAR(4) PRIMARY KEY,
    dep_name VARCHAR(25)

);

CREATE TABLE course(
    cour_code CHAR(10) PRIMARY KEY,
    cour_name VARCHAR(50),
    cour_status VARCHAR(50),
    cour_credit INT(1)
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