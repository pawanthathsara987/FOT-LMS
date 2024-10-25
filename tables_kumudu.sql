CREATE TABLE Student (
    stu_id CHAR(8) PRIMARY KEY,
    stu_fname VARCHAR(50),
    stu_lname VARCHAR(50), 
    stu_email VARCHAR(100),
    stu_DOB DATE,
    stu_Gender ENUM('M','F'),
    stu_Mobile INT(10),
    dep_Id CHAR(4)  
);