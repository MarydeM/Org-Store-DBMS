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
	Name varchar(50) not null,
	SSN varchar(9) not null, 
	Address varchar(50), 
	SID varchar(4) NOT NULL,
	
	primary key(SSN), 
	FOREIGN KEY(SID) REFERENCES STORE(SID)
);

insert into EMPLOYEE(
(Nikomachos Ó Riain, 139506321 , 123 penny lane, 0231),
(Geneviève Tafani, 129243521 , 124 penny lane, 0231),
(Manana Lémieux, 241567321 , 125 penny lane, 0231),
(Heidrun Alexandersen, 123512321 , 126 penny lane), 0231,
(Warin Davids, 123126341 , 127 penny lane, 0231),
(Chidike Noel, 123167481 , 121 terr drive, 0231),
(Cruz Mitchell, 123465321 , 122 terry drive, 0231),
(Goibniu Costa, 122434321 , 123 terry drive, 0231),
(Abidemi Ahmad, 136433521 , 124 terry drive, 0231),
(Hannas Leigh, 153427581 , 125 terry drive, 0231),
(Konstadina Rana, 232332134 , 223 stu street, 0231),
(Amarachi Brook, 223333421 , 223 stu street, 0231),
(Vergilius Chavarría, 264373321 , 223 stu street, 0231),
(Maelgwn Abbatantuono, 234623321 , 223 stu street, 0231),
(Magnus Dietrich, 123122345 , 223 stu street, 0231),
(Hasse Schultes, 343123334 , 131 penny lane, 0231),
(Herbert Van Breda,423123321 , 132 penny lane, 0231),
(Magdalena Ó Conghalaigh,323123321 , 133 penny lane, 0231),
(Louka Michalak,123123323 , 134 penny lane, 0231),
(Julyan Armstrong, 223123321 , 135 penny lane, 0231),
(Breeshey Hanssen, 623123321 , 136 penny lane, 0231),
(Rishi Irving, 344533214 , 121 howard lane, 0231),
(Herb Ó hÍcidhe, 876823321 , 122 howard lane, 0231),
(Naftali Martín, 543323321 , 123 howard lane, 0231),
(Pərviz Losnedahl, 344123321 , 124 howard lane, 0231),
(Souleymane Sneijers, 453123321 , 125 howard lane, 0231),

(Tryphosa Eady, 689723321 , 123 jenny lane, 0232),
(Summanus McWilliam, 883123321 , 124 jenny lane, 0232),
(Dubaku Durand, 123166321 , 125 jenny lane, 0232),
(Madelief Quijada, 183123321 , 126 jenny lane, 0232),
(Klara Feldt, 123127721 , 127 jenny lane, 0232),
(Gréta Schuchert, 128123321 , 141 penny lane, 0232),
(Gervase Neville, 127123321 , 142 penny lane, 0232),
(Pauli Sheach, 123158321 , 143 penny lane, 0232),
(Thibaut McKendrick, 883123321 , 144 penny lane, 0232),
(Elmārs Ganza, 127127831 , 145 penny lane, 0232),
(Þórfríðr Patel, 178123321 , 123 fenny lane, 0232),
(Beli Mathers, 123873321 , 141 jenny lane, 0232),
(Anamaria Matijević, 723123321 , 142 jenny lane, 0232),
(Jessika Parodi, 123173321 , 143 jenny lane, 0232),
(Sancheriv Böhmer, 178123321 , 144 jenny lane, 0232),
(Günay Smolak, 123123921 , 145 jenny lane, 0232),
(Nicander Uggeri, 126823321 , 131 terry drive, 0232),
(Avril Heinrichs, 123423321 , 132 terry drive, 0232),
(Janvier Ó Fearghail, 623123321 , 133 terry drive, 0232),
(Ajith Vinković, 312332174 , 134 terry drive, 0232),
(Usha Volk, 723123321 , 135 terry drive, 0232),
(Sara Alvarsson, 623123321 , 121 flower st, 0232),
(Fabia Moloney, 923123321 , 122 flower st, 0232),
(Loukios Leifsson, 773123321 , 123 flower st, 0232),
(Timéo Marangoz, 963123321 , 124 flower st, 0232),

(Marikit Traylor, 973123321 , 131 flower st, 0435),
(Wieland Aston, 983123321 , 131 flower st, 0435),
(Olavi Berardi, 673123321 , 131 flower st, 0435),
(Juliāna Romano, 777123321 , 132 flower st, 0435),
(Dorinel François, 873123321 , 132 flower st, 0435),
(Danielius Spijker, 553123321 , 123 penny lane, 0435),
(Rodina Aleppo, 166435321 , 123 penny lane, 0435),
(Jaylyn Esser, 123144321 , 144 upsidedown place, 0435),
(Stanislovas Ormond, 563123321 , 145 upsidedown place, 0435),
(Jenny Jardine, 123167521 , 146 upsidedown place, 0435),
(Perig Ivers, 123566321 , 147 upsidedown place, 0435),
(Fausta Szabó, 166123321 , 145 upsidedown place, 0435),
(Aran Spannagel, 157123321 , 251 flower st, 0435),
(Håkon Schirmer, 124123321 , 252 flower st, 0435),
(Padmavati Acquati, 553123321 , 253 flower st, 0435),
(Renáta Sharma, 123154321 , 254 flower st, 0435),
(Alger Marín, 123123651 , 254 flower st, 0435),
(Moisés De Vries, 123523321 , 255 flower st, 0435),
(Elwood Antonsen, 123523321 , 822 garnet avenue, 0435),
(Larkin Beattie, 123352515 , 823 garnet avenue, 0435),
(Kriemhild Elder, 123352631 , 824 garnet avenue, 0435),
(Anant De La Fontaine, 122373821 , 825 garnet avenue, 0435),
(Sparrow Walsh, 137263521 , 826 garnet avenue, 0435),
(Eugenia De Kloet, 224332154 , 827 garnet avenue, 0435),
(Gustave Gosselin, 123147245 , 828 garnet avenue, 0435),

(Bat-Erdene Tessaro, 121123321 , 961 jump street, 0436),
(Missy Kolijn, 123123325 , 962 jump street, 0436),
(Altwidus Johnson, 123453321 , 963 jump street, 0436),
(Xochipilli Botterill, 523123321 , 964 jump street, 0436),
(Emese Größel, 123123352 , 965 jump street, 0436),
(Henrikki Gynt, 123123241 , 966 jump street, 0436),
(Alexandru Gaertner, 125523321 , 967 jump street, 0436),
(Zeno Daniau, 122452241 , 002 texas avenue, 0436),
(Ahriman Couch, 125153321 , 003 texas avenue, 0436),
(Enrichetta Bakhuizen, 456223321 , 001 texas avenue, 0436),
(Ferdi Ricchetti, 123145641 , 002 texas avenue, 0436),
(Tecla Gage, 122486721 , 004 texas avenue, 0436),
(Áki Reier, 867723321 , 005 texas avenue, 0436),
(Radana Capello, 876123321 , 006 texas avenue, 0436),
(Trajan Aiello, 123125621 , 007 texas avenue, 0436),
(Hipólito Chowdhury, 723123321 , 008 texas avenue, 0436),
(Dinesh Antonini, 923123321 , 674 tidus drive, 0436),
(Hersilia Rose, 967123321 , 674 tidus drive, 0436),
(Marlene Zlatkov, 973123321 , 671 tidus drive, 0436),
(Burhan al-Din Koppel, 9753123321 , 684 tidus drive, 0436),
(Faɗimatu McCormick, 193123321 , 675 tidus drive, 0436),
(Siem Shirazi, 976123321 , 671 tidus drive, 0436),
(Arnbjǫrg Zhao, 973123321 , 673 tidus drive, 0436),
(Catharina Boon, 193123321 , 624 tidus drive, 0436),
(Theano Almeida, 693123321 , 634 tidus drive, 0436),

(Helen Villeneuve, 623123321 , 771 yuna street, 0199),
(Yeong-Su Quinn, 123723321 , 772 yuna street, 0199),
(Shelly Pavlovsky, 963123321 , 773 yuna street, 0199),
(Khnum-Khufu Serizawa, 154123321 , 774 yuna street, 0199),
(Rochus Tunison, 123123693 , 775 yuna street, 0199),
(Coraline Joshi, 497123321 , 776 yuna street, 0199),
(Cailean Soucy, 947723321 , 451 waka avenue, 0199),
(Christopher Haanraads, 976761233 , 452 waka avenue, 0199),
(Edda Dùbhghlas, 178123321 , 453 waka avenue, 0199),
(Goda Uehara, 123123821 , 453 waka avenue, 0199),
(Katla Hannigan, 123723321 , 454 waka avenue, 0199),
(Nadir McKendrick, 724323321 , 455 waka avenue, 0199),
(Wulfruna Swift, 773123643 , 791 lulu lane, 0199),
(Norbert Hofer, 127723321 , 791 lulu lane, 0199),
(Maja Scarpa, 123123721 , 792 lulu lane, 0199),
(Rômulo Lacy, 312763721 , 792 lulu lane, 0199),
(Henda Sonnen, 131923321 , 793 lulu lane, 0199),
(Abdur Rahman Pasternak, 121293321 , 794 lulu lane, 0199),
(Kistiñe Bader, 167123321 , 795 lulu lane, 0199),
(Solvig Reier, 123733921 , 991 auron road, 0199),
(Khayrat Oakley, 716212933 , 992 auron road), 0199,
(Katayun Wiśniewski, 144323321 , 993 auron road, 0199),
(Theodore Frank, 856856321 , 994 auron road, 0199),
(Akamu Hsieh, 835685321 , 995 auron road, 0199),
(Anamaria Killough, 935623321 , 997 auron road, 0199)

);
-- ----------------------------------------------------------------------------------------
-- RELATIONS

