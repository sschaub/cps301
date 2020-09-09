CREATE TABLE customer (custno char(8) NOT NULL PRIMARY KEY,
custfirstname varchar(20) NOT NULL,
custlastname varchar(30) NOT NULL,
custstreet varchar(50),
custcity varchar(30),
custstate char(2),
custzip char(10),
custbal decimal(12, 2) DEFAULT 0);


CREATE TABLE employee (empno char(8) NOT NULL PRIMARY KEY,
empfirstname varchar(20) NOT NULL,
emplastname varchar(30) NOT NULL,
empphone char(15),
empemail varchar(50) NOT NULL,
supempno char(8),
empcommrate decimal(3, 3));


CREATE TABLE product (prodno char(8) NOT NULL PRIMARY KEY,
prodname varchar(50) NOT NULL,
prodmfg varchar(20) NOT NULL,
prodqoh INTEGER, prodprice decimal(12, 2),
prodnextshipdate DATE);


CREATE TABLE ordertbl (ordno char(8) NOT NULL PRIMARY KEY,
orddate DATE NOT NULL,
custno char(8) NOT NULL,
empno char(8),
ordname varchar(50),
ordstreet varchar(50),
ordcity varchar(30),
ordstate char(2),
ordzip char(10));


CREATE TABLE ordline (ordno char(8) NOT NULL,
prodno char(8) NOT NULL,
qty INTEGER DEFAULT 1,
PRIMARY KEY (ordno, prodno));


INSERT INTO customer
VALUES ('C0954327','Sheri','Gordon','336 Hill St.','Littleton','CO','80129-5543',230.00),
       ('C1010398','Jim','Glussman','1432 E. Ravenna','Denver','CO','80111-0033',200.00),
       ('C2388597','Beth','Taylor','2396 Rafter Rd','Seattle','WA','98103-1121',500.00),
       ('C3340959','Betty','Wise','4334 153rd NW','Seattle','WA','98178-3311',200.00),
       ('C3499503','Bob','Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095',0.00),
       ('C8543321','Ron','Thompson','789 122nd St.','Renton','WA','98666-1289',85.00),
       ('C8574932','Wally','Jones','411 Webber Ave.','Seattle','WA','98105-1093',1500.00),
       ('C8654390','Candy','Kendall','456 Pine St.','Seattle','WA','98105-3345',50.00),
       ('C9128574','Jerry','Wyatt','16212 123rd Ct.','Denver','CO','80222-0022',100.00),
       ('C9403348','Mike','Boren','642 Crest Ave.','Englewood','CO','80113-5431',0.00),
       ('C9432910','Larry','Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211',250.00),
       ('C9543029','Sharon','Johnson','1223 Meyer Way','Fife','WA','98222-1123',856.00),
       ('C9549302','Todd','Hayes','1400 NW 88th','Lynnwood','WA','98036-2244',0.00),
       ('C9857432','Homer','Wells','123 Main St.','Seattle','WA','98105-4322',500.00),
       ('C9865874','Mary','Hill','206 McCaffrey','Littleton','CO','80129-5543',150.00),
       ('C9943201','Harry','Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258',1000.00);


INSERT INTO employee (empno, empfirstname, emplastname, empphone, empemail, supempno, empcommrate)
VALUES ('E9884325','Thomas','Johnson','(303) 556-9987 ','TJohnson@bigco.com',NULL,0.050),
       ('E8843211','Amy','Tang','(303) 556-4321 ','ATang@bigco.com','E9884325',0.040),
       ('E9345771','Colin','White','(303) 221-4453 ','CWhite@bigco.com','E9884325',0.040),
       ('E1329594','Landi','Santos','(303) 789-1234 ','LSantos@bigco.com','E8843211',0.020),
       ('E8544399','Joe','Jenkins','(303) 221-9875 ','JJenkins@bigco.com','E8843211',0.020),
       ('E9954302','Mary','Hill','(303) 556-9871 ','MHill@bigco.com','E8843211',0.020),
       ('E9973110','Theresa','Beck','(720) 320-2234 ','TBeck@bigco.com','E9884325',NULL);


INSERT INTO ordertbl (ordno, orddate, custno, empno, ordname, ordstreet, ordcity, ordstate, ordzip)
VALUES ('O1116324','2015-01-23','C0954327','E8544399','Sheri Gordon','336 Hill St.','Littleton','CO','80129-5543'),
       ('O1231231','2015-01-23','C9432910','E9954302','Larry Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211'),
       ('O1241518','2015-02-10','C9549302',NULL,'Todd Hayes','1400 Main St.','Lynnwood','WA','98036-2244'),
       ('O1455122','2015-01-09','C8574932','E9345771','Wally Jones','411 Webber Ave.','Seattle','WA','98105-1093'),
       ('O1579999','2015-01-05','C9543029','E8544399','Tom Johnson','1632 Ocean Dr.','Des Moines','WA','98222-1123'),
       ('O1615141','2015-01-23','C8654390','E8544399','Candy Kendall','456 Pine St.','Seattle','WA','98105-3345'),
       ('O1656777','2015-02-11','C8543321',NULL,'Ron Thompson','789 122nd St.','Renton','WA','98666-1289'),
       ('O2233457','2015-01-12','C2388597','E9884325','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121'),
       ('O2334661','2015-01-14','C0954327','E1329594','Mrs. Ruth Gordon','233 S. 166th','Seattle','WA','98011     '),
       ('O3252629','2015-01-23','C9403348','E9954302','Mike Boren','642 Crest Ave.','Englewood','CO','80113-5431'),
       ('O3331222','2015-01-13','C1010398',NULL,'Jim Glussman','1432 E. Ravenna','Denver','CO','80111-0033'),
       ('O3377543','2015-01-15','C9128574','E8843211','Jerry Wyatt','16212 123rd Ct.','Denver','CO','80222-0022'),
       ('O4714645','2015-01-11','C2388597','E1329594','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121'),
       ('O5511365','2015-01-22','C3340959','E9884325','Betty White','4334 153rd NW','Seattle','WA','98178-3311'),
       ('O6565656','2015-01-20','C9865874','E8843211','Mr. Jack Sibley','166 E. 344th','Renton','WA','98006-5543'),
       ('O7847172','2015-01-23','C9943201',NULL,'Harry Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258'),
       ('O7959898','2015-02-19','C8543321','E8544399','Ron Thompson','789 122nd St.','Renton','WA','98666-1289'),
       ('O7989497','2015-01-16','C3499503','E9345771','Bob Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095'),
       ('O8979495','2015-01-23','C9865874',NULL,'HelenSibley','206 McCaffrey','Renton','WA','98006-5543'),
       ('O9919699','2015-02-11','C9857432','E9954302','Homer Wells','123 Main St.','Seattle','WA','98105-4322'),
       ('O9929699','2014-02-11','C9857432','E9954302','Homer Wells','123 Main St.','Seattle','WA','98105-4322'),
       ('O9939699','2016-02-11','C9857432','E9954302','Fred Baker','123 Main St.','Seattle','WA','98105-4322');


INSERT INTO product (prodno, prodname, prodmfg, prodqoh, prodprice, prodnextshipdate)
VALUES ('P0036566','17 inch Color Monitor','ColorMeg, Inc.',12,169.00,'2015-02-20'),
       ('P0036577','19 inch Color Monitor','ColorMeg, Inc.',10,319.00,'2015-02-20'),
       ('P1114590','R3000 Color Laser Printer','Connex',5,699.00,'2015-01-22'),
       ('P1412138','10 Foot Printer Cable','Ethlite',100,12.00,NULL),
       ('P1445671','8-Outlet Surge Protector','Intersafe',33,14.99,NULL),
       ('P1556678','CVP Ink Jet Color Printer','Connex',8,99.00,'2015-01-22'),
       ('P3455443','Color Ink Jet Cartridge','Connex',24,38.00,'2015-01-22'),
       ('P4200344','36-Bit Color Scanner','UV Components',16,199.99,'2015-01-29'),
       ('P6677900','Black Ink Jet Cartridge','Connex',44,25.69,NULL),
       ('P9995676','Battery Back-up System','Cybercx',12,89.00,'2015-02-01');


INSERT INTO ordline (ordno, prodno, qty)
VALUES ('O9919699','P4200344',1),
       ('O1116324','P1445671',1),
       ('O1231231','P0036566',1),
       ('O1231231','P1445671',1),
       ('O1241518','P0036577',1),
       ('O1455122','P4200344',1),
       ('O1579999','P1556678',1),
       ('O1579999','P6677900',1),
       ('O1579999','P9995676',1),
       ('O1615141','P0036566',1),
       ('O1615141','P1445671',1),
       ('O1615141','P4200344',1),
       ('O1656777','P1445671',1),
       ('O1656777','P1556678',1),
       ('O2233457','P0036577',1),
       ('O2233457','P1445671',1),
       ('O2334661','P0036566',1),
       ('O2334661','P1412138',1),
       ('O2334661','P1556678',1),
       ('O3252629','P4200344',1),
       ('O3252629','P9995676',1),
       ('O3331222','P1412138',1),
       ('O3331222','P1556678',1),
       ('O3331222','P3455443',1),
       ('O3377543','P1445671',1),
       ('O3377543','P9995676',1),
       ('O4714645','P0036566',1),
       ('O4714645','P9995676',1),
       ('O5511365','P1412138',1),
       ('O5511365','P1445671',1),
       ('O5511365','P1556678',1),
       ('O5511365','P3455443',1),
       ('O5511365','P6677900',1),
       ('O6565656','P0036566',10),
       ('O7847172','P1556678',1),
       ('O7847172','P6677900',1),
       ('O7959898','P1412138',5),
       ('O7959898','P1556678',5),
       ('O7959898','P3455443',5),
       ('O7959898','P6677900',5),
       ('O7989497','P1114590',2),
       ('O7989497','P1412138',2),
       ('O7989497','P1445671',3),
       ('O8979495','P1114590',1),
       ('O8979495','P1412138',1),
       ('O8979495','P1445671',1),
       ('O9919699','P0036577',1),
       ('O9919699','P1114590',1),
       ('O9929699','P0036577',1),
       ('O9939699','P1114590',1);

