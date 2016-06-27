CREATE TABLE customer
( 
  CustNo     VARCHAR2(8)  NOT NULL,
  CustName   VARCHAR2(25) NOT NULL,
  Address    VARCHAR2(25) NOT NULL,
  Internal   CHAR(1)      NOT NULL,
  Contact    VARCHAR2(25) NOT NULL,
  Phone      CHAR(7)      NOT NULL,
  City       VARCHAR2(15) NOT NULL,
  State      CHAR(2)      NOT NULL,
  Zip        CHAR(6)      NOT NULL,
  CONSTRAINT PK_CustomerTable PRIMARY KEY (CustNo)
);

CREATE TABLE Employee
(
  EmpNo       VARCHAR2(8)  NOT NULL,
  EmpName     VARCHAR2(25) NOT NULL,
  Department  VARCHAR2(15) NOT NULL,
  Email       VARCHAR2(25) NOT NULL,
  Phone       VARCHAR2(6)  NOT NULL,
  CONSTRAINT PK_EmployeeTable PRIMARY KEY (EmpNo)
);

CREATE TABLE Facility
(
  FacNo       VARCHAR2(8)  NOT NULL,
  FacName     VARCHAR2(25) NOT NULL,
  CONSTRAINT PK_FacilityTable PRIMARY KEY (FacNo)
);

CREATE TABLE Location
(
  LocNo     VARCHAR2(8) NOT NULL,
  FacNo     VARCHAR2(8) NOT NULL,
  LocName   VARCHAR2(25) NOT NULL,
  CONSTRAINT PK_LocationTable PRIMARY KEY (LocNo),
  CONSTRAINT FK_FacNo_Location FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);

CREATE TABLE ResourceTbl
(
  ResNo      VARCHAR2(8)  NOT NULL,
  ResName    VARCHAR2(25) NOT NULL,
  Rate       NUMBER(*,2)  NOT NULL,
  CONSTRAINT PK_ResourceTblTable PRIMARY KEY (ResNo),
  CONSTRAINT Check_PositiveRate CHECK (Rate > 0)
);

CREATE TABLE EventRequest
(
  EventNo       VARCHAR2(8) NOT NULL,
  DateHeld      DATE        NOT NULL,
  DateReq       DATE        NOT NULL,
  FacNo         VARCHAR2(8) NOT NULL,
  CustNo        VARCHAR2(8) NOT NULL,
  DateAuth      DATE, -- Can be Null
  Status        VARCHAR2(8) NOT NULL,
  EstCost       NUMBER(*,2) NOT NULL,
  EstAudience   NUMBER(10)  NOT NULL,
  BudNo         VARCHAR2(5),-- Can be Null
  CONSTRAINT PK_EventRequestTable PRIMARY KEY (EventNo),
  CONSTRAINT Check_Status CHECK (Status in ('Pending','Denied','Approved')),
  CONSTRAINT FK_CustNo_EventRequest FOREIGN KEY (CustNo) REFERENCES Customer(CustNo),
  CONSTRAINT FK_FacNo_EventRequest FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);

CREATE TABLE EventPlan
(
  PlanNo      VARCHAR2(8) NOT NULL,
  EventNo     VARCHAR2(8) NOT NULL,
  WorkDate    DATE        NOT NULL,
  Notes       VARCHAR2(20), -- Can be Null
  Activity    VARCHAR2(9) NOT NULL,
  EmpNo       VARCHAR2(8), -- Can be Null
  CONSTRAINT PK_EventPlanTable PRIMARY KEY (PlanNo),
  CONSTRAINT FK_EmpNo_EventPlan FOREIGN KEY (EmpNo) REFERENCES Employee(EmpNo),
  CONSTRAINT FK_EventNo_EventPlan FOREIGN KEY (EventNo) REFERENCES EventRequest(EventNo)
);

CREATE TABLE EventPlanLine
(
  PlanNo      VARCHAR2(8) NOT NULL,
  LineNo      VARCHAR2(5) NOT NULL,
  TimeStart   DATE NOT NULL,
  TimeEnd     DATE NOT NULL,
  NumberFld   VARCHAR2(5) NOT NULL,
  LocNo       VARCHAR2(8) NOT NULL,
  ResNo       VARCHAR2(8) NOT NULL,
  CONSTRAINT PK_EventPlanLineTable PRIMARY KEY (PlanNo, LineNo),
  CONSTRAINT Check_StartDateFirst CHECK (TimeEnd > TimeStart),
  CONSTRAINT FK_LocNo_EventPlanLine FOREIGN KEY (LocNo) REFERENCES Location(LocNo),
  CONSTRAINT FK_ResNo_EventPlanLine FOREIGN KEY (ResNo) REFERENCES ResourceTbl(ResNo),
  CONSTRAINT FK_PlanNo_EventPlanLine FOREIGN KEY (PlanNo) REFERENCES EventPlan(PlanNo)
)