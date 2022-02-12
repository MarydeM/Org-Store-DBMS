create schema if not exists OrgStoreSchema;

use OrgStoreSchema;

-- ENTITIES

-- There will be a row with the same TransNum for every Item purchased in order to allow us 
-- to not have a multi-valued column
create table if not exists Consumer(
		TransNum int NOT NULL,
        Item varchar(12) NOT NULL,
        primary key (TransNum)
        );
	
create table PRODUCT ( 
	PID varchar(12) not null, 
	SID varchar(4) not null,
	Price char,
	Quantity not null,
	FOREIGN KEY (SID) REFERENCES STORE (SID)
primary key(PID)
);


create table SUPPLIER ( 
	SupID varchar(4) not null, 
	Location char not null, 
	ProductionRate char
primary key(SupID)
);


create table STORE ( 
	SID varchar(4) not null,
	S_Name var,
	Location var,
primary key(SID)
);


create table EMPLOYEE ( 
	SSN varchar(9) not null, 
	Address char, 
	Name char not null,
primary key(SSN)
);


-- ----------------------------------------------------------------------------------------
-- RELATIONS

