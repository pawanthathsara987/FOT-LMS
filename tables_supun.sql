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

