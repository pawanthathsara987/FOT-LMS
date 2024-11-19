CREATE TABLE lecturer(
    lec_id CHAR(5) PRIMARY KEY,
    dep_id CHAR(4),
    cour_code CHAR(10),
    lec_fname VARCHAR(20),
    lec_lname VARCHAR(20),
    lec_email VARCHAR(50),
    gender ENUM ('M','F'),
    lec_dob DATE,
    lec_mobile INT(10),
    FOREIGN KEY (dep_id) REFERENCES department(dep_id),
    FOREIGN KEY (cour_code) REFERENCES course(cour_code)
);

ALTER TABLE lecturer
MODIFY lec_mobile CHAR(15);

CREATE TABLE tec_officer(
    tec_officer_id CHAR(5) PRIMARY KEY,
    dep_id CHAR(4),
    tec_officer_fname VARCHAR(20),
    tec_officer_lname VARCHAR(20),
    tec_officer_email VARCHAR(50),
    gender ENUM ('M','F'),
    tec_officer_dob DATE,
    tec_officer_mobile INT(10),
    FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);

ALTER TABLE tec_officer
MODIFY tec_officer_mobile CHAR(15);


/*Table data*/

INSERT INTO lecturer
VALUES
    ("L001","d004","TCS1212",'Chathuranga','Adhikari',"adikarichathuranga@gmail.com",'M',"1998-10-19","0741626677"),
    ("L002","d004","TMS1223",'Dilshani','Rasangika',"rasangi222@gmail.com",'F',"1990-05-12","0766816275"),
    ("L003","d004","TMS1213",'Sanjeewani','Thilakarathna',"sthilakarathna@gmail.com",'F',"1976-05-18","0776308378"),
    ("L004","d004","TMS1233",'Harsha','Kumara',"harshakuma@gmail.com",'M',"1978-10-04","0765760224"),

    ("L005","d001","ENT1221",'Milhan','Ajward',"Ajwardmilhan356@gmail.com",'M',"1968-11-12","0763955423"),
    ("L006","d001","ENT1211",'Harshana','Laknath',"harshana443@gamil.com",'M',"1975-01-07","0751607777"),
    ("L007","d001","ENT1231",'Hashini','Vitharana',"vitharana4550@gmail.com",'F',"1996-12-30","0741235544"),
    ("L008","d001","ENT1253",'Piyumi','Vitharana',"piyuvitharana@gmail.com",'F',"1988-04-22","0765662902"),
    ("L009","d001","ENT1242",'Ajith','Kumara',"ajithkumara@gmail.com",'M',"1990-07-18","0745601232"),

    ("L010","d003","BST1212",'Kawindu','Rathnayaka',"Rathnayaka777@gmail.com",'M',"1969-09-14","0783955615"),
    ("L011","d003","BST1272",'Sumudu','Rathnayaka',"sumudurarhnayaka@gmail.com",'F',"1992-07-18","0782245453"),
    ("L012","d003","BST1222",'Kalpani','Hashara',"hashara334@gmail.com",'F',"1998-12-29","0714561512"),
    ("L013","d003","BST1232",'Sandun','Rathnayaka',"sandunrathnayaka11@gamail.com",'M',"1996-07-04","0912291824"),
    ("L014","d003","BST1242",'Navodya','Senarathna',"navosenarathna@gmail.com",'F',"1997-04-13","0741604488"),
    ("L015","d003","BST1251",'Akila','Senanayaka',"senanayaka22@gmail.com",'M',"1989-09-23","0712364582"),
    ("L016","d003","BST1262",'Thisara','Gajanayaka',"gajanayaka@gmail.com",'M',"1999-11-22","0714568522"),
    ("L017","d003","BST1282",'Nadun','Guruge',"gurugenadun@gmail.com",'M',"1977-04-17","0784251558"),

    ("L018","d002","ICT1212",'Nuwan','Laksiri',"Nuwanlaksiri@gmail.com",'M',"1988-07-14","0763521122"),
    ("L019","d002","ICT1222",'Lakeesha','Suranga',"suranga@gmail.com",'M',"1987-06-13","0784582377"),
    ("L020","d002","ICT1233",'Rumashika','Sewwandi',"rumeshika@gmail.com",'F',"1993-08-10","0762291922"),
    ("L021","d002","ICT1242",'Shashitha','Lakal',"shashitha55@gmail.com",'M',"1990-02-18","0745602104"),
    ("L022","d002","ICT1253",'Chanduni','Gamage',"chandunigamage@gmail.com",'F',"1991-03-19","0745612355");

    INSERT INTO lecturer
    VALUES 
        ("L023","d004","ENG1212",'Naveen','Walimuni',"naveenwalimuni@gmail.com",'M',"1990-07-15","0763423456");


    INSERT INTO tec_officer
    VALUES
 
	("TO01","d001","Sajith","Kumara","sajithkumara@gmail.com","M","1997-02-16","0741657777"),
	("TO02","d001","Kasun","Pradeep","kasunpradeep@gmail.com","M","1996-05-26","0774581284"),
	("TO03","d002","Dinuka","Lakshan","dinukalakshan@gmail.com","M","1992-01-11","0762234582"),
	("TO04","d002","Amila","Ruwan","amilaruwan@gmail.com","M","1994-08-19","0714585622"),
	("TO05","d003","Chathura","Madushan","chathuramadushan@gmail.com","M","1988-02-07","0741607774"),
	("TO06","d004","Rishini","Sathsara","rishinisathsara@gmail.com","F","1999-08-20","0763955615");


    CREATE USER 'admin'@'localhost'  IDENTIFIED BY 'admin1234';
    GRANT ALL PRIVILEGES ON fot_lms.* TO  'admin'@'localhost';
    FLUSH PRIVILEGES;

    SHOW GRANTS FOR 'admin'@'localhost';


    CREATE USER 'dean'@'localhost' IDENTIFIED BY 'dean1234';
    GRANT ALL PRIVILEGES ON fot_lms.* TO 'dean'@'localhost';
    FLUSH PRIVILEGES;

    SHOW GRANTS FOR 'dean'@'localhost';

    CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecture1234';
    GRANT ALL PRIVILEGES ON fot_lms.* TO 'lecturer'@'localhost';
    REVOKE CREATE USER ON . FROM 'lecturer'@'localhost';
    FLUSH PRIVILEGES;

    SHOW GRANTS FOR 'lecture'@'localhost';


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