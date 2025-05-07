create table malnutrition.parent_table(
parent_id VARCHAR (10) primary key,
name VARCHAR(50) not null,
contact_address VARCHAR(15) not null,
adress VARCHAR(250) not null
);
insert into malnutrition.parent_table(parent_id,name,contact_address,adress)
values ('P01','Hannah','+253732516072','Kilimani'),
('P02','Berhe','+253789065421','Kitisuru'),
('P03','Sara','+253713943452','Karen'),
('P04','Karen','+253726789011','Karen'),
('P05','Hewan','+253765123490','Kilimani'),
('P06','Kidus','+253763908212','Kitsu'),
('P07','Steve','+253709877901','Kilimani'),
('P08','Marion','+253723780943','Kilimani'),
('P09','Yordanos','+253732516072','Kitsu'),
('P10','Julie','+253769021567','Karen'),
('P11','Judy','+253742578901','Kilimani'),
('P12','Jacky','+253734265100','Kitsu'),
('P13','Haile','+253721345890','Karen'),
('P14','Brain','+253756709129','Kilimani'),
('P15','Carol','+253720987134','Kilimani');
select * from malnutrition.parent_table