create schema if not exists OrgStoreSchema;

use OrgStoreSchema;

-- ENTITIES

-- There will be a row with the same TransNum for every Item purchased in order to allow us 
-- to not have a multi-valued column
create table if not exists Consumer(
		TransNum int NOT NULL,
        primary key (TransNum)
        );
	
create table if not exists STORE ( 
	SID varchar(4) not null,
	S_Name varchar(45),
	Location varchar(60),
primary key(SID)
);

create table if not exists PRODUCT ( 
	PID varchar(12) not null,
    pName varchar(12) not null,
	SID varchar(4) not null,
	Price decimal(5,2),
	Quantity int not null,
	FOREIGN KEY (SID) REFERENCES STORE (SID),
primary key(PID)
);


create table if not exists SUPPLIER ( 
	SupID varchar(4) not null, 
	Location char not null, 
	ProductionRate char,
primary key(SupID)
);

create table if not exists EMPLOYEE ( 
	Name varchar(50) not null,
	SSN varchar(9) not null, 
	Address varchar(50), 
	SID varchar(4) NOT NULL,
	
	primary key(SSN), 
	FOREIGN KEY(SID) REFERENCES STORE(SID)
);

-- ----------------------------------------------------------------------------------------
-- RELATIONS
create table if not exists Purchase(
	TransNum int NOT NULL,
	Item varchar(12) NOT NULL,
    foreign key(TransNum) references Consumer(TransNum)
);

create table if not exists Requires(
	PID varchar(12) not null,
    ingPID varchar(12) not null, -- ingredient PID
    Amount int,
    foreign key(PID) references Product(PID)
);
-- ----------------------------------------------------------------------------------------
-- POPULATIONS

insert into EMPLOYEE values
("Nikomachos Riain", "139506321" , "123 penny lane", "0231"),
("Geneviève Tafani", "129243521" , "124 penny lane", "0231"),
("Manana Lémieux", "241567321" , "125 penny lane", "0231"),
("Heidrun Alexandersen", "123512321" , "126 penny lane", "0231"),
("Warin Davids", "123126341" , "127 penny lane", "0231"),
("Chidike Noel", "123167481" , "121 terr drive", "0231"),
("Cruz Mitchell", "123465321" , "122 terry drive", "0231"),
("Goibniu Costa", "122434321" , "123 terry drive", "0231"),
("Abidemi Ahmad", "136433521" , "124 terry drive", "0231"),
("Hannas Leigh", "153427581" , "125 terry drive", "0231"),
("Konstadina Rana", "232332134" , "223 stu street", "0231"),
("Amarachi Brook", "223333421" , "223 stu street", "0231"),
("Vergilius Chavarría", "264373321" , "223 stu street", "0231"),
("Maelgwn Abbatantuono", "234623321" , "223 stu street", "0231"),
("Magnus Dietrich", "123122345" , "223 stu street", "0231"),
("Hasse Schultes", "343123334" , "131 penny lane", "0231"),
("Herbert Van Bred","423123321" , "132 penny lane", "0231"),
("Magdalena Ó Conghalaig","323123321" , "133 penny lane", "0231"),
("Louka Michala","123123323" , "134 penny lane", "0231"),
("Julyan Armstrong", "223123321" , "135 penny lane", "0231"),
("Breeshey Hanssen", "623123321" , "136 penny lane", "0231"),
("Rishi Irving", "344533214" , "121 howard lane", "0231"),
("Herb Ó hÍcidhe", "876823321" , "122 howard lane", "0231"),
("Naftali Martín", "543323321" , "123 howard lane", "0231"),
("Pərviz Losnedahl", "344123321" , "124 howard lane", "0231"),
("Souleymane Sneijers", "453123321" , "125 howard lane", "0231"),

("Tryphosa Eady", "689723321" , "123 jenny lane", "0232"),
("Summanus McWilliam", "883123321" , "124 jenny lane", "0232"),
("Dubaku Durand", "123166321" , "125 jenny lane", "0232"),
("Madelief Quijada", "183123321" , "126 jenny lane", "0232"),
("Klara Feldt", "123127721" , "127 jenny lane", "0232"),
("Gréta Schuchert", "128123321" , "141 penny lane", "0232"),
("Gervase Neville", "127123321" , "142 penny lane", "0232"),
("Pauli Sheach", "123158321" , "143 penny lane", "0232"),
("Thibaut McKendrick", "883123321" , "144 penny lane", "0232"),
("Elmārs Ganza", "127127831" , "145 penny lane", "0232"),
("Þórfríðr Patel", "178123321" , "123 fenny lane", "0232"),
("Beli Mathers", "123873321" , "141 jenny lane", "0232"),
("Anamaria Matijević", "723123321" , "142 jenny lane", "0232"),
("Jessika Parodi", "123173321" , "143 jenny lane", "0232"),
("Sancheriv Böhmer", "178123321" , "144 jenny lane", "0232"),
("Günay Smolak", "123123921" , "145 jenny lane", "0232"),
("Nicander Uggeri", "126823321" , "131 terry drive", "0232"),
("Avril Heinrichs", "123423321" , "132 terry drive", "0232"),
("Janvier Ó Fearghail", "623123321" , "133 terry drive", "0232"),
("Ajith Vinković", "312332174" , "134 terry drive", "0232"),
("Usha Volk", "723123321" , "135 terry drive", "0232"),
("Sara Alvarsson", "623123321" , "121 flower st", "0232"),
("Fabia Moloney", "923123321" , "122 flower st", "0232"),
("Loukios Leifsson", "773123321" , "123 flower st", "0232"),
("Timéo Marangoz", "963123321" , "124 flower st", "0232"),

("Marikit Traylor", "973123321" , "131 flower st", "0435"),
("Wieland Aston", "983123321" , "131 flower st", "0435"),
("Olavi Berardi", "673123321" , "131 flower st", "0435"),
("Juliāna Romano", "777123321" , "132 flower st", "0435"),
("Dorinel François", "873123321" , "132 flower st", "0435"),
("Danielius Spijker", "553123321" , "123 penny lane", "0435"),
("Rodina Aleppo", "166435321" , "123 penny lane", "0435"),
("Jaylyn Esser", "123144321" , "144 upsidedown place", "0435"),
("Stanislovas Ormond", "563123321" , "145 upsidedown place", "0435"),
("Jenny Jardine", "123167521" , "146 upsidedown place", "0435"),
("Perig Ivers", "123566321" , "147 upsidedown place", "0435"),
("Fausta Szabó", "166123321" , "145 upsidedown place", "0435"),
("Aran Spannagel", "157123321" , "251 flower st", "0435"),
("Håkon Schirmer", "124123321" , "252 flower st", "0435"),
("Padmavati Acquati", "553123321" , "253 flower st", "0435"),
("Renáta Sharma", "123154321" , "254 flower st", "0435"),
("Alger Marín", "123123651" , "254 flower st", "0435"),
("Moisés De Vries", "123523321" , "255 flower st", "0435"),
("Elwood Antonsen", "123523321" , "822 garnet avenue", "0435"),
("Larkin Beattie", "123352515" , "823 garnet avenue", "0435"),
("Kriemhild Elder", "123352631" , "824 garnet avenue", "0435"),
("Anant De La Fontaine", "122373821" , "825 garnet avenue", "0435"),
("Sparrow Walsh", "137263521" , "826 garnet avenue", "0435"),
("Eugenia De Kloet", "224332154" , "827 garnet avenue", "0435"),
("Gustave Gosselin", "123147245" , "828 garnet avenue", "0435"),

("Bat-Erdene Tessaro", "121123321" , "961 jump street", "0436"),
("Missy Kolijn", "123123325" , "962 jump street", "0436"),
("Altwidus Johnson", "123453321" , "963 jump street", "0436"),
("Xochipilli Botterill", "523123321" , "964 jump street", "0436"),
("Emese Größel", "123123352" , "965 jump street", "0436"),
("Henrikki Gynt", "123123241" , "966 jump street", "0436"),
("Alexandru Gaertner", "125523321" , "967 jump street", "0436"),
("Zeno Daniau", "122452241" , "002 texas avenue", "0436"),
("Ahriman Couch", "125153321" , "003 texas avenue", "0436"),
("Enrichetta Bakhuizen", "456223321" , "001 texas avenue", "0436"),
("Ferdi Ricchetti", "123145641" , "002 texas avenue", "0436"),
("Tecla Gage", "122486721" , "004 texas avenue", "0436"),
("Áki Reier", "867723321" , "005 texas avenue", "0436"),
("Radana Capello", "876123321" , "006 texas avenue", "0436"),
("Trajan Aiello", "123125621" , "007 texas avenue", "0436"),
("Hipólito Chowdhury", "723123321" , "008 texas avenue", "0436"),
("Dinesh Antonini", "923123321" , "674 tidus drive", "0436"),
("Hersilia Rose", "967123321" , "674 tidus drive", "0436"),
("Marlene Zlatkov", "973123321" , "671 tidus drive", "0436"),
("Burhan al-Din Koppel", "9753123321" , "684 tidus drive", "0436"),
("Faɗimatu McCormick", "193123321" , "675 tidus drive", "0436"),
("Siem Shirazi", "976123321" , "671 tidus drive", "0436"),
("Arnbjǫrg Zhao", "973123321" , "673 tidus drive", "0436"),
("Catharina Boon", "193123321" , "624 tidus drive", "0436"),
("Theano Almeida", "693123321" , "634 tidus drive", "0436"),

("Helen Villeneuve", "623123321" , "771 yuna street", "0199"),
("Yeong-Su Quinn", "123723321" , "772 yuna street", "0199"),
("Shelly Pavlovsky", "963123321" , "773 yuna street", "0199"),
("Khnum-Khufu Serizawa", "154123321" , "774 yuna street", "0199"),
("Rochus Tunison", "123123693" , "775 yuna street", "0199"),
("Coraline Joshi", "497123321" , "776 yuna street", "0199"),
("Cailean Soucy", "947723321" , "451 waka avenue", "0199"),
("Christopher Haanraads", "976761233" , "452 waka avenue", "0199"),
("Edda Dùbhghlas", "178123321" , "453 waka avenue", "0199"),
("Goda Uehara", "123123821" , "453 waka avenue", "0199"),
("Katla Hannigan", "123723321" , "454 waka avenue", "0199"),
("Nadir McKendrick", "724323321" , "455 waka avenue", "0199"),
("Wulfruna Swift", "773123643" , "791 lulu lane", "0199"),
("Norbert Hofer", "127723321" , "791 lulu lane", "0199"),
("Maja Scarpa", "123123721" , "792 lulu lane", "0199"),
("Rômulo Lacy", "312763721" , "792 lulu lane", "0199"),
("Henda Sonnen", "131923321" , "793 lulu lane", "0199"),
("Abdur Rahman Pasternak", "121293321" , "794 lulu lane", "0199"),
("Kistiñe Bader", "167123321" , "795 lulu lane", "0199"),
("Solvig Reier", "123733921" , "991 auron road", "0199"),
("Khayrat Oakley", "716212933" , "992 auron road", "0199"),
("Katayun Wiśniewski", "144323321" , "993 auron road", "0199"),
("Theodore Frank", "856856321" , "994 auron road", "0199"),
("Akamu Hsieh", "835685321" , "995 auron road", "0199"),
("Anamaria Killough", "935623321" , "997 auron road", "0199");

insert into Purchase values

(1023, "bread"),
(1023, "eggs"),
(1023, "ham"),
(1023, "beef"),
(1023, "chicken"),
(1023, "squash"),
(1023, "lettuce"),
(1023, "tomato"),
(1023, "milk"),
(1023, "cheese"),

(1024, "bread"),
(1024, "eggs"),
(1024, "ham"),
(1024, "beef"),
(1024, "chicken"),
(1024, "pumkin"),
(1024, "lettuce"),
(1024, "tomato"),
(1024, "milk"),
(1024, "cheese"),

(1025, "bread"),
(1025, "eggs"),
(1025, "bacon"),
(1025, "beef"),
(1025, "chicken"),
(1025, "squash"),
(1025, "lettuce"),
(1025, "tomato"),
(1025, "milk"),
(1025, "cheese"),

(1026, "cauliflower"),
(1026, "eggs"),
(1026, "ham"),
(1026, "beef"),
(1026, "chicken"),
(1026, "squash"),
(1026, "lettuce"),
(1026, "tomato"),
(1026, "milk"),
(1026, "cheese"),

(1011, "cauliflower"),
(1011, "eggs"),
(1011, "ham"),
(1011, "beef"),
(1011, "chicken"),
(1011, "squash"),
(1011, "lettuce"),
(1011, "tomato"),
(1011, "milk"),

(1012, "ham"),
(1012, "beef"),
(1012, "chicken"),
(1012, "squash"),
(1012, "lettuce"),

(1021, "eggs"),
(1021, "bacon"),
(1021, "beef"),
(1021, "chicken"),
(1021, "squash"),
(1021, "lettuce"),
(1021, "tomato"),
(1021, "milk"),
(1021, "cheese"),

(1031, "chicken"),
(1031, "squash"),
(1031, "lettuce"),
(1031, "tomato"),

(2021, "eggs"),
(2021, "bacon"),
(2021, "beef"),
(2021, "chicken"),
(2021, "squash"),
(2021, "lettuce"),
(2021, "tomato"),
(2021, "milk"),
(2021, "cheese"),

(4021, "beef"),
(4021, "chicken"),
(4021, "squash"),
(4021, "lettuce"),
(4021, "tomato"),

(2221, "eggs"),
(2221, "bacon"),
(2221, "beef"),
(2221, "chicken"),
(2221, "squash"),
(2221, "lettuce"),
(2221, "tomato"),
(2221, "milk"),
(2221, "cheese"),

(2222, "beef"),
(2222, "chicken"),
(2222, "squash"),
(2222, "lettuce"),
(2222, "tomato"),

(2421, "bacon"),
(2421, "beef"),
(2421, "chicken"

(3221, "squash"),
(3221, "lettuce"),
(3221, "tomato"),
(3221, "milk"),
(3221, "cheese"),

(2621, "beef"),
(2621, "chicken"),
(2621, "squash"),

(5221, "eggs"),
(5221, "bacon"),
(5221, "beef"),
(5221, "chicken"),
(5221, "squash"),

(8011, "chicken"),
(8011, "squash"),
(8011, "lettuce"),
(9011, "tomato"),
(9011, "milk"),

(9221, "lettuce"),
(9221, "tomato"),

(9025, "eggs"),
(9025, "bacon"),
(9025, "beef"),
(9025, "chicken"),
(9025, "squash"),
(9025, "lettuce"),
(9025, "tomato"),
(9025, "milk"),
(9025, "cheese"),

(6025, "squash"),
(6025, "lettuce"),
(6025, "tomato"),
(6025, "milk");

