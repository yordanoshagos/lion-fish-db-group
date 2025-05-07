create schema malnutrition;
create table malnutrition.child_progress(
progress_id VARCHR(10) primary key,
child_id VARCHAR(10) references malnutrition.progress_table(child_id),
current_weight_in_kg numeric not null,
current_height_in_cm numeric  not null,
per_day_number_of_meals INT not null check (per_day_number_of_meals>=0),
date_of_record DATE,
);
insert into 
malnutrition.child_progress(progress_id,child_id,current_weight_in_kg,current_height_in_cm,per_day_number_of_meals,date_of_record);
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
select*from malnutrition.child_progress;
select COUNT (*) 
from (
select child_id,
MIN(current_weight_in_kg/POWER(current_height_in_cm/100.0,2) as maximum_bmi,
MAX(current_weight_in_kg/POWER(current_height_in_cm/100.0,2) as maximum_bmi;
from malnutrition.child_progress
group by child_id as