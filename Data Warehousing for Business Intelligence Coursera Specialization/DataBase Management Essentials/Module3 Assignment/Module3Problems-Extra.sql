DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE OrderTbl;

CREATE TABLE Employee
(
  EmpNo        CHAR(8)	    CONSTRAINT EmpNoRequired not null,
  EmpFirstName VARCHAR2(20) CONSTRAINT EmpFirstNameRequired	not null,
  EmpLastName  VARCHAR2(30) CONSTRAINT EmpLastNameRequired	not null,
  EmpPhone     CHAR(15),
  EmpEmail     VARCHAR2(50) CONSTRAINT EmpEmailRequired	not null,
  CONSTRAINT EmployeePK PRIMARY KEY (EmpNo),
	CONSTRAINT UniqueEmpEmail UNIQUE (EmpEmail)
);


CREATE TABLE Customer
(
  CustNo    	    CHAR(8)	     CONSTRAINT CustNoRequired not null,
  CustFirstName		VARCHAR2(20) CONSTRAINT CustFirstNameRequired not null,
  CustLastName	  VARCHAR2(30) CONSTRAINT CustLastNameRequired not null,
  CustCity	      VARCHAR2(30),
  CustState			  CHAR(2),
  CustZip				  CHAR(10),
  CustBal				  DECIMAL(12,2),
  CONSTRAINT CustomerPK PRIMARY KEY (CustNo)
);


CREATE TABLE OrderTbl
(
  OrdNo      CHAR(8)      CONSTRAINT OrdNoRequired not null,
  OrdDate    DATE         CONSTRAINT OrdDateRequired not null,
  CustNo     CHAR(8)      CONSTRAINT CustNoOrderTblRequired not null,
  EmpNo      CHAR(8),
  CONSTRAINT OrderTblPK PRIMARY KEY (OrdNo),
	CONSTRAINT CustNoFK FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
  CONSTRAINT EmpNoFK FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);
