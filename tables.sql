
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