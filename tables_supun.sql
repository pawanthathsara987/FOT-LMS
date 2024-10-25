CREATE TABLE lecturer(
    lec_id CHAR(5) PRIMARY KEY,
    dep_id CHAR(4),
    cour_code CHAR(10),
    lec_fname VARCHAR(20),
    lec_lname VARCHAR(20),
    lec_email VARCHAR(20),
    gender ENUM ('M','F'),
    lec_dob DATE,
    lec_mobile INT(10),
    FOREIGN KEY (dep_id) REFERENCES department(dep_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code)
);