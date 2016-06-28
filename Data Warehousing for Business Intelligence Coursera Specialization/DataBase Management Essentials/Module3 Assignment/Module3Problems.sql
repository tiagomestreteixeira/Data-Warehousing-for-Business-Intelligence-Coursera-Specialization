DROP TABLE Facility;
DROP TABLE Customer;
DROP TABLE Location;

CREATE TABLE Facility
(
  FacNo   VARCHAR2(8)	 CONSTRAINT FacNoRequired not null,
  FacName VARCHAR2(30) CONSTRAINT FacNameRequired	not null,
  CONSTRAINT FacilityPK PRIMARY KEY (FacNo),
	CONSTRAINT UniqueFacName UNIQUE (FacName)
);


CREATE TABLE Customer
(
  CustNo    	VARCHAR2(8)	 CONSTRAINT CustNoRequired not null,
  CustName		VARCHAR2(50) CONSTRAINT CustNameRequired not null,
  Address			VARCHAR2(50) CONSTRAINT AddressRequired not null,
  Internal	  CHAR(1) 		 CONSTRAINT InternalRequired not null,
  Contact			VARCHAR2(50) CONSTRAINT ContactRequired not null,
  Phone				VARCHAR2(11) CONSTRAINT PhoneRequired not null,
  City				VARCHAR2(30) CONSTRAINT CityRequired not null,
  State				CHAR(2) 		 CONSTRAINT StateRequired not null,
  Zip					VARCHAR2(10) CONSTRAINT ZipRequired not null,
  CONSTRAINT CustomerPK PRIMARY KEY (CustNo)
);


CREATE TABLE Location
(
  LocNo			 VARCHAR2(8)  CONSTRAINT LocNoLocationRequired not null,
  FacNo      VARCHAR2(8)  CONSTRAINT FacNoLocationRequired not null,
  LocName 	 CHAR(30)			CONSTRAINT LocNameRequired not null,
  CONSTRAINT LocationPK PRIMARY KEY (LocNo),
	CONSTRAINT FacNoFK FOREIGN KEY (FacNo) REFERENCES Location (FacNo)
);
