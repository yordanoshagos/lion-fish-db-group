create table malnutrition.children_table(
	child_id VARCHAR(10) primary key,
	name VARCHAR(50) not null,
	gender VARCHAR(15) not null,
	dob DATE not null,
	birth_weight_in_kg FLOAT, 
	gestational_period_in_month INT
);

select * from malnutrition.children_table;


insert into malnutrition.children_table(child_id, name, gender, dob, birth_weight_in_kg, gestational_period_in_month)
values 
('C001','Hellen', 'female', '2022-05-14', 2.0, 9),
('C002','Mahder', 'female', '2024-12-27', 2.7, 8),
('C003','Meron', 'female', '2020-12-15', 2.7, 7),
('C004','Hosaena', 'male', '2023-09-17', 2.8, 8),
('C005','Nahom', 'male', '2021-05-22', 2.1, 9),
('C006','Feven', 'female', '2020-10-29', 2.5, 7),
('C007','Mahlet', 'female', '2024-11-26', 2.6, 9),
('C008','Henok', 'male', '2024-07-18', 2.8, 7),
('C009','Bereket', 'male', '2024-09-23', 2.3, 8),
('C010','Hannah', 'female', '2023-02-19', 2.7, 9),
('C011','Sari', 'female', '2024-02-25', 2.2, 8),
('C012','Brook', 'male', '2023-12-27', 1.7, 7),
('C013','Menbere', 'female', '2020-03-12', 2.9, 9),
('C014','Hewan', 'female', '2024-01-17', 2, 7),
('C015','Abel', 'female', '2018-07-15', 2.5, 7);

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

SELECT COUNT(DISTINCT parent_id)
FROM malnutrition.parent_table
WHERE name ILIKE 'K%';

create table malnutrition.medical_status(
medical_id VARCHAR(10) primary key,
child_id VARCHAR(10) references malnutrition.children_table,
type_of_disease VARCHAR(100) not null,
date Date not Null
);
insert into malnutrition.medical_status(medical_id,child_id,type_of_disease,date)
values
('M001','C001','Malaria','2021-03-11'),
('M002','C002','TB','2021-11-16'),
('M003','C003','Corona','2022-03-17'),
('M004','C011','Malaria','2021-10-18'),
('M005','C005','Typhoid','2021-06-22'),
('M006','C006','Phnemonia','2022-04-27'),
('M007','C002','Malaria','2021-01-04'),
('M008','C008','Cholera','2023-03-28'),
('M009','C009','HIV/AIDS','2021-01-22'),
('M010','C010','Malaria','2021-11-05'),
('M011','C011','Phnemonia','2022-09-20'),
('M012','C012','Malaria','2021-03-02'),
('M013','C010','TB','2022-04-28'),
('M014','C014','Cholera','2021-11-27'),
('M015','C015','Corona','2021-10-06');
 select * from malnutrition.medical_status
 
 
create table malnutrition.relationship_table(
	relation_id VARCHAR(10) primary key,
	child_id VARCHAR(10) references malnutrition.children_table(child_id),
	parent_id VARCHAR(10) references malnutrition.parent_table(parent_id),
	relationship_to_child VARCHAR(50) not null
);
insert into malnutrition.relationship_table(relation_id, child_id, parent_id, relationship_to_child)
values
--('R001','C001','P01','father'),
--('R002','C002','P02','mother'),
--('R003','C003','P03','mother'),
--('R004','C004','P04','father'),
--('R005','C005','P05','father'),
--('R006','C006','P06','step-mother'),
--('R007','C007','P07','mother'),
--('R008','C008','P08','grand-mother'),
--('R009','C009','P09','father'),
--('R010','C010','P10','mother'),
--('R011','C011','P11','father'),
--('R012','C012','P12','guardian'),
--('R013','C013','P13','mother'),
--('R014','C014','P14','father'),
('R016','C015','P11','mother');
select * from malnutrition.relationship_table

SELECT COUNT(*)
FROM malnutrition.relationship_table
GROUP BY child_id
HAVING COUNT(parent_id) > 1;
