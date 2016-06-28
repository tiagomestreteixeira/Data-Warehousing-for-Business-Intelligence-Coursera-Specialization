
---------------- Student -------------------
CREATE TABLE Student
(
	StdNo			char(11) not null,
	StdFirstName	varchar2(50) not null,
	StdLastName		varchar2(50) not null,
	StdCity			varchar2(50) not null,
	StdState		char(2) not null,
	StdZip			char(10) not null,
	StdMajor		char(6),
	StdClass	    char(6),
	StdGPA			decimal(3,2),
	CONSTRAINT StudentPK PRIMARY KEY (StdNo)
);


--------------- Course ----------------------
CREATE TABLE Course
(
	CourseNo char(6) not null,
	CrsDesc varchar2(50) not null,
	CrsUnits integer,
	CONSTRAINT CoursePK PRIMARY KEY (CourseNo)
);


-------------------- Faculty --------------------------------
CREATE TABLE Faculty
(
	FacNo			char(11) not null,
	FacFirstName	varchar2(30) not null,
	FacLastName		varchar2(30) not null,
	FacCity			varchar2(30) not null,
	FacState		char(2) not null,
	FacZipCode		char(10) not null,
	FacRank			char(4),
	FacHireDate     date,
	FacSalary		decimal(10,2),
	FacSupervisor	char(11),
	FacDept			char(6),
	CONSTRAINT FacultyPK PRIMARY KEY (FacNo),
	CONSTRAINT SupervisorFK FOREIGN KEY (FacSupervisor) REFERENCES Faculty
);

CREATE TABLE Enrollement
(




);



DROP TABLE FACILITY;
DROP TABLE EVENTREQUEST;
DROP TABLE CUSTOMER;
DROP TABLE LOCATION;
DROP TABLE EMPLOYEE;
DROP TABLE EVENTPLAN;
DROP TABLE RESOURCETBL;
DROP TABLE EVENTPLANLINE;

CREATE TABLE FACILITY
(
  FACNO   char(4),
  FACNAME varchar2(30) CONSTRAINT FacNameRequired	not null,
  CONSTRAINT FacilityPK PRIMARY KEY (FACNO),
	CONSTRAINT UniqueFacName UNIQUE (FACNAME)
);


CREATE TABLE CUSTOMER
(
  CUSTNO    	varchar2(8),
  CUSTNAME		varchar2(50) CONSTRAINT CustNameRequired not null,
  ADDRESS			varchar2(50) CONSTRAINT AddressRequired not null,
  INTERNAL	  char(1) 		 CONSTRAINT InternalRequired not null,
  CONTACT			varchar2(50) CONSTRAINT ContactRequired not null,
  PHONE				integer  		 CONSTRAINT PhoneRequired not null,
  CITY				varchar2(30) CONSTRAINT CityRequired not null,
  STATE				char(2) 		 CONSTRAINT StateRequired not null,
  ZIP					char(5) 		 CONSTRAINT ZipRequired not null,
  CONSTRAINT CustomerPK PRIMARY KEY (CUSTNO)
);


CREATE TABLE LOCATION
(
  LOCNO			 char(4),
  FACNO      char(4),
  LOCNAME 	 varchar2(30)	CONSTRAINT LocNameRequired not null,
  CONSTRAINT LocationPK PRIMARY KEY (LOCNO),
	CONSTRAINT FacNoFK FOREIGN KEY (FACNO) REFERENCES FACILITY
);


CREATE TABLE EVENTREQUEST
(
  EVENTNO
  DATEHELD
  DATEREQ
  CUSTNO
  FACNO
  DATEAUTH
  STATUS
  ESTCOST
  ESTAUDIENCE
  BUDNO
  CONSTRAINT EventRequestPK PRIMARY KEY (EVENTNO)
);

CREATE TABLE EMPLOYEE
(
  EMPNO
  EMPNAME
  DEPARTMENT
  EMAIL
  PHONE
  CONSTRAINT EmployeePK PRIMARY KEY (EMPNO)
);

CREATE TABLE EVENTPLAN
(
  PLANNO
  EVENTNO
  WORKDATE
  NOTES
  ACTMITY
  EMPNO
  CONSTRAINT EventPlanPK PRIMARY KEY (PLANNO)
);


CREATE TABLE RESOURCETBL
(
  RESNO
  RESNAME
  RATE
  CONSTRAINT ResourceTblPK PRIMARY KEY (RESNO)
);
