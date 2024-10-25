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

