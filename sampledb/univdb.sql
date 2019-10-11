

-- Table: Offering
CREATE TABLE Offering (OfferNo INTEGER NOT NULL, CourseNo char (6) NOT NULL, OffTerm char (6) NOT NULL, OffYear INTEGER NOT NULL, OffLocation varchar (30), OffTime varchar (10), FacSSN char (11), OffDays char (4), CONSTRAINT OfferingPK PRIMARY KEY (OfferNo));
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (1111, 'IS320', 'SUMMER', 2008, 'BLM302', '10:30:00', '', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (1234, 'IS320', 'FALL', 2007, 'BLM302', '10:30:00', '98765432', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (2222, 'IS460', 'SUMMER', 2007, 'BLM412', '13:30:00', '', 'TTH');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (3333, 'IS320', 'SPRING', 2008, 'BLM214', '08:30:00', '98765432', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (4321, 'IS320', 'FALL', 2007, 'BLM214', '15:30:00', '98765432', 'TTH');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (4444, 'IS320', 'WINTER', 2008, 'BLM302', '15:30:00', '543210987', 'TTH');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (5555, 'FIN300', 'WINTER', 2008, 'BLM207', '08:30:00', '765432109', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (5678, 'IS480', 'WINTER', 2008, 'BLM302', '10:30:00', '987654321', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (5679, 'IS480', 'SPRING', 2008, 'BLM412', '15:30:00', '876543210', 'TTH');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (6666, 'FIN450', 'WINTER', 2008, 'BLM212', '10:30:00', '987654321', 'TTH');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (7777, 'FIN480', 'SPRING', 2008, 'BLM305', '13:30:00', '765432109', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (8888, 'IS320', 'SUMMER', 2008, 'BLM405', '13:30:00', '654321098', 'MW');
INSERT INTO Offering (OfferNo, CourseNo, OffTerm, OffYear, OffLocation, OffTime, FacSSN, OffDays) VALUES (9876, 'IS460', 'SPRING', 2008, 'BLM307', '13:30:00', '654321098', 'TTH');

-- Table: Student
CREATE TABLE Student (StdSSN char (11) NOT NULL, stdFirstName varchar (30) NOT NULL, stdLastName varchar (30) NOT NULL, stdCity varchar (30) NOT NULL, stdState char (2) NOT NULL, stdZip char (10) NOT NULL, stdMajor char (6), stdClass char (2), stdGPA decimal (3, 2), CONSTRAINT StudentPk PRIMARY KEY (StdSSN));
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('123456789', 'HOMER', 'WELLS', 'SEATTLE', 'WA', '981211111', 'IS', 'FR', 3);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('124567890', 'BOB', 'NORBERT', 'BOTHELL', 'WA', '980112121', 'FIN', 'JR', 2.7);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('234567890', 'CANDY', 'KENDALL', 'TACOMA', 'WA', '990423321', 'ACCT', 'JR', 3.5);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('345678901', 'WALLY', 'KENDALL', 'SEATTLE', 'WA', '981231141', 'IS', 'SR', 2.8);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('456789012', 'JOE', 'ESTRADA', 'SEATTLE', 'WA', '981212333', 'FIN', 'SR', 3.2);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('567890123', 'MARIAH', 'DODGE', 'SEATTLE', 'WA', '981140021', 'IS', 'JR', 3.6);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('678901234', 'TESS', 'DODGE', 'REDMOND', 'WA', '981162344', 'ACCT', 'SO', 3.3);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('789012345', 'ROBERTO', 'MORALES', 'SEATTLE', 'WA', '981212212', 'FIN', 'JR', 2.5);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', '981141332', 'IS', 'SR', 4);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('890123456', 'LUKE', 'BRAZZI', 'SEATTLE', 'WA', '981160021', 'IS', 'SR', 2.2);
INSERT INTO Student (StdSSN, stdFirstName, stdLastName, stdCity, stdState, stdZip, stdMajor, stdClass, stdGPA) VALUES ('901234567', 'WILLIAM', 'PILGRIM', 'BOTHELL', 'WA', '981131885', 'IS', 'SO', 3.8);

-- Table: Faculty
CREATE TABLE Faculty (FacSSN CHAR (11) NOT NULL, FacFirstName varchar (30) NOT NULL, FacLastName varchar (30) NOT NULL, FacCity varchar (30) NOT NULL, FacState CHAR (2) NOT NULL, FacZipCode CHAR (10) NOT NULL, FacRank CHAR (4), FacHireDate DATE, FacSalary DECIMAL (10, 2), FacSupervisor CHAR (11), FacDept VARCHAR (3) NOT NULL, CONSTRAINT FacultyPK PRIMARY KEY (FacSSN));
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('98765432', 'LEONARD', 'VINCE', 'SEATTLE', 'WA', '981119921', 'ASST', '1997-04-10', 35000, '654321098', 'MS');
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('543210987', 'VICTORIA', 'EMMANUEL', 'BOTHELL', 'WA', '980112242', 'PROF', '1998-04-15', 120000, '', 'MS');
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('654321098', 'LEONARD', 'FIBON', 'SEATTLE', 'WA', '981210094', 'ASSC', '1996-05-01', 70000, '543210987', 'MS');
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('765432109', 'NICKI', 'MACON', 'BELLEVUE', 'WA', '980159945', 'PROF', '1999-04-11', 65000, '', 'FIN');
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', '981141332', 'ASST', '2001-03-01', 40000, '654321098', 'MS');
INSERT INTO Faculty (FacSSN, FacFirstName, FacLastName, FacCity, FacState, FacZipCode, FacRank, FacHireDate, FacSalary, FacSupervisor, FacDept) VALUES ('987654321', 'JULIA', 'MILLS', 'SEATTLE', 'WA', '981149954', 'ASSC', '2002-03-15', 75000, '765432109', 'FIN');

-- Table: Course
CREATE TABLE Course(
CourseNo char(6) not null,
crsDesc varchar(50) not null,
CrsUnits integer,
CONSTRAINT CoursePK PRIMARY KEY (CourseNo) );
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('FIN300', 'FUNDAMENTALS OF FINANCE', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('FIN450', 'PRINCIPLES OF INVESTMENTS', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('FIN480', 'CORPORATE FINANCE', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('IS320', 'FUNDAMENTALS OF BUSINESS PROGRAMMING', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('IS460', 'SYSTEMS ANALYSIS', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('IS470', 'BUSINESS DATA COMMUNICATIONS', 4);
INSERT INTO Course (CourseNo, crsDesc, CrsUnits) VALUES ('IS480', 'FUNDAMENTALS OF DATABASE MANAGEMENT', 4);

-- Table: Enrollment
CREATE TABLE Enrollment (
    OfferNo  INTEGER        NOT NULL,
    StdSSN   CHAR (11)      NOT NULL,
    EnrGrade DECIMAL (3, 2),
    CONSTRAINT EnrollmentPK2 PRIMARY KEY (
        OfferNo,
        StdSSN
    )
);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '123456789', 3.3);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '234567890', 3.5);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '345678901', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '456789012', 3.1);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '567890123', 3.8);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (1234, '678901234', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '123456789', 3.5);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '124567890', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '789012345', 3.5);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '876543210', 3.1);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '890123456', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (4321, '901234567', 3.1);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5555, '123456789', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5555, '124567890', 2.7);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5678, '123456789', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5678, '234567890', 2.8);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5678, '345678901', 3.3);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5678, '456789012', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5678, '567890123', 2.6);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '123456789', 2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '124567890', 3.7);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '678901234', 3.3);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '789012345', 3.8);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '890123456', 2.9);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (5679, '901234567', 3.1);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (6666, '234567890', 3.1);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (6666, '567890123', 3.6);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (7777, '876543210', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (7777, '890123456', 3.7);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (7777, '901234567', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '124567890', 3.5);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '234567890', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '345678901', 3.2);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '456789012', 3.4);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '567890123', 2.6);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '678901234', 3.3);
INSERT INTO Enrollment (OfferNo, StdSSN, EnrGrade) VALUES (9876, '901234567', 4);

CREATE TABLE CLUB
(
   CLUBNO    VARCHAR(12)     PRIMARY KEY,
   CNAME     VARCHAR(100)    DEFAULT NULL,
   CPURPOSE  VARCHAR(20)     DEFAULT NULL,
   CBUDGET   DECIMAL(19,4)   DEFAULT 0.0000,
   CACTUAL   DECIMAL(19,4)   DEFAULT 0.0000
);

INSERT INTO CLUB
(
  CLUBNO,
  CNAME,
  CPURPOSE,
  CBUDGET,
  CACTUAL
)
VALUES
(
  'C1',
  'DELTA',
  'SOCIAL',
  NULL,
  1200.0000
);

INSERT INTO CLUB
(
  CLUBNO,
  CNAME,
  CPURPOSE,
  CBUDGET,
  CACTUAL
)
VALUES
(
  'C2',
  'BITS',
  'ACADEMIC',
  500.0000,
  350.0000
);

INSERT INTO CLUB
(
  CLUBNO,
  CNAME,
  CPURPOSE,
  CBUDGET,
  CACTUAL
)
VALUES
(
  'C3',
  'HELPS',
  'SERVICE',
  300.0000,
  300.0000
);

INSERT INTO CLUB
(
  CLUBNO,
  CNAME,
  CPURPOSE,
  CBUDGET,
  CACTUAL
)
VALUES
(
  'C4',
  'SIGMA',
  'SOCIAL',
  600.0000,
  750.0000
);


CREATE TABLE StdClub (
  StdSSN   CHAR (11)      NOT NULL,
  ClubNo    VARCHAR(12) NOT NULL,
  PRIMARY KEY(StdSSN, ClubNo)  
);

INSERT INTO StdClub VALUES('124567890', 'C1');
INSERT INTO StdClub VALUES('124567890', 'C2');
INSERT INTO StdClub VALUES('456789012', 'C1');
