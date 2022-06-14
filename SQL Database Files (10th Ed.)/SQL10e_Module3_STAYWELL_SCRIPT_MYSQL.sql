USE MODULE_3_CASE_STUDY;
# MySQL STAYWELL SCHEMA

# Create OWNER table
DROP TABLE IF EXISTS OWNER;
CREATE TABLE OWNER (
    OWNER_NUM CHAR(5) PRIMARY KEY NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);

# Insert owners
INSERT INTO OWNER VALUES('MO100','Moore','Elle-May','8006 W. Newport Ave.','Reno','NV','89508');
INSERT INTO OWNER VALUES('PA101','Patel','Makesh','7337 Sheffield St.','Seattle','WA','98119');
INSERT INTO OWNER VALUES('AK102','Aksoy','Ceyda','411 Griffin Rd.','Seattle','WA','98131');
INSERT INTO OWNER VALUES('CO103','Cole','Meerab','9486 Circle Ave.','Olympia','WA','98506');
INSERT INTO OWNER VALUES('KO104','Kowalczyk','Jakub','7431 S. Bishop St.','Bellingham','WA','98226');
INSERT INTO OWNER VALUES('SI105','Sims','Haydon','527 Primrose Rd.','Portland','OR','97203');
INSERT INTO OWNER VALUES('BU106','Burke','Ernest','613 Old Pleasant St.','Twin Falls','ID','83303');
INSERT INTO OWNER VALUES('RE107','Redman','Seth','7681 Fordham St.','Seattle','WA','98119');
INSERT INTO OWNER VALUES('LO108','Lopez','Janine','9856 Pumpkin Hill Ln.','Everett','WA','98213');
INSERT INTO OWNER VALUES('BI109','Bianchi','Nicole','7990 Willow Dr.','New York','NY','10005');
INSERT INTO OWNER VALUES('JO110','Jones','Ammarah','730 Military Ave.','Seattle','WA','98126');


# Create PROPERTY table  
DROP TABLE IF EXISTS PROPERTY;    
CREATE TABLE PROPERTY (
    PROPERTY_ID SMALLINT PRIMARY KEY NOT NULL,
    OFFICE_NUM TINYINT NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    SQR_FT SMALLINT NOT NULL,
    BDRMS TINYINT NOT NULL,
    FLOORS TINYINT NOT NULL,
    MONTHLY_RENT SMALLINT,
    OWNER_NUM CHAR(5) NOT NULL
);

# Insert properties 
INSERT INTO PROPERTY VALUES('1','1','30 West Thomas Rd.','1600','3','1',1400,'BU106');
INSERT INTO PROPERTY VALUES('2','1','782 Queen Ln.','2100','4','2',1900,'AK102');
INSERT INTO PROPERTY VALUES('3','1','9800 Sunbeam Ave.','1005','2','1',1200,'BI109');
INSERT INTO PROPERTY VALUES('4','1','105 North Illinois Rd.','1750','3','1',1650,'KO104');
INSERT INTO PROPERTY VALUES('5','1','887 Vine Rd.','1125','2','1',1160,'SI105');
INSERT INTO PROPERTY VALUES('6','1','8 Laurel Dr.','2125','4','2',2050,'MO100');
INSERT INTO PROPERTY VALUES('7','2','447 Goldfield St.','1675','3','2',1700,'CO103');
INSERT INTO PROPERTY VALUES('8','2','594 Leatherwood Dr.','2700','5','2',2750,'KO104');
INSERT INTO PROPERTY VALUES('9','2','504 Windsor Ave.','700','2','1',1050,'PA101');
INSERT INTO PROPERTY VALUES('10','2','891 Alton Dr.','1300','3','1',1600,'LO108');
INSERT INTO PROPERTY VALUES('11','2','9531 Sherwood Rd.','1075','2','1',1100,'JO110');
INSERT INTO PROPERTY VALUES('12','2','2 Bow Ridge Ave.','1400','3','2',1700,'RE107');


# Create OFFICE table
DROP TABLE IF EXISTS OFFICE;
CREATE TABLE OFFICE (
    OFFICE_NUM TINYINT PRIMARY KEY NOT NULL,
    OFFICE_NAME VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);

# Insert offices 
INSERT INTO OFFICE VALUES('1','StayWell-Colombia City','1135 N. Wells Avenue','Colombia City','Seattle','WA','98118');
INSERT INTO OFFICE VALUES('2','StayWell-Georgetown','986 S. Madison Rd','Georgetown','Seattle','WA','98108');

# Create SERVICE_CATEGORY table 
DROP TABLE IF EXISTS SERVICE_CATEGORY;
CREATE TABLE SERVICE_CATEGORY (
    CATEGORY_NUM TINYINT PRIMARY KEY NOT NULL,
    CATEGORY_DESCRIPTION VARCHAR(100) NOT NULL
);

# Insert service categories
INSERT INTO SERVICE_CATEGORY VALUES('1','Plumbing');
INSERT INTO SERVICE_CATEGORY VALUES('2','Heating');
INSERT INTO SERVICE_CATEGORY VALUES('3','Painting');
INSERT INTO SERVICE_CATEGORY VALUES('4','Electrical Systems');
INSERT INTO SERVICE_CATEGORY VALUES('5','Carpentry');
INSERT INTO SERVICE_CATEGORY VALUES('6','Furniture replacement');

# Create SERVICE_REQUEST table  
DROP TABLE IF EXISTS SERVICE_REQUEST; 
CREATE TABLE SERVICE_REQUEST (
    SERVICE_ID SMALLINT PRIMARY KEY NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL,
    CATEGORY_NUMBER TINYINT NOT NULL,
    OFFICE_ID TINYINT NOT NULL,
    DESCRIPTION VARCHAR(200) NOT NULL,
    STATUS VARCHAR(200) NOT NULL,
    EST_HOURS TINYINT NOT NULL,
    SPENT_HOURS TINYINT NOT NULL,
    NEXT_SERVICE_DATE DATE
);
        
# Insert service requests
INSERT INTO SERVICE_REQUEST VALUES('1','11','2','2','The second bedroom upstairs is not heating up at night.','Problem has been confirmed. central heating engineer has been scheduled. ','2','1','2019-11-01');
INSERT INTO SERVICE_REQUEST VALUES('2','1','4','1','A new strip light is needed for the kitchen.','Scheduled','1','0','2019-10-2');
INSERT INTO SERVICE_REQUEST VALUES('3','6','5','1','The bathroom door does not close properly.','Service rep has confirmed issue. Scheduled to be refitted.','3','1','2019-11-09');
INSERT INTO SERVICE_REQUEST VALUES('4','2','4','1','New outlet has been requested for the first upstairs bedroom. (There is currently no outlet).','Scheduled','1','0','2019-10-02');
INSERT INTO SERVICE_REQUEST VALUES('5','8','3','2','New paint job requested for the common area (lounge). ','Open','10','0',NULL);
INSERT INTO SERVICE_REQUEST VALUES('6','4','1 ','1','Shower is dripping when not in use.','Problem confirmed. Plumber has been scheduled.','4','2','2019-10-07');
INSERT INTO SERVICE_REQUEST VALUES('7','2','2','1','Heating unit in the entrance smells like its burning.','Service rep confirmed the issue to be dust in the heating unit. To be cleaned.  ','1','0','2019-10-09');
INSERT INTO SERVICE_REQUEST VALUES('8','9','1','2','Kitchen sink does not drain properly. ','Problem confirmed. Plumber scheduled.','6','2','2019-11-12');
INSERT INTO SERVICE_REQUEST VALUES('9','12','6','2','New sofa requested.','Open','2','0',NULL);

# Create RESIDENTS  table   
DROP TABLE IF EXISTS RESIDENTS;
CREATE TABLE RESIDENTS (
    RESIDENT_ID SMALLINT PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    SURNAME VARCHAR(20) NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL
);

# Insert residents 
INSERT INTO RESIDENTS VALUES('1','Albie ','ORyan','1');
INSERT INTO RESIDENTS VALUES('2','Tariq ','Khan','1');
INSERT INTO RESIDENTS VALUES('3','Ismail ','Salib','1');
INSERT INTO RESIDENTS VALUES('4','Callen ','Beck','2');
INSERT INTO RESIDENTS VALUES('5','Milosz ','Polansky','2');
INSERT INTO RESIDENTS VALUES('6','Ashanti ','Lucas','2');
INSERT INTO RESIDENTS VALUES('7','Randy ','Woodrue','2');
INSERT INTO RESIDENTS VALUES('8','Aislinn ','Lawrence','3');
INSERT INTO RESIDENTS VALUES('9','Monique ','French','3');
INSERT INTO RESIDENTS VALUES('10','Amara ','Dejsuwan','4');
INSERT INTO RESIDENTS VALUES('12','Rosalie ','Blackmore','4');
INSERT INTO RESIDENTS VALUES('13','Carina ','Britton','4');
INSERT INTO RESIDENTS VALUES('14','Valentino ','Ortega','5');
INSERT INTO RESIDENTS VALUES('15','Kaylem ','Kent','5');
INSERT INTO RESIDENTS VALUES('16','Alessia ','Wagner','6');
INSERT INTO RESIDENTS VALUES('17','Tyrone ','Galvan','6');
INSERT INTO RESIDENTS VALUES('18','Constance ','Fleming','6');
INSERT INTO RESIDENTS VALUES('19','Eamonn ','Bain','6');
INSERT INTO RESIDENTS VALUES('20','Misbah ','Yacob','7');
INSERT INTO RESIDENTS VALUES('21','Gianluca ','Esposito','7');
INSERT INTO RESIDENTS VALUES('22','Elinor ','Lake','7');
INSERT INTO RESIDENTS VALUES('23','Ray ','Rosas','8');
INSERT INTO RESIDENTS VALUES('24','Damon ','Caldwell','8');
INSERT INTO RESIDENTS VALUES('25','Dawood ','Busby','8');
INSERT INTO RESIDENTS VALUES('26','Dora ','Harris','8');
INSERT INTO RESIDENTS VALUES('27','Leroy ','Stokes','8');
INSERT INTO RESIDENTS VALUES('28','Tamia ','Hess','9');
INSERT INTO RESIDENTS VALUES('29','Amelia ','Sanders','9');
INSERT INTO RESIDENTS VALUES('30','Zarah ','Byers','10');
INSERT INTO RESIDENTS VALUES('31','Sara ','Farrow','10');
INSERT INTO RESIDENTS VALUES('32','Delilah ','Roy','10');
INSERT INTO RESIDENTS VALUES('33','Dougie ','McDaniel','11');
INSERT INTO RESIDENTS VALUES('34','Tahir ','Halabi','11');
INSERT INTO RESIDENTS VALUES('35','Mila ','Zhikin','12');
INSERT INTO RESIDENTS VALUES('36','Glenn ','Donovan','12');
INSERT INTO RESIDENTS VALUES('37','Zayn ','Fowler','12');

DESCRIBE OFFICE; 
DESCRIBE OWNER; 
DESCRIBE PROPERTY; 
DESCRIBE SERVICE_CATEGORY; 
DESCRIBE SERVICE_REQUEST; 
DESCRIBE RESIDENTS;

SELECT*
	FROM OFFICE;
SELECT*	
	FROM OWNER;
SELECT*
	FROM PROPERTY;
SELECT*
	FROM SERVICE_CATEGORY;
SELECT*
	FROM SERVICE_REQUEST;
SELECT*
	FROM RESIDENTS;
SELECT OWNER_NUM, LAST_NAME, FIRST_NAME
	FROM OWNER ORDER BY OWNER_NUM; 
SELECT* 
	FROM PROPERTY; 
SELECT LAST_NAME, FIRST_NAME, CITY
	FROM OWNER WHERE CITY = 'Seattle' ORDER BY LAST_NAME; 
SELECT LAST_NAME, FIRST_NAME, CITY
	FROM OWNER WHERE CITY <> 'Seattle' ORDER BY LAST_NAME; 
SELECT PROPERTY_ID, OFFICE_NUM, SQR_FT
	FROM PROPERTY WHERE SQR_FT <= 1400 ORDER BY PROPERTY_ID;
SELECT OFFICE_NUM, ADDRESS, BDRMS
	FROM PROPERTY WHERE BDRMS = 3 ORDER BY OFFICE_NUM; 
SELECT PROPERTY_ID, BDRMS, OFFICE_NUM
	FROM PROPERTY WHERE BDRMS = 2 AND OFFICE_NUM = 2;
SELECT PROPERTY_ID, MONTHLY_RENT
	FROM PROPERTY WHERE MONTHLY_RENT BETWEEN 1350 AND 1750 ORDER BY PROPERTY_ID; 
SELECT PROPERTY_ID, OFFICE_NUM, MONTHLY_RENT
	FROM PROPERTY WHERE OFFICE_NUM = 1 AND MONTHLY_RENT < 1500;
SELECT PROPERTY_ID, CATEGORY_NUMBER, EST_HOURS, EST_HOURS*35 AS ESTIMATED_COST
	FROM SERVICE_REQUEST ORDER BY PROPERTY_ID;

USE MODULE_3_CASE_STUDY
SELECT O.OFFICE_NUM AS MANAGEMENT_OFFICE_NUM, P.ADDRESS, P.MONTHLY_RENT, P.OWNER_NUM, OWN.FIRST_NAME, OWN.LAST_NAME
	FROM OFFICE O, PROPERTY P, OWNER OWN
    WHERE (P.OFFICE_NUM = O.OFFICE_NUM) AND (P.OWNER_NUM = OWN.OWNER_NUM);
SELECT PROPERTY_ID, DESCRIPTION, STATUS
	FROM SERVICE_REQUEST
    WHERE STATUS IN ('OPEN' OR 'COMPLETED');
SELECT SR.PROPERTY_ID, O.OFFICE_NUM AS MANAGEMENT_OFFICE_NUM, O.ADDRESS, SR.DESCRIPTION, SR.EST_HOURS, SR.SPENT_HOURS, P.OWNER_NUM, OWN.LAST_NAME
	FROM SERVICE_REQUEST SR, SERVICE_CATEGORY SC, OFFICE O, PROPERTY P, OWNER OWN
    WHERE (SR.PROPERTY_ID = P.PROPERTY_ID) AND (P.OFFICE_NUM = O.OFFICE_NUM) AND (P.OWNER_NUM = OWN.OWNER_NUM) AND (SR.CATEGORY_NUMBER = SC.CATEGORY_NUM) AND (SC.CATEGORY_NUM = '6'); 
SELECT DISTINCT FIRST_NAME, LAST_NAME
	FROM OWNER
    WHERE OWNER_NUM IN (SELECT OWNER_NUM
							FROM PROPERTY
							WHERE BDRMS = '2'); 
SELECT P1.PROPERTY_ID, P2.PROPERTY_ID, P1.BDRMS 
	FROM PROPERTY P1, PROPERTY P2
    WHERE (P1.BDRMS = P2.BDRMS)
    ORDER BY P1.PROPERTY_ID, P2.PROPERTY_ID; 
SELECT P.SQR_FT, P.OWNER_NUM, OWN.LAST_NAME, OWN.FIRST_NAME
	FROM PROPERTY P, OFFICE O, OWNER OWN
    WHERE (OWN.OWNER_NUM = P.OWNER_NUM) AND (O.OFFICE_NUM = P.OFFICE_NUM) AND (O.OFFICE_NUM = '1');
SELECT O.OFFICE_NUM, P.ADDRESS, P.MONTHLY_RENT
	FROM OFFICE O, PROPERTY P 
    WHERE (P.BDRMS = '2') OR (P.OWNER_NUM IN (SELECT OWNER_NUM
												FROM OWNER
												WHERE STATE = 'WA')); 
SELECT O.OFFICE_NUM, P.ADDRESS, P.MONTHLY_RENT
	FROM OFFICE O, PROPERTY P 
    WHERE (P.BDRMS = '2') AND (P.OWNER_NUM IN (SELECT OWNER_NUM
												FROM OWNER
												WHERE STATE = 'WA')); 
SELECT SERVICE_ID, PROPERTY_ID
	FROM SERVICE_REQUEST
    WHERE EST_HOURS > (SELECT MIN(EST_HOURS) 
							FROM SERVICE_REQUEST
                            WHERE CATEGORY_NUMBER = '5'); 
SELECT P.ADDRESS, P.SQR_FT, P.OWNER_NUM, SR.CATEGORY_NUMBER, SR.EST_HOURS, SR.SPENT_HOURS
	FROM PROPERTY P, SERVICE_REQUEST SR
    WHERE (P.PROPERTY_ID = SR.PROPERTY_ID) AND (SR.CATEGORY_NUMBER = '4'); 
USE MODULE_3_CASE_STUDY;
CREATE TABLE LARGE_PROPERTY (
	OFFICE_NUM DECIMAL (2,0) NOT NULL, 
    ADDRESS CHAR (25) NOT NULL, 
    BDRMS DECIMAL (2,0), 
    FLOORS DECIMAL (2,0), 
    MONTHLY_RENT DECIMAL (6,2), 
    OWNER_NUM CHAR (5), 
    PRIMARY KEY (OFFICE_NUM, ADDRESS)
); 
DESCRIBE LARGE_PROPERTY; 
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
	SELECT OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM
    FROM PROPERTY WHERE (SQR_FT>1500); 
SELECT*
	FROM LARGE_PROPERTY; 
UPDATE LARGE_PROPERTY SET MONTHLY_RENT = MONTHLY_RENT + 150; 
SELECT*
	FROM LARGE_PROPERTY; 
UPDATE LARGE_PROPERTY SET MONTHLY_RENT = MONTHLY_RENT - MONTHLY_RENT * 0.01 
	WHERE MONTHLY_RENT > 1750; 
SELECT*
	FROM LARGE_PROPERTY;
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
	VALUES (1, '2643 Lugsi Dr.', 3, 2, 775.00, 'MA111'); 
SELECT*
	FROM LARGE_PROPERTY; 
DELETE 
	FROM LARGE_PROPERTY
    WHERE OWNER_NUM = 'BI109';
SELECT*
	FROM LARGE_PROPERTY; 
 UPDATE LARGE_PROPERTY SET BDRMS = NULL 
	WHERE (ADDRESS = '105 North Illinois Rd.');
SELECT* 
	FROM LARGE_PROPERTY; 
ALTER TABLE LARGE_PROPERTY
	ADD OCCUPIED CHAR (1); 
UPDATE LARGE_PROPERTY SET OCCUPIED = 'Y'; 
SELECT*
	FROM LARGE_PROPERTY; 
UPDATE LARGE_PROPERTY SET OCCUPIED = 'N'
	WHERE (OWNER_NUM = 'KO104');
SELECT* 
	FROM LARGE_PROPERTY; 
ALTER TABLE LARGE_PROPERTY
	MODIFY MONTHLY_RENT DECIMAL (6,2) NOT NULL; 