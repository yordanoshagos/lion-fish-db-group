create schema malnutrition;
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
create table malnutrition.progress_table(
progress_id VARCHAR(10) primary key,
child_id VARCHAR(10) references malnutrition.children_table(child_id),
current_weight_in_kg numeric not null,
current_height_in_cm numeric  not null,
per_day_number_of_meals INT not null check (per_day_number_of_meals>=0),
date_of_record DATE
);
insert into 
malnutrition.progress_table(progress_id,child_id,current_weight_in_kg,current_height_in_cm,per_day_number_of_meals,date_of_record)
values 
('PO01','C001',17.0,102.1,4,'2025-01-20'),
('P002','C002',13.7,103.2,2,'2025-02-22'),
('P003','C003',14.2,101.5,3,'2025-03-23'),
('P004','C004',12.6,104.3,4,'2025-04-24'),
('P005','C005',15.3,102.5,2,'2025-04-12'),
('P006','C006',13.2,105.1,4,'2025-05-20'),
('P007','C007',16.3,100.0,2,'2025-05-21'),
('P008','C008',11.7,92.1,3,'2025-06-22'),
('P009','C009',14.2,90.6,2,'2025-07-12'),
('P010','C010',11.5,88.2,4,'2025-08-13'),
('P011','C011',12.3,87.7,3,'2025-09-15'),
('P012','C012',16.2,82.6,4,'2025-10-17'),
('P013','C013',15.3,89.4,3,'2025-11-20'),
('P014','C014',14.2,91.6,4,'2025-10-19'),
('P015','C015',12.5,88.5,3,'2025-11-20');
select*from malnutrition.progress_table;
select COUNT (*) 
from (
select child_id,
MIN(current_weight_in_kg/POWER(current_height_in_cm/100.0,2)) AS maximum_bmi,
MAX(current_weight_in_kg/POWER(current_height_in_cm/100.0,2)) AS minimum_bmi
from malnutrition.progress_table
group by child_id) as bmi_compared
where maximum_bmi > minimum_bmi; 
UPDATE malnutrition.progress_table
SET current_weight_in_kg =
  CASE
    WHEN progress_id = 'PO01' THEN 19.5
    WHEN progress_id = 'P002' THEN 18.2
    WHEN progress_id = 'P003' THEN 22.7
    WHEN progress_id = 'P004' THEN 23.1
    WHEN progress_id = 'P005' THEN 22.8 
    WHEN progress_id = 'P006' THEN 20.7
    WHEN progress_id = 'P007' THEN 19.8
    WHEN progress_id = 'P008' THEN 18.2 
    WHEN progress_id = 'P009' THEN 17.7
    WHEN progress_id = 'P010' THEN 23.0
    WHEN progress_id = 'P011' THEN 25.8
    WHEN progress_id = 'P012' THEN 23.7
    WHEN progress_id = 'P013' THEN 25.8
    WHEN progress_id = 'P014' THEN 18.7
    WHEN progress_id = 'P015' THEN 19.0 
    ELSE current_weight_in_kg
  END;
select*from malnutrition.progress_table;










