drop database orgstoreschema;
create schema if not exists OrgStoreSchema;

use OrgStoreSchema;

-- ENTITIES

-- There will be a row with the same TransNum for every Item purchased in order to allow us 
-- to not have a multi-valued column
	
create table if not exists STORE ( 
	SID varchar(4) not null unique,
	S_Name varchar(45),
	Location varchar(60),
	primary key(SID)
);

create table if not exists CONSUMER(
	TransNum varchar(4) NOT NULL unique,
	SID varchar(4) NOT NULL,
    primary key (TransNum),
    foreign key(SID) references STORE(SID) on delete cascade
);

create table if not exists FARM(
	SupID varchar(5) not null unique,
    SupName varchar(45),
    Location varchar(60),
    primary key(SupID)
);

create table if not exists PRODUCT(
	PID varchar(5) not null unique,
    pName varchar(12) not null unique,
	Price decimal(3,2),
	primary key(PID)
);

create table if not exists EMPLOYEE ( 
	Name varchar(50) not null unique,
	SSN varchar(9) not null unique, 
	Address varchar(50), 
	SID varchar(4),
	primary key(SSN), 
	FOREIGN KEY(SID) REFERENCES STORE(SID) on delete cascade
);

-- ----------------------------------------------------------------------------------------
-- RELATIONS

create table if not exists Purchase(
	TransNum varchar(4) NOT NULL,
	PID varchar(12) NOT NULL,
	pAmt int NOT NULL,
    foreign key(TransNum) references Consumer(TransNum) on delete cascade,
    foreign key(PID) references PRODUCT(PID) on delete cascade
);

create table if not exists Manages(
	ManSSN varchar(9) not null unique, -- Manager SSN
    SID varchar(4) not null, -- Store ID
    foreign key(ManSSN) references Employee(SSN) on delete cascade,
    foreign key(SID) references Employee(SID) on delete cascade
);

create table if not exists InStock(
	PID varchar(5) not null,
    SID varchar(4) not null,
    iAmt int check(iAmt>0), -- amount of this item in stock
    foreign key(PID) references PRODUCT(PID),
    foreign key(SID) references Store(SID)
);

create table if not exists SuppliedTo(
	SID varchar(4) not null,
	PID varchar(12) not null,
    sAmt int,
    foreign key(SID) references STORE(SID),
    foreign key(PID) references PRODUCT(PID)
);

create table if not exists cultivates(
	SupID varchar(4) not null,
	PID varchar(12) not null,
    foreign key(SupID) references FARM(SupID) on delete cascade,
    foreign key(PID) references PRODUCT(PID) on delete cascade
);

-- ----------------------------------------------------------------------------------------
-- POPULATIONS

INSERT INTO STORE values
	('0231','Product Haven','123 playgrnd st.'),
	('0232','Local Organic','563 alabama dr.'),
	('0435','Store Fresh','302 sunset blvd.'),
	('0436','Oasis Secret','970 tech dr.'),
	('0199','True Grocers','678 subway st.');

INSERT INTO CONSUMER values
	('1023', '0231'),
	('1024', '0231'),
	('1025', '0231'),
	('1026', '0231'),
	('1011', '0231'),

	('1012', '0232'),
	('1021', '0232'),
	('1031', '0232'),
	('2021', '0232'),
	('4021', '0232'),

	('2221', '0435'),
	('2222', '0435'),
	('2421', '0435'),

	('3221', '0436'),
	('2621', '0436'),
	('5221', '0436'),
	('8011', '0436'),

	('9011', '0199'),
	('9221', '0199'),
	('9025', '0199'),
	('6025', '0199');

INSERT INTO FARM values
	('7894','USDA Organic','731 arkansas dr.'),
	('9658','PacMoore','213 pittsburg ave.'),
	('1148','Organic Consumers Association', '432 california ave.');

INSERT INTO PRODUCT values
	('45250', 'squash', 1.50),
	('65513', 'lettuce', 3.50),
	('89144', 'tomato', 0.75),
	('95100', 'cauliflower', 3.75),
	('74470', 'pumpkin', 4.00),
	('62597', 'bread', 2.50),
	('59665', 'eggs', 0.90),
	('45504', 'chicken', 3.75),
	('22678', 'ham', 5.28),
	('57375', 'beef', 9.87),
	('31695', 'milk', 3.50),
	('31966', 'cheese', 2.64),
	('38503', 'bacon', 5.00);

INSERT INTO EMPLOYEE values
	('Nikomachos Riain', '139506321' , '123 penny lane', '0231'),
	('Geneviève Tafani', '129243521' , '124 penny lane', '0231'),
	('Manana Lémieux', '241567321' , '125 penny lane', '0231'),
	('Heidrun Alexandersen', '123512321' , '126 penny lane', '0231'),
	('Warin Davids', '123126341' , '127 penny lane', '0231'),
	('Chidike Noel', '123167481' , '121 terr drive', '0231'),
	('Cruz Mitchell', '123465321' , '122 terry drive', '0231'),
	('Goibniu Costa', '122434321' , '123 terry drive', '0231'),
	('Abidemi Ahmad', '136433521' , '124 terry drive', '0231'),
	('Hannas Leigh', '153427581' , '125 terry drive', '0231'),
	('Konstadina Rana', '232332134' , '223 stu street', '0231'),
	('Amarachi Brook', '223333421' , '223 stu street', '0231'),
	('Vergilius Chavarría', '264373321' , '223 stu street', '0231'),
	('Maelgwn Abbatantuono', '234623321' , '223 stu street', '0231'),
	('Magnus Dietrich', '123122345' , '223 stu street', '0231'),
	('Hasse Schultes', '343123334' , '131 penny lane', '0231'),
	('Herbert Van Bred','423123321' , '132 penny lane', '0231'),
	('Magdalena Ó Conghalaig','323123321' , '133 penny lane', '0231'),
	('Louka Michala','123123323' , '134 penny lane', '0231'),
	('Julyan Armstrong', '223123321' , '135 penny lane', '0231'),
	('Breeshey Hanssen', '623123321' , '136 penny lane', '0231'),
	('Rishi Irving', '344533214' , '121 howard lane', '0231'),
	('Herb Ó hÍcidhe', '876823321' , '122 howard lane', '0231'),
	('Naftali Martín', '543323321' , '123 howard lane', '0231'),
	('Pərviz Losnedahl', '344123321' , '124 howard lane', '0231'),
	('Souleymane Sneijers', '453123321' , '125 howard lane', '0231'),

	('Tryphosa Eady', '689723321' , '123 jenny lane', '0232'),
	('Summanus McWilliam', '883123321' , '124 jenny lane', '0232'),
	('Dubaku Durand', '123166321' , '125 jenny lane', '0232'),
	('Madelief Quijada', '183123321' , '126 jenny lane', '0232'),
	('Klara Feldt', '123127721' , '127 jenny lane', '0232'),
	('Gréta Schuchert', '128123321' , '141 penny lane', '0232'),
	('Gervase Neville', '127123321' , '142 penny lane', '0232'),
	('Pauli Sheach', '123158321' , '143 penny lane', '0232'),
	('Thibaut McKendrick', '883123421' , '144 penny lane', '0232'),
	('Elmārs Ganza', '127127831' , '145 penny lane', '0232'),
	('Þórfríðr Patel', '178123321' , '123 fenny lane', '0232'),
	('Beli Mathers', '123873321' , '141 jenny lane', '0232'),
	('Anamaria Matijević', '723123321' , '142 jenny lane', '0232'),
	('Jessika Parodi', '123173321' , '143 jenny lane', '0232'),
	('Sancheriv Böhmer', '178523321' , '144 jenny lane', '0232'),
	('Günay Smolak', '123123921' , '145 jenny lane', '0232'),
	('Nicander Uggeri', '126823321' , '131 terry drive', '0232'),
	('Avril Heinrichs', '123423321' , '132 terry drive', '0232'),
	('Janvier Ó Fearghail', '623123351' , '133 terry drive', '0232'),
	('Ajith Vinković', '312332174' , '134 terry drive', '0232'),
	('Usha Volk', '723126321' , '135 terry drive', '0232'),
	('Sara Alvarsson', '693123321' , '121 flower st', '0232'),
	('Fabia Moloney', '923123321' , '122 flower st', '0232'),
	('Loukios Leifsson', '773123321' , '123 flower st', '0232'),
	('Timéo Marangoz', '963123321' , '124 flower st', '0232'),

	('Marikit Traylor', '973123321' , '131 flower st', '0435'),
	('Wieland Aston', '983123321' , '131 flower st', '0435'),
	('Olavi Berardi', '673123321' , '131 flower st', '0435'),
	('Juliāna Romano', '777123321' , '132 flower st', '0435'),
	('Dorinel François', '873123321' , '132 flower st', '0435'),
	('Danielius Spijker', '553123321' , '123 penny lane', '0435'),
	('Rodina Aleppo', '166435321' , '123 penny lane', '0435'),
	('Jaylyn Esser', '123144321' , '144 upsidedown place', '0435'),
	('Stanislovas Ormond', '563123321' , '145 upsidedown place', '0435'),
	('Jenny Jardine', '123167521' , '146 upsidedown place', '0435'),
	('Perig Ivers', '123566321' , '147 upsidedown place', '0435'),
	('Fausta Szabó', '166123321' , '145 upsidedown place', '0435'),
	('Aran Spannagel', '157123321' , '251 flower st', '0435'),
	('Håkon Schirmer', '124123321' , '252 flower st', '0435'),
	('Padmavati Acquati', '583123321' , '253 flower st', '0435'),
	('Renáta Sharma', '123154321' , '254 flower st', '0435'),
	('Alger Marín', '123123651' , '254 flower st', '0435'),
	('Moisés De Vries', '123523321' , '255 flower st', '0435'),
	('Elwood Antonsen', '123526321' , '822 garnet avenue', '0435'),
	('Larkin Beattie', '123352515' , '823 garnet avenue', '0435'),
	('Kriemhild Elder', '123352631' , '824 garnet avenue', '0435'),
	('Anant De La Fontaine', '122373821' , '825 garnet avenue', '0435'),
	('Sparrow Walsh', '137263521' , '826 garnet avenue', '0435'),
	('Eugenia De Kloet', '224332154' , '827 garnet avenue', '0435'),
	('Gustave Gosselin', '123147245' , '828 garnet avenue', '0435'),

	('Bat-Erdene Tessaro', '121123321' , '961 jump street', '0436'),
	('Missy Kolijn', '123123325' , '962 jump street', '0436'),
	('Altwidus Johnson', '123453321' , '963 jump street', '0436'),
	('Xochipilli Botterill', '523123321' , '964 jump street', '0436'),
	('Emese Größel', '123123352' , '965 jump street', '0436'),
	('Henrikki Gynt', '123123241' , '966 jump street', '0436'),
	('Alexandru Gaertner', '125523321' , '967 jump street', '0436'),
	('Zeno Daniau', '122452241' , '002 texas avenue', '0436'),
	('Ahriman Couch', '125153321' , '003 texas avenue', '0436'),
	('Enrichetta Bakhuizen', '456223321' , '001 texas avenue', '0436'),
	('Ferdi Ricchetti', '123145641' , '002 texas avenue', '0436'),
	('Tecla Gage', '122486721' , '004 texas avenue', '0436'),
	('Áki Reier', '867723321' , '005 texas avenue', '0436'),
	('Radana Capello', '876123321' , '006 texas avenue', '0436'),
	('Trajan Aiello', '123125621' , '007 texas avenue', '0436'),
	('Hipólito Chowdhury', '723123721' , '008 texas avenue', '0436'),
	('Dinesh Antonini', '923128321' , '674 tidus drive', '0436'),
	('Hersilia Rose', '967123321' , '674 tidus drive', '0436'),
	('Marlene Zlatkov', '973125321' , '671 tidus drive', '0436'),
	('Burhan al-Din Koppel', '975312321' , '684 tidus drive', '0436'),
	('Faɗimatu McCormick', '193123321' , '675 tidus drive', '0436'),
	('Siem Shirazi', '976123321' , '671 tidus drive', '0436'),
	('Arnbjǫrg Zhao', '973123329' , '673 tidus drive', '0436'),
	('Catharina Boon', '193143321' , '624 tidus drive', '0436'),
	('Theano Almeida', '698123321' , '634 tidus drive', '0436'),

	('Helen Villeneuve', '623423321' , '771 yuna street', '0199'),
	('Yeong-Su Quinn', '123723321' , '772 yuna street', '0199'),
	('Shelly Pavlovsky', '963193321' , '773 yuna street', '0199'),
	('Khnum-Khufu Serizawa', '154123321' , '774 yuna street', '0199'),
	('Rochus Tunison', '123123693' , '775 yuna street', '0199'),
	('Coraline Joshi', '497123321' , '776 yuna street', '0199'),
	('Cailean Soucy', '947723321' , '451 waka avenue', '0199'),
	('Christopher Haanraads', '976761233' , '452 waka avenue', '0199'),
	('Edda Dùbhghlas', '178129321' , '453 waka avenue', '0199'),
	('Goda Uehara', '123123821' , '453 waka avenue', '0199'),
	('Katla Hannigan', '193723321' , '454 waka avenue', '0199'),
	('Nadir McKendrick', '724323321' , '455 waka avenue', '0199'),
	('Wulfruna Swift', '773123643' , '791 lulu lane', '0199'),
	('Norbert Hofer', '127723321' , '791 lulu lane', '0199'),
	('Maja Scarpa', '123123721' , '792 lulu lane', '0199'),
	('Rômulo Lacy', '312763721' , '792 lulu lane', '0199'),
	('Henda Sonnen', '131923321' , '793 lulu lane', '0199'),
	('Abdur Rahman Pasternak', '121293321' , '794 lulu lane', '0199'),
	('Kistiñe Bader', '167123321' , '795 lulu lane', '0199'),
	('Solvig Reier', '123733921' , '991 auron road', '0199'),
	('Khayrat Oakley', '716212933' , '992 auron road', '0199'),
	('Katayun Wiśniewski', '144323321' , '993 auron road', '0199'),
	('Theodore Frank', '856856321' , '994 auron road', '0199'),
	('Akamu Hsieh', '835685321' , '995 auron road', '0199'),
	('Anamaria Killough', '935623321' , '997 auron road', '0199');

INSERT INTO Cultivates values
	('7894', '45250'),
	('7894', '65513'),
	('7894', '89144'),
	('7894', '95100'),
	('7894', '74470'),

	('9658', '62597'),
	('9658', '59665'),
	('9658', '45504'),

	('1148', '22678'),
	('1148', '57375'),
	('1148', '31695'),
	('1148', '31966'),
	('1148', '38503');

INSERT INTO Purchase values

	("1023", '62597', 1),
	("1023", '59665', 1),
	("1023", '22678', 1),
	("1023", '57375', 1),
	("1023", '45504', 1),
	("1023", '45250', 1),
	("1023", '65513', 1),
	("1023", '89144', 1),
	("1023", '31695', 1),
	("1023", '31966', 1),

	("1024", '62597', 1),
	("1024", '59665', 1),
	("1024", '22678', 1),
	("1024", '57375', 1),
	("1024", '45504', 1),
	("1024", '74470', 1),
	("1024", '65513', 1),
	("1024", '89144', 1),
	("1024", '31695', 1),
	("1024", '31966', 1),

	("1025", '62597', 1),
	("1025", '59665', 1),
	("1025", '38503', 1),
	("1025", '57375', 1),
	("1025", '45504', 1),
	("1025", '45250', 1),
	("1025", '65513', 1),
	("1025", '89144', 1),
	("1025", '31695', 1),
	("1025", '31966', 1),

	("1026", '95100', 1),
	("1026", '59665', 1),
	("1026", '22678', 1),
	("1026", '57375', 1),
	("1026", '45504', 1),
	("1026", '45250', 1),
	("1026", '65513', 1),
	("1026", '89144', 1),
	("1026", '31695', 1),
	("1026", '31966', 1),

	("1011", '95100', 1),
	("1011", '59665', 1),
	("1011", '22678', 1),
	("1011", '57375', 1),
	("1011", '45504', 1),
	("1011", '45250', 1),
	("1011", '65513', 1),
	("1011", '89144', 1),
	("1011", '31695', 1),

	("1012", '22678', 1),
	("1012", '57375', 1),
	("1012", '45504', 1),
	("1012", '45250', 1),
	("1012", '65513', 1),

	("1021", '59665', 1),
	("1021", '38503', 1),
	("1021", '57375', 1),
	("1021", '45504', 1),
	("1021", '45250', 1),
	("1021", '65513', 1),
	("1021", '89144', 1),
	("1021", '31695', 1),
	("1021", '31966', 1),

	("1031", '45504', 1),
	("1031", '45250', 1),
	("1031", '65513', 1),
	("1031", '89144', 1),

	("2021", '59665', 1),
	("2021", '38503', 1),
	("2021", '57375', 1),
	("2021", '45504', 1),
	("2021", '45250', 1),
	("2021", '65513', 1),
	("2021", '89144', 1),
	("2021", '31695', 1),
	("2021", '31966', 1),

	("4021", '57375', 1),
	("4021", '45504', 1),
	("4021", '45250', 1),
	("4021", '65513', 1),
	("4021", '89144', 1),

	("2221", '59665', 1),
	("2221", '38503', 1),
	("2221", '57375', 1),
	("2221", '45504', 1),
	("2221", '45250', 1),
	("2221", '65513', 1),
	("2221", '89144', 1),
	("2221", '31695', 1),
	("2221", '31966', 1),

	("2222", '57375', 1),
	("2222", '45504', 1),
	("2222", '45250', 1),
	("2222", '65513', 1),
	("2222", '89144', 1),

	("2421", '38503', 1),
	("2421", '57375', 1),
	("2421", '45504', 1),

	("3221", '45250', 1),
	("3221", '65513', 1),
	("3221", '89144', 1),
	("3221", '31695', 1),
	("3221", '31966', 1),

	("2621", '57375', 1),
	("2621", '45504', 1),
	("2621", '45250', 1),

	("5221", '59665', 1),
	("5221", '38503', 1),
	("5221", '57375', 1),
	("5221", '45504', 1),
	("5221", '45250', 1),

	("8011", '45504', 1),
	("8011", '45250', 1),
	("8011", '65513', 1),
	("9011", '89144', 1),
	("9011", '31695', 1),

	("9221", '65513', 1),
	("9221", '89144', 1),

	("9025", '59665', 1),
	("9025", '38503', 1),
	("9025", '57375', 1),
	("9025", '45504', 1),
	("9025", '45250', 1),
	("9025", '65513', 1),
	("9025", '89144', 1),
	("9025", '31695', 1),
	("9025", '31966', 1),

	("6025", '45250', 1),
	("6025", '65513', 1),
	("6025", '89144', 1),
	("6025", '31695', 1);

INSERT INTO Manages values
	('139506321', '0231'),
	('129243521', '0231'),
	('241567321', '0231'),

	('689723321', '0232'),
	('883123321', '0232'),
	('123166321', '0232'),

	('973123321', '0435'),
	('983123321', '0435'),
	('673123321', '0435'),

	('121123321', '0436'),
	('123123325', '0436'),
	('123453321', '0436'),

	('623423321', '0199'),
	('123723321', '0199'),
	('963193321', '0199');	

INSERT INTO SuppliedTo values 
	('0231', '45250' , 2),
	('0231', '89144' , 3),
	('0231', '62597' , 2),
	('0231', '45504' , 10),
	('0231', '22678' , 12),
	('0231', '57375' , 9),
	('0231', '31695' , 3),

	('0232', '95100' , 1),
	('0232', '89144' , 3),
	('0232', '62597' , 2),
	('0232', '59665' , 15),
	('0232', '38503' , 14),
	('0232', '57375' , 9),
	('0232', '31695' , 3),

	('0435', '74470' , 5),
	('0435', '89144' , 4),
	('0435', '62597' , 12),
	('0435', '45504' , 15),
	('0435', '22678' , 2),
	('0435', '57375' , 7),
	('0435', '59665' , 3),

	('0436', '89144' , 5),
	('0436', '89144' , 3),
	('0436', '62597' , 2),
	('0436', '45504' , 15),
	('0436', '57375' , 12),
	('0436', '31695' , 9),
	('0436', '38503' , 4),

	('0199', '65513' , 5),
	('0199', '89144' , 3),
	('0199', '62597' , 2),
	('0199', '45504' , 4),
	('0199', '22678' , 2),
	('0199', '57375' , 2),
	('0199', '31695' , 3);
	
INSERT INTO InStock values
	('45250', '0231' , 9),
	('65513', '0231' , 14),
	('89144', '0231' , 3),
	('95100', '0231' , 7),
	('74470', '0231' , 2),
	('62597', '0231' , 8),
	('59665', '0231' , 4),
	('45504', '0231' , 5),
	('22678', '0231' , 6),
	('57375', '0231' , 10),
	('31695', '0231' , 8),
	('31966', '0231' , 12),
	('38503', '0231' , 15),

	('45250', '0232' , 16),
	('65513', '0232' , 5),
	('89144', '0232' , 6),
	('95100', '0232' , 3),
	('74470', '0232' , 15),
	('62597', '0232' , 13),
	('59665', '0232' , 6),
	('45504', '0232' , 5),
	('22678', '0232' , 2),
	('57375', '0232' , 18),
	('31695', '0232' , 6),
	('31966', '0232' , 12),
	('38503', '0232' , 6),

	('45250', '0435' , 12),
	('65513', '0435' , 5),
	('89144', '0435' , 8),
	('95100', '0435' , 4),
	('74470', '0435' , 10),
	('62597', '0435' , 6),
	('59665', '0435' , 7),
	('45504', '0435' , 14),
	('22678', '0435' , 3),
	('57375', '0435' , 7),
	('31695', '0435' , 6),
	('31966', '0435' , 2),
	('38503', '0435' , 5),

	('45250', '0436' , 2),
	('65513', '0436' , 9),
	('89144', '0436' , 4),
	('95100', '0436' , 8),
	('74470', '0436' , 5),
	('62597', '0436' , 3),
	('59665', '0436' , 14),
	('45504', '0436' , 7),
	('22678', '0436' , 11),
	('57375', '0436' , 10),
	('31695', '0436' , 12),
	('31966', '0436' , 9),
	('38503', '0436' , 3),

	('45250', '0199' , 9),
	('65513', '0199' , 3),
	('89144', '0199' , 12),
	('95100', '0199' , 6),
	('74470', '0199' , 10),
	('62597', '0199' , 23),
	('59665', '0199' , 4),
	('45504', '0199' , 13),
	('22678', '0199' , 7),
	('57375', '0199' , 5),
	('31695', '0199' , 8),
	('31966', '0199' , 3),
	('38503', '0199' , 9);

-- -------------------------------------------------------------------
-- TRIGGERS

DELIMITER $$
	CREATE TRIGGER reStock
	AFTER INSERT ON SuppliedTo
	FOR EACH ROW
	BEGIN
		UPDATE InStock
		SET iAmt = (iAmt + NEW.sAmt)
		WHERE PID = NEW.PID;
	END $$
DELIMITER ;

-- drop trigger transaction;
DELIMITER $$
	CREATE TRIGGER Transaction
	AFTER INSERT ON Purchase
	FOR EACH ROW
	BEGIN
		UPDATE InStock
        SET InStock.iAmt = (InStock.iAmt - New.pAmt)
        WHERE PID = new.PID;
	END $$
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER lowStock
	AFTER UPDATE ON INSTOCK
	FOR EACH ROW
	BEGIN
		declare msg varchar(255);
		IF (iAmt <= 1 ) THEN
			set msg = 'Low Stock';
			signal sqlstate '45000' set message_text = msg;
		END IF;
	END
	$$
DELIMITER ;

-- --------------------------------------------------------------------------
-- VIEWS

CREATE VIEW StoreStock AS
	SELECT s.S_Name, p.pName, i.iAmt
	FROM Store s, Product p, InStock i
	WHERE s.SID = i.SID and p.PID = i.PID;

CREATE VIEW TransactionMan AS
	SELECT c.TransNum, s.S_Name, e.Name
	FROM Consumer c, Store s, Employee e, Manages m
	WHERE m.SID = s.SID and m.ManSSN = e.SSN 
		  and c.SID = m.SID;
