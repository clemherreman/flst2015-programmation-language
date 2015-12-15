
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;
DROP TABLE IF EXISTS person;
CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);
INSERT INTO `pet` VALUES (0,'Godzilla','Dinosaur',115,1);
INSERT INTO `pet` VALUES (1,'Milou','Chien',8,0);
INSERT INTO `pet` VALUES (2,'Pupuce','Chat',21,1);
INSERT INTO `pet` VALUES (3,'Pepere','Chat',3,0);
CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);
INSERT INTO `person_pet` VALUES (0,0);
INSERT INTO `person_pet` VALUES (1,2);
INSERT INTO `person_pet` VALUES (1,3);
CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);
INSERT INTO `person` VALUES (0,'Giselle','Bonvoisin',78);
INSERT INTO `person` VALUES (1,'Jean-Pierre','Martin',72);

