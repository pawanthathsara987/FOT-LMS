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

RENAME TABLE attendence TO attendance;

ALTER TABLE attendance
ADD atten_type VARCHAR(10);

/* medical table */

CREATE TABLE medical (
    med_id CHAR(5) PRIMARY KEY,
    stu_id CHAR(8),
    atten_id CHAR(6),
    tec_officer_id CHAR(5),
    med_date DATE,
    med_descrip VARCHAR(150),
    FOREIGN KEY (tec_officer_id) REFERENCES tec_officer(tec_officer_id),
    FOREIGN KEY (atten_id) REFERENCES attendance(atten_id),
    FOREIGN KEY (stu_id) REFERENCES student(stu_id)
);


/* student table data */

INSERT INTO student 
(stu_id, stu_fname, stu_lname, stu_email, stu_dob, stu_gender, stu_mobile, dep_id, stu_status)
VALUES
('TG1001', 'Kumudu', 'Sandeepanee', 'kumudu4746@gmail.com', '2002-07-10', 'F', 779791106, 'd002', 'Proper'),
('TG1002', 'Krishani', 'Imalka', 'krishani02@gmail.com', '2002-08-05', 'F', 753467543, 'd002', 'Proper'),
('TG1003', 'Pawan', 'Thathsara', 'pawanthathsara@gmail.com', '2002-02-20', 'M', 762356789, 'd002', 'Proper'),
('TG1004', 'Ishara', 'Sewwandi', 'ishara09@gmail.com', '2002-07-26', 'F', 776482628, 'd002', 'Proper'),
('TG1005', 'Kaveesha', 'Keshali', 'kaveesha@gmail.com', '2002-02-04', 'F', 766423984, 'd002', 'Proper'),
('TG1006', 'Sanduni', 'Bhagya', 'sanduni_b12@gmail.com', '2002-09-10', 'F', 711265346, 'd002', 'Proper'),
('TG1007', 'Supun', 'Sandaruwan', 'supunsandaruwan@gmail.com', '2001-03-05', 'M', 777634667, 'd002', 'Proper'),
('TG1008', 'Shamali', 'Dilrukshi', 'shamali45@gmail.com', '2002-12-24', 'F', 752635982, 'd002', 'Proper'),
('TG1009', 'Kavinda', 'Madushan', 'kavindu23@gmail.com', '2001-05-14', 'M', 772356432, 'd002', 'Proper'),
('TG1010', 'Oshadi', 'Pabasara', 'oshadu49@gmail.com', '2002-09-16', 'F', 775637871, 'd002', 'Proper'),
('TG1011', 'Methasara', 'Senarathna', 'methasara4147@gmail.com', '2001-01-04', 'M', 759934610, 'd001', 'Proper'),
('TG1012', 'Navodya', 'Tharangani', 'navodya_21@gmail.com', '2002-12-16', 'F', 775237845, 'd003', 'Proper'),
('TG1013', 'Shakya', 'Jayawardhana', 'shakya_jaya@gmail.com', '2001-02-06', 'F', 769836521, 'd003', 'Proper'),
('TG1014', 'Kavindu', 'Dilshan', 'kavi_dilshan@gmail.com', '2002-03-26', 'M', 753081461, 'd001', 'Proper'),
('TG1015', 'Minidu', 'Pahasara', 'minidu_123@gmail.com', '2002-05-27', 'M', 762649019, 'd003', 'Proper'),
('TG0324', 'Hasitha', 'Prabhath', 'hasitha_prabha@gmail.com', '1999-11-06', 'M', 756643572, 'd002', 'Repeat'),
('TG0515', 'Kasun', 'Sampath', 'kasunsampath@gmail.com', '2000-03-29', 'M', 716744328, 'd001', 'Repeat'),
('TG0235', 'Asanka', 'Shammika', 'shammika_1@gmail.com', '1999-06-02', 'M', 752376453, 'd002', 'Repeat'),
('TG0207', 'Lahiru', 'Kavinda', 'lahiru7@gmail.com', '1999-11-26', 'M', 761928403, 'd002', 'Repeat'),
('TG0039', 'Tharushi', 'Wathsala', 'tharushi_1234@gmail.com', '1997-08-01', 'F', 771167345, 'd003', 'Rejected'),
('TG0420', 'Nisal', 'Gunawardhana', 'nisal_456@gmail.com', '2000-03-20', 'M', 770573519, 'd002', 'Repeat'),
('TG0080', 'Senuri', 'Apsara', 'senuriapsara@gmail.com', '1998-10-24', 'F', 776283471, 'd001', 'Rejected'),
('TG0611', 'Chamika', 'Hirushan', 'chamikahirushan@gmail.com', '2000-08-20', 'M', 770264914, 'd003', 'Repeat'),
('TG0792', 'Madushan', 'Sanjeewa', 'madhu_4567@gmail.com', '2001-04-02', 'M', 768127640, 'd002', 'Repeat'),
('TG0480', 'Gihan', 'Kavishka', 'gihan_kavi@gmail.com', '2000-09-24', 'M', 766281390, 'd002', 'Rejected'),
('TG0711', 'Madhawa', 'Sanjaya', 'madhawa_01@gmail.com', '2001-11-20', 'M', 771020651, 'd002', 'Repeat'),
('TG0752', 'Kalani', 'Ruwanika', 'kalani_19@gmail.com', '2001-04-02', 'F', 768899267, 'd002', 'Repeat'),
('TG0639', 'Jayani', 'Mihirani', 'jayani_mihi@gmail.com', '2001-10-02', 'F', 779201276, 'd002', 'Repeat');
