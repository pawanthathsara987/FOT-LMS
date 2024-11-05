
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
MODIFY dean_mobile CHAR(15);

CREATE TABLE stu_course(
    stu_id CHAR(8),
    cour_code CHAR(10),

    FOREIGN KEY (stu_id) REFERENCES student(stu_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code)
);

<<<<<<< HEAD
ALTER TABLE stu_course
ADD cour_status VARCHAR(10);

ALTER TABLE stu_course
DROP COLUMN cour_status;

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

UPDATE course
    SET cour_hours = CASE cour_code
        WHEN "ICT1212" THEN 30
        WHEN "ICT1222" THEN 60
        WHEN "ICT1233" THEN 60
        WHEN "ICT1242" THEN 30
        WHEN "ICT1253" THEN 30
        WHEN "TCS1212" THEN 30
        WHEN "TMS1233" THEN 45
        WHEN "ENG1212" THEN 30
    END
    WHERE user_id IN ("ICT1212", "ICT1222", "ICT1233", "ICT1242","ICT1253","TCS1212","TMS1233","ENG1212");

UPDATE course
SET cour_hours = 30
WHERE cour_code = "ICT1233";

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

UPDATE course
    SET cour_hours = CASE cour_code
        WHEN "ENT1221" THEN 30
        WHEN "ENT1211" THEN 60
        WHEN "TMS1223" THEN 60
        WHEN "ENT1231" THEN 30
        WHEN "ENT1253" THEN 30
        WHEN "TMS1213" THEN 30
        WHEN "TMS1233" THEN 45
        WHEN "ENT1242" THEN 30
    END
    WHERE cour_code IN ("ENT1221", "ENT1211", "TMS1223", "ENT1231","ENT1253","TMS1213","TMS1233","ENT1242");

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

UPDATE course
    SET cour_hours = CASE cour_code
        WHEN "BST1272" THEN 30
        WHEN "BST1212" THEN 60
        WHEN "BST1222" THEN 60
        WHEN "BST1232" THEN 30
        WHEN "BST1242" THEN 30
        WHEN "BST1251" THEN 30
        WHEN "BST1262" THEN 45
        WHEN "BST1282" THEN 30
    END
    WHERE cour_code IN ("BST1272", "BST1212", "BST1222", "BST1232","BST1242","BST1251","BST1262","BST1282");

ALTER TABLE course 
ADD cour_hours INT(2);

INSERT INTO dean
    (dean_id,dean_fname,dean_lname,dean_email,gender,dean_dob,dean_mobile)
VALUES
    ("dn1","Subash","Jayasinghe","subash_fot@gmail.com","M","1970-02-01","7712332199");



INSERT INTO stu_course
    (stu_id ,cour_code)
VALUES
    ('TG1001','ICT1222'),
    ('TG1001','ICT1233'),
    ('TG1001','ICT1242'),
    ('TG1001','ICT1253'),
    ('TG1001','TCS1212'),
    ('TG1001','ICT1212'),
    ('TG1001','TMS1233'),
    ('TG1001','ENG1212'),

    ('TG1002','ICT1212'),
    ('TG1002','ICT1222'),
    ('TG1002','ICT1233'),
    ('TG1002','ICT1242'),
    ('TG1002','ICT1253'),
    ('TG1002','TCS1212'),
    ('TG1002','TMS1233'),
    ('TG1002','ENG1212'),

    ('TG1003','ICT1212'),
    ('TG1003','ICT1222'),
    ('TG1003','ICT1233'),
    ('TG1003','ICT1242'),
    ('TG1003','ICT1253'),
    ('TG1003','TCS1212'),
    ('TG1003','TMS1233'),
    ('TG1003','ENG1212'),

    ('TG1004','ICT1212'),
    ('TG1004','ICT1222'),
    ('TG1004','ICT1233'),
    ('TG1004','ICT1242'),
    ('TG1004','ICT1253'),
    ('TG1004','TCS1212'),
    ('TG1004','TMS1233'),
    ('TG1004','ENG1212'),

    ('TG1005','ICT1212'),
    ('TG1005','ICT1222'),
    ('TG1005','ICT1233'),
    ('TG1005','ICT1242'),
    ('TG1005','ICT1253'),
    ('TG1005','TCS1212'),
    ('TG1005','TMS1233'),
    ('TG1005','ENG1212'),

    ('TG1006','ICT1212'),
    ('TG1006','ICT1222'),
    ('TG1006','ICT1233'),
    ('TG1006','ICT1242'),
    ('TG1006','ICT1253'),
    ('TG1006','TCS1212'),
    ('TG1006','TMS1233'),
    ('TG1006','ENG1212'),

    ('TG1007','ICT1212'),
    ('TG1007','ICT1222'),
    ('TG1007','ICT1233'),
    ('TG1007','ICT1242'),
    ('TG1007','ICT1253'),
    ('TG1007','TCS1212'),
    ('TG1007','TMS1233'),
    ('TG1007','ENG1212'),

    ('TG1008','ICT1212'),
    ('TG1008','ICT1222'),
    ('TG1008','ICT1233'),
    ('TG1008','ICT1242'),
    ('TG1008','ICT1253'),
    ('TG1008','TCS1212'),
    ('TG1008','TMS1233'),
    ('TG1008','ENG1212'),

    ('TG1009','ICT1212'),
    ('TG1009','ICT1222'),
    ('TG1009','ICT1233'),
    ('TG1009','ICT1242'),
    ('TG1009','ICT1253'),
    ('TG1009','TCS1212'),
    ('TG1009','TMS1233'),
    ('TG1009','ENG1212'),

    ('TG1010','ICT1212'),
    ('TG1010','ICT1222'),
    ('TG1010','ICT1233'),
    ('TG1010','ICT1242'),
    ('TG1010','ICT1253'),
    ('TG1010','TCS1212'),
    ('TG1010','TMS1233'),
    ('TG1010','ENG1212'),

    ('TG0324','ICT1222'),
    ('TG0324','ICT1242'),
    ('TG0324','TMS1233'),

    ('TG0235','TMS1233'),
    ('TG0235','ENG1212'),

    ('TG0207','ICT1212'),
    ('TG0207','TCS1212'),
    ('TG0207','ENG1212'),

    ('TG0420','ICT1212'),
    ('TG0420','TMS1233'),

    ('TG0792','ICT1233'),

    ('TG0711','ICT1212'),
    ('TG0711','ICT1222'),

    ('TG0752','ICT1242'),
    ('TG0752','TCS1212'),
    ('TG0752','ENG1212'),

    ('TG0639','ICT1253'),
    ('TG0639','TCS1212');
  

INSERT INTO stu_course
    (stu_id ,cour_code)
VALUES
    ('TG1011','ENT1221'),
    ('TG1011','ENT1211'),
    ('TG1011','TMS1223'),
    ('TG1011','ENT1231'),
    ('TG1011','ENT1253'),
    ('TG1011','TMS1213'),
    ('TG1011','ENT1242'),

    ('TG1014','ENG1212'),
    ('TG1014','TCS1212'),
    ('TG1014','ENT1221'),
    ('TG1014','ENT1211'),
    ('TG1014','TMS1223'),
    ('TG1014','ENT1231'),
    ('TG1014','ENT1253'),
    ('TG1014','TMS1213'),
    ('TG1014','ENT1242'),
    ('TG1014','ENG1212'),
    ('TG1014','TCS1212'),

    ('TG0515','ENT1221'),
    ('TG0515','ENT1253'),
    ('TG0515','TMS1213');

INSERT INTO stu_course
    (stu_id ,cour_code)
VALUE
    ('TG1012','BST1272'),
    ('TG1012','BST1212'),
    ('TG1012','BST1222'),
    ('TG1012','BST1232'),
    ('TG1012','BST1242'),
    ('TG1012','BST1251'),
    ('TG1012','BST1262'),
    ('TG1012','BST1282'),
    ('TG1012','ENG1212'),
    ('TG1012','TCS1212'),

    ('TG1013','BST1272'),
    ('TG1013','BST1212'),
    ('TG1013','BST1222'),
    ('TG1013','BST1232'),
    ('TG1013','BST1242'),
    ('TG1013','BST1251'),
    ('TG1013','BST1262'),
    ('TG1013','BST1282'),
    ('TG1013','ENG1212'),
    ('TG1013','TCS1212'),

    ('TG1015','BST1272'),
    ('TG1015','BST1212'),
    ('TG1015','BST1222'),
    ('TG1015','BST1232'),
    ('TG1015','BST1242'),
    ('TG1015','BST1251'),
    ('TG1015','BST1262'),
    ('TG1015','BST1282'),
    ('TG1015','ENG1212'),
    ('TG1015','TCS1212'),

    ('TG0611','ENG1212'),
    ('TG0611','TCS1212');

INSERT INTO medical
    (med_id,stu_id,atten_id,tec_officer_id,med_date,med_descrip)
VALUES
    ("m001","TG1001","a0006","TO01","2024-08-12","Headaches"),
    ("m002","TG1001","a0009","TO01","2024-09-02","Stomach Aches"),
    ("m003","TG1002","a0152","TO02","2024-07-15","Colds and Flu"),
    ("m004","TG1003","a0304","TO03","2024-07-29","Headaches"),
    ("m005","TG1003","a0332","TO03","2024-07-16","Headaches"),
    ("m006","TG1004","a0501","TO04","2024-08-13","Stomach Aches"),
    ("m007","TG1004","a0587","TO04","2024-07-18","Stomach Aches");



/* VIEW For Ict Courses */

CREATE VIEW ict_courses AS
SELECT *
FROM course
WHERE dep_id IN ("d002","d004");


/* Whole batch attendance without medical*/

CREATE VIEW attendance_without_medical AS
SELECT a.stu_id,a.cour_code,
    SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END) AS present_status,
    SUM(CASE WHEN a.atten_status = "absent" THEN 1 ELSE 0 END) AS abs_status,
    (SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)/(SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)+SUM(CASE WHEN a.atten_status = "absent" THEN 1 ELSE 0 END)))*100 AS percentage,
    CASE WHEN(SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)/(SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)+SUM(CASE WHEN a.atten_status = "absent" THEN 1 ELSE 0 END)))*100 >= 80 THEN  "eligible" ELSE "not_eligible" END AS eligibility
    FROM attendance a
    GROUP BY a.stu_id,a.cour_code; 

SELECT stu_id,cour_code
FROM attendance_without_medical
WHERE eligibility = "eligible";

SELECT stu_id,cour_code
FROM attendance_without_medical
WHERE eligibility = "not_eligible";

/* Whole batch attendance with medical*/

CREATE VIEW attendance_with_medical AS
SELECT a.stu_id,a.cour_code,
(SUM(CASE WHEN a.atten_date = m.med_date THEN 1 ELSE 0 END) + SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)) / (SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)+SUM(CASE WHEN a.atten_status = "absent" THEN 1 ELSE 0 END)) * 100 AS  med_attendance,
CASE WHEN ((SUM(CASE WHEN a.atten_date = m.med_date THEN 1 ELSE 0 END) + SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)) / (SUM(CASE WHEN a.atten_status = "present" THEN 1 ELSE 0  END)+SUM(CASE WHEN a.atten_status = "absent" THEN 1 ELSE 0 END)) * 100) >= 80 THEN  "eligible" ELSE "not_eligible" END AS eligibility
FROM attendance a
LEFT JOIN medical m ON a.stu_id = m.stu_id
GROUP BY a.stu_id,a.cour_code;

SELECT stu_id,cour_code
FROM attendance_with_medical
WHERE eligibility = "eligible";

SELECT stu_id,cour_code
FROM attendance_with_medical
WHERE eligibility = "not_eligible";
