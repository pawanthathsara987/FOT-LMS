
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

ALTER TABLE dean
ADD dean_mobile CHAR(15);

CREATE TABLE stu_course(
    stu_id CHAR(8),
    cour_code CHAR(10),

    FOREIGN KEY (stu_id) REFERENCES student(stu_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code)
);

ALTER TABLE stu_course
ADD cour_status VARCHAR(10);


/*Table data*/

INSERT INTO department
    (dep_id,dep_name)
VALUES
    ("d001","ET"),
    ("d002","ICT"),
    ("d003","BST"),
    ("d004","MDS");


INSERT INTO course
    (cour_code,dep_id,cour_name,cour_status,cour_credit)
VALUES
    ("ICT1212","d002","Database Management Systems","T",2),
    ("ICT1222","d002","Database Management Systems Practicum","P",2),
    ("ICT1233","d002","Server Side Web Development","T/P",3),
    ("ICT1242","d002","Computer Architecture","T",2),
    ("ICT1253","d002","Computer Networks","T/P",3),
    ("TCS1212","d004","Fundamentals of Management","T",2),
    ("TMS1233","d004","Discrete Mathematics","T",2),
    ("ENG1212","d004","English","T",2);

UPDATE course
SET cour_credit = 3
WHERE cour_code = "TMS1233";

INSERT INTO course
    (cour_code,dep_id,cour_name,cour_status,cour_credit)
VALUES
    ("ENT1221","d001","Common Practical III","P",1),
    ("ENT1211","d001","Workshop Technology II","P",1),
    ("TMS1223","d001","Computer Programming","T/P",3),
    ("ENT1231","d001","Common Practical II","P",1),
    ("ENT1253","d001","Engineering Properties of Matter","T",3),
    ("TMS1213","d001","Applied Calculus II","T",3),
    ("ENT1242","d001","Electricity and Magnetism","T",2);

INSERT INTO course
    (cour_code,dep_id,cour_name,cour_status,cour_credit)
VALUES
    ("BST1272","d003","Introduction to Fisheries Biology","T",2),
    ("BST1212","d003","Information Technology","T/P",2),
    ("BST1222","d003","Electronics for BST","T/P",2),
    ("BST1232","d003","Organic Chemistry","T/P",2),
    ("BST1242","d003","Basic Chemistry","T/P",2),
    ("BST1251","d003","Fundamentals Genetics","T",1),
    ("BST1262","d003","Basic Microbiology","T/P",2),
    ("BST1282","d003","Fundamentals In Agriculture","T/P",2);


INSERT INTO dean
    (dean_id,dean_fname,dean_lname,dean_email,gender,dean_dob,dean_mobile)
VALUES
    ("dn1","Subash","Jayasinghe","subash_fot@gmail.com","M","1970-02-01","7712332199");