-- Table: Offering

CREATE TABLE offering (offerno INTEGER NOT NULL,
    courseno char (6) NOT NULL,
    offterm char (6) NOT NULL,
    offyear INTEGER NOT NULL,
    offlocation varchar (30),
    offtime varchar (10),
    facssn char (11),
    offdays char (4),
    CONSTRAINT offeringpk PRIMARY KEY (offerno));


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (1111, 'IS320', 'SUMMER', 2008, 'BLM302', '10:30:00', NULL, 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (1234, 'IS320', 'FALL', 2007, 'BLM302', '10:30:00', '98765432', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (2222, 'IS460', 'SUMMER', 2007, 'BLM412', '13:30:00', NULL, 'TTH');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (3333, 'IS320', 'SPRING', 2008, 'BLM214', '08:30:00', '98765432', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (4321, 'IS320', 'FALL', 2007, 'BLM214', '15:30:00', '98765432', 'TTH');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (4444, 'IS320', 'WINTER', 2008, 'BLM302', '15:30:00', '543210987', 'TTH');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (5555, 'FIN300', 'WINTER', 2008, 'BLM207', '08:30:00', '765432109', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (5678, 'IS480', 'WINTER', 2008, 'BLM302', '10:30:00', '987654321', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (5679, 'IS480', 'SPRING', 2008, 'BLM412', '15:30:00', '876543210', 'TTH');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (6666, 'FIN450', 'WINTER', 2008, 'BLM212', '10:30:00', '987654321', 'TTH');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (7777, 'FIN480', 'SPRING', 2008, 'BLM305', '13:30:00', '765432109', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (8888, 'IS320', 'SUMMER', 2008, 'BLM405', '13:30:00', '654321098', 'MW');


INSERT INTO offering (offerno, courseno, offterm, offyear, offlocation, offtime, facssn, offdays)
VALUES (9876, 'IS460', 'SPRING', 2008, 'BLM307', '13:30:00', '654321098', 'TTH');

-- Table: Student

CREATE TABLE student (stdssn char (11) NOT NULL,
    stdfirstname varchar (30) NOT NULL,
    stdlastname varchar (30) NOT NULL,
    stdcity varchar (30) NOT NULL,
    stdstate char (2) NOT NULL,
    stdzip char (10) NOT NULL,
    stdmajor char (6),
    stdclass char (2),
    stdgpa decimal (3, 2),
    CONSTRAINT studentpk PRIMARY KEY (stdssn));


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('123456789', 'HOMER', 'WELLS', 'SEATTLE', 'WA', '981211111', 'IS', 'FR', 3);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('124567890', 'BOB', 'NORBERT', 'BOTHELL', 'WA', '980112121', 'FIN', 'JR', 2.7);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('234567890', 'CANDY', 'KENDALL', 'TACOMA', 'WA', '990423321', 'ACCT', 'JR', 3.5);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('345678901', 'WALLY', 'KENDALL', 'SEATTLE', 'WA', '981231141', 'IS', 'SR', 2.8);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('456789012', 'JOE', 'ESTRADA', 'SEATTLE', 'WA', '981212333', 'FIN', 'SR', 3.2);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('567890123', 'MARIAH', 'DODGE', 'SEATTLE', 'WA', '981140021', 'IS', 'JR', 3.6);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('678901234', 'TESS', 'DODGE', 'REDMOND', 'WA', '981162344', 'ACCT', 'SO', 3.3);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('789012345', 'ROBERTO', 'MORALES', 'SEATTLE', 'WA', '981212212', 'FIN', 'JR', 2.5);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', '981141332', 'IS', 'SR', 4);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('890123456', 'LUKE', 'BRAZZI', 'SEATTLE', 'WA', '981160021', 'IS', 'SR', 2.2);


INSERT INTO student (stdssn, stdfirstname, stdlastname, stdcity, stdstate, stdzip, stdmajor, stdclass, stdgpa)
VALUES ('901234567', 'WILLIAM', 'PILGRIM', 'BOTHELL', 'WA', '981131885', 'IS', 'SO', 3.8);

-- Table: Faculty

CREATE TABLE faculty (facssn CHAR (11) NOT NULL,
    facfirstname varchar (30) NOT NULL,
    faclastname varchar (30) NOT NULL,
    faccity varchar (30) NOT NULL,
    facstate CHAR (2) NOT NULL,
    faczipcode CHAR (10) NOT NULL,
    facrank CHAR (4),
    fachiredate DATE, facsalary DECIMAL (10, 2),
    facsupervisor CHAR (11),
    facdept VARCHAR (3) NOT NULL,
    CONSTRAINT facultypk PRIMARY KEY (facssn));

INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('98765432', 'LEONARD', 'VINCE', 'SEATTLE', 'WA', '981119921', 'ASST', '1997-04-10', 35000, '654321098', 'MS');


INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('543210987', 'VICTORIA', 'EMMANUEL', 'BOTHELL', 'WA', '980112242', 'PROF', '1998-04-15', 120000, NULL, 'MS');


INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('654321098', 'LEONARD', 'FIBON', 'SEATTLE', 'WA', '981210094', 'ASSC', '1996-05-01', 70000, '543210987', 'MS');


INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('765432109', 'NICKI', 'MACON', 'BELLEVUE', 'WA', '980159945', 'PROF', '1999-04-11', 65000, NULL, 'FIN');


INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', '981141332', 'ASST', '2001-03-01', 40000, '654321098', 'MS');


INSERT INTO faculty (facssn, facfirstname, faclastname, faccity, facstate, faczipcode, facrank, fachiredate, facsalary, facsupervisor, facdept)
VALUES ('987654321', 'JULIA', 'MILLS', 'SEATTLE', 'WA', '981149954', 'ASSC', '2002-03-15', 75000, '765432109', 'FIN');

-- Table: Course

CREATE TABLE course(courseno char(6) NOT NULL,
    crsdesc varchar(50) NOT NULL,
    crsunits integer, CONSTRAINT coursepk PRIMARY KEY (courseno));


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('FIN300', 'FUNDAMENTALS OF FINANCE', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('FIN450', 'PRINCIPLES OF INVESTMENTS', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('FIN480', 'CORPORATE FINANCE', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('IS320', 'FUNDAMENTALS OF BUSINESS PROGRAMMING', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('IS460', 'SYSTEMS ANALYSIS', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('IS470', 'BUSINESS DATA COMMUNICATIONS', 4);


INSERT INTO course (courseno, crsdesc, crsunits)
VALUES ('IS480', 'FUNDAMENTALS OF DATABASE MANAGEMENT', 4);

-- Table: Enrollment

CREATE TABLE enrollment (offerno INTEGER NOT NULL,
    stdssn CHAR (11) NOT NULL,
    enrgrade DECIMAL (3, 2),
    CONSTRAINT enrollmentpk2 PRIMARY KEY (offerno, stdssn));


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '123456789', 3.3);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '234567890', 3.5);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '345678901', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '456789012', 3.1);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '567890123', 3.8);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (1234, '678901234', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '123456789', 3.5);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '124567890', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '789012345', 3.5);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '876543210', 3.1);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '890123456', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (4321, '901234567', 3.1);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5555, '123456789', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5555, '124567890', 2.7);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5678, '123456789', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5678, '234567890', 2.8);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5678, '345678901', 3.3);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5678, '456789012', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5678, '567890123', 2.6);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '123456789', 2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '124567890', 3.7);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '678901234', 3.3);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '789012345', 3.8);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '890123456', 2.9);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (5679, '901234567', 3.1);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (6666, '234567890', 3.1);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (6666, '567890123', 3.6);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (7777, '876543210', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (7777, '890123456', 3.7);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (7777, '901234567', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '124567890', 3.5);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '234567890', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '345678901', 3.2);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '456789012', 3.4);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '567890123', 2.6);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '678901234', 3.3);


INSERT INTO enrollment (offerno, stdssn, enrgrade)
VALUES (9876, '901234567', 4);


CREATE TABLE club (clubno varchar(12) PRIMARY KEY,
    cname varchar(100) DEFAULT NULL,
    cpurpose varchar(20) DEFAULT NULL,
    cbudget decimal(19, 4) DEFAULT 0.0000,
    cactual decimal(19, 4) DEFAULT 0.0000);


INSERT INTO club (clubno, cname, cpurpose, cbudget, cactual)
VALUES ('C1', 'DELTA', 'SOCIAL', NULL, 1200.0000);


INSERT INTO club (clubno, cname, cpurpose, cbudget, cactual)
VALUES ('C2', 'BITS', 'ACADEMIC', 500.0000, 350.0000);


INSERT INTO club (clubno, cname, cpurpose, cbudget, cactual)
VALUES ('C3', 'HELPS', 'SERVICE', 300.0000, 300.0000);


INSERT INTO club (clubno, cname, cpurpose, cbudget, cactual)
VALUES ('C4', 'SIGMA', 'SOCIAL', 600.0000, 750.0000);


CREATE TABLE stdclub (stdssn CHAR (11) NOT NULL,
clubno varchar(12) NOT NULL,
PRIMARY key(stdssn, clubno));


INSERT INTO stdclub
VALUES('124567890', 'C1');


INSERT INTO stdclub
VALUES('124567890', 'C2');


INSERT INTO stdclub
VALUES('456789012', 'C1');