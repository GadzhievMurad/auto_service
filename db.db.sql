BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "services" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"price"	REAL NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ord" (
	"id"	INTEGER NOT NULL,
	"id_customer"	INTEGER NOT NULL,
	"id_services"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_services") REFERENCES "services"("id"),
	FOREIGN KEY("id_customer") REFERENCES "customer"("id")
);
CREATE TABLE IF NOT EXISTS "auto" (
	"id"	INTEGER NOT NULL,
	"model"	TEXT NOT NULL,
	"brand"	TEXT NOT NULL,
	"color"	TEXT NOT NULL,
	"year_build"	TEXT NOT NULL,
	"number"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "customer" (
	"id"	INTEGER NOT NULL,
	"surname"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"num_phone"	INTEGER NOT NULL,
	"id_auto"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "services" VALUES (1,'Диагностика',5000.0);
INSERT INTO "services" VALUES (2,'Ремонт двигателя',8000.0);
INSERT INTO "services" VALUES (3,'Кузовной ремонт',4000.0);
INSERT INTO "services" VALUES (4,'Шиномонтаж',2000.0);
INSERT INTO "services" VALUES (5,'Тех. обслуживание',3000.0);
INSERT INTO "services" VALUES (6,'Замена масла',800.0);
INSERT INTO "services" VALUES (7,'Диагностика',5000.0);
INSERT INTO "services" VALUES (8,'Ремонт двигателя',8000.0);
INSERT INTO "services" VALUES (9,'Кузовной ремонт',4000.0);
INSERT INTO "services" VALUES (10,'Шиномонтаж',2000.0);
INSERT INTO "services" VALUES (11,'Тех. обслуживание',3000.0);
INSERT INTO "services" VALUES (12,'Замена масла',800.0);
INSERT INTO "services" VALUES (13,'Диагностика',5000.0);
INSERT INTO "services" VALUES (14,'Ремонт двигателя',8000.0);
INSERT INTO "services" VALUES (15,'Кузовной ремонт',4000.0);
INSERT INTO "services" VALUES (16,'Шиномонтаж',2000.0);
INSERT INTO "services" VALUES (17,'Тех. обслуживание',3000.0);
INSERT INTO "services" VALUES (18,'Замена масла',800.0);
INSERT INTO "services" VALUES (19,'Диагностика',5000.0);
INSERT INTO "services" VALUES (20,'Ремонт двигателя',8000.0);
INSERT INTO "services" VALUES (21,'Кузовной ремонт',4000.0);
INSERT INTO "services" VALUES (22,'Шиномонтаж',2000.0);
INSERT INTO "services" VALUES (23,'Тех. обслуживание',3000.0);
INSERT INTO "services" VALUES (24,'Замена масла',800.0);
INSERT INTO "ord" VALUES (1,1,1);
INSERT INTO "ord" VALUES (2,2,2);
INSERT INTO "ord" VALUES (3,3,3);
INSERT INTO "ord" VALUES (4,4,4);
INSERT INTO "ord" VALUES (5,5,2);
INSERT INTO "ord" VALUES (6,6,5);
INSERT INTO "ord" VALUES (7,7,1);
INSERT INTO "ord" VALUES (8,8,6);
INSERT INTO "ord" VALUES (9,9,2);
INSERT INTO "ord" VALUES (10,10,1);
INSERT INTO "ord" VALUES (11,11,3);
INSERT INTO "ord" VALUES (12,12,2);
INSERT INTO "ord" VALUES (13,13,1);
INSERT INTO "ord" VALUES (14,14,2);
INSERT INTO "ord" VALUES (15,15,6);
INSERT INTO "ord" VALUES (16,1,1);
INSERT INTO "ord" VALUES (17,2,2);
INSERT INTO "ord" VALUES (18,3,3);
INSERT INTO "ord" VALUES (19,4,4);
INSERT INTO "ord" VALUES (20,5,2);
INSERT INTO "ord" VALUES (21,6,5);
INSERT INTO "ord" VALUES (22,7,1);
INSERT INTO "ord" VALUES (23,8,6);
INSERT INTO "ord" VALUES (24,9,2);
INSERT INTO "ord" VALUES (25,10,1);
INSERT INTO "ord" VALUES (26,11,3);
INSERT INTO "ord" VALUES (27,12,2);
INSERT INTO "ord" VALUES (28,13,1);
INSERT INTO "ord" VALUES (29,14,2);
INSERT INTO "ord" VALUES (30,15,6);
INSERT INTO "ord" VALUES (31,1,1);
INSERT INTO "ord" VALUES (32,2,2);
INSERT INTO "ord" VALUES (33,3,3);
INSERT INTO "ord" VALUES (34,4,4);
INSERT INTO "ord" VALUES (35,5,2);
INSERT INTO "ord" VALUES (36,6,5);
INSERT INTO "ord" VALUES (37,7,1);
INSERT INTO "ord" VALUES (38,8,6);
INSERT INTO "ord" VALUES (39,9,2);
INSERT INTO "ord" VALUES (40,10,1);
INSERT INTO "ord" VALUES (41,11,3);
INSERT INTO "ord" VALUES (42,12,2);
INSERT INTO "ord" VALUES (43,13,1);
INSERT INTO "ord" VALUES (44,14,2);
INSERT INTO "ord" VALUES (45,15,6);
INSERT INTO "ord" VALUES (46,1,1);
INSERT INTO "ord" VALUES (47,2,2);
INSERT INTO "ord" VALUES (48,3,3);
INSERT INTO "ord" VALUES (49,4,4);
INSERT INTO "ord" VALUES (50,5,2);
INSERT INTO "ord" VALUES (51,6,5);
INSERT INTO "ord" VALUES (52,7,1);
INSERT INTO "ord" VALUES (53,8,6);
INSERT INTO "ord" VALUES (54,9,2);
INSERT INTO "ord" VALUES (55,10,1);
INSERT INTO "ord" VALUES (56,11,3);
INSERT INTO "ord" VALUES (57,12,2);
INSERT INTO "ord" VALUES (58,13,1);
INSERT INTO "ord" VALUES (59,14,2);
INSERT INTO "ord" VALUES (60,15,6);
INSERT INTO "auto" VALUES (1,'Lada','Granta','Белый','2020','па564п');
INSERT INTO "auto" VALUES (2,'BMW','X5','Черный','2021','ав564р');
INSERT INTO "auto" VALUES (3,'Toyota','Prius','Красный','2018','ар789р');
INSERT INTO "auto" VALUES (4,'Lada','Granta','Черный','2016','ар456р');
INSERT INTO "auto" VALUES (5,'Toyota','Prius','Белый','2022','не565н');
INSERT INTO "auto" VALUES (6,'BMW','X5','Белый','2018','он546о');
INSERT INTO "auto" VALUES (7,'Lada','Kalina','Черный','2021','но564о');
INSERT INTO "auto" VALUES (8,'Lada','Нива','Синий','2020','но554о');
INSERT INTO "auto" VALUES (9,'Toyota','Prius','Белый','2000','рн464р');
INSERT INTO "auto" VALUES (10,'Toyota','Avensis','Серый','2005','ое455о');
INSERT INTO "auto" VALUES (11,'BMW','Couper','Белый','2008','но546о');
INSERT INTO "auto" VALUES (12,'Lada','Granta','Синий','2020','ре565о');
INSERT INTO "auto" VALUES (13,'Lada','Kalina','Белый','2010','ав454р');
INSERT INTO "auto" VALUES (14,'BMW','Couper','Черный','2018','кр564р');
INSERT INTO "auto" VALUES (15,'Lada','Нива','Черный','2020','ер564р');
INSERT INTO "customer" VALUES (1,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (2,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (3,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (4,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (5,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (6,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (7,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (8,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (9,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (10,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (11,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (12,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (13,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (14,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (15,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (16,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (17,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (18,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (19,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (20,'Малова','Оксана',88953354845,NULL);
INSERT INTO "customer" VALUES (21,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (22,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (23,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (24,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (25,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (26,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (27,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (28,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (29,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (30,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (31,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (32,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (33,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (34,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (35,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (36,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (37,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (38,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (39,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (40,'Малова','Оксана',88953354845,NULL);
INSERT INTO "customer" VALUES (41,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (42,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (43,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (44,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (45,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (46,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (47,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (48,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (49,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (50,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (51,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (52,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (53,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (54,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (55,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (56,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (57,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (58,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (59,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (60,'Малова','Оксана',88953354845,NULL);
INSERT INTO "customer" VALUES (61,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (62,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (63,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (64,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (65,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (66,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (67,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (68,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (69,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (70,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (71,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (72,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (73,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (74,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (75,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (76,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (77,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (78,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (79,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (80,'Малова','Оксана',88953354845,NULL);
INSERT INTO "customer" VALUES (81,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (82,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (83,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (84,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (85,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (86,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (87,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (88,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (89,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (90,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (91,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (92,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (93,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (94,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (95,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (96,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (97,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (98,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (99,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (100,'Малова','Оксана',88953354845,NULL);
INSERT INTO "customer" VALUES (101,'Васильев','Иван',89536688594,1);
INSERT INTO "customer" VALUES (102,'Иванов','Роман',85369877584,8);
INSERT INTO "customer" VALUES (103,'Горелов','Игнат',58964558774,6);
INSERT INTO "customer" VALUES (104,'Иванова','Валерия',89536688474,13);
INSERT INTO "customer" VALUES (105,'Мирова','Юлия',89536647785,4);
INSERT INTO "customer" VALUES (106,'Пирожков','Антон',89534478512,2);
INSERT INTO "customer" VALUES (107,'Морозов','Игорь',89536687752,12);
INSERT INTO "customer" VALUES (108,'Ибрагимов','Марат',89536478895,4);
INSERT INTO "customer" VALUES (109,'Николаев','Олег',89536844471,11);
INSERT INTO "customer" VALUES (110,'Сеченов','Константин',89536647851,5);
INSERT INTO "customer" VALUES (111,'Муравьева','Оксана',89536874123,14);
INSERT INTO "customer" VALUES (112,'Прошин','Владимир',89536674298,10);
INSERT INTO "customer" VALUES (113,'Морошкин','Дмитрий',89536425589,5);
INSERT INTO "customer" VALUES (114,'Иванов','Александр',89535532147,15);
INSERT INTO "customer" VALUES (115,'Ефремов','Юрий',89536478152,7);
INSERT INTO "customer" VALUES (116,'Капранов','Максим',89534856612,NULL);
INSERT INTO "customer" VALUES (117,'Кошкин','Иван',89534784121,NULL);
INSERT INTO "customer" VALUES (118,'Николаев','Дмитрий',89530114554,NULL);
INSERT INTO "customer" VALUES (119,'Мешков','Олег',89503212004,NULL);
INSERT INTO "customer" VALUES (120,'Малова','Оксана',88953354845,NULL);
COMMIT;
