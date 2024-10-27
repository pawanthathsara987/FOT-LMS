CREATE TABLE student (
    stu_id CHAR(8) PRIMARY KEY,
    stu_fname VARCHAR(50),
    stu_lname VARCHAR(50), 
    stu_email VARCHAR(100),
    stu_dob DATE,
    stu_gender ENUM('M','F'),
    stu_mobile INT(10),
    dep_id CHAR(4)  
);

ALTER TABLE student
ADD stu_status VARCHAR(10);

ALTER TABLE student
ADD FOREIGN KEY (dep_id) REFERENCES department(dep_id);

/* attendence table */

CREATE TABLE attendence (
    atten_id CHAR(6) PRIMARY KEY,
    stu_id CHAR(8),
    cour_code CHAR(10),
    tec_officer_id CHAR(5),
    atten_date DATE,
    atten_status VARCHAR(10),
    FOREIGN KEY (stu_id) REFERENCES student(stu_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code),
    FOREIGN KEY (tec_officer_id) REFERENCES tec_officer(tec_officer_id)
);

