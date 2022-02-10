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


-- ----------------------------------------------------------------------------------------
-- RELATIONS

