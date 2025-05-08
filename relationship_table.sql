create table malnutrition.relationship_table(
	relation_id VARCHAR(10) primary key,
	child_id VARCHAR(10) references malnutrition.children_table(child_id),
	parent_id VARCHAR(10) references malnutrition.parent_table(parent_id),
	relationship_to_child VARCHAR(50) not null
);

insert into malnutrition.relationship_table(relation_id, child_id, parent_id, relationship_to_child)
values
('R001','C001','P001',father),
('R002','C002','P002',mother),
('R003','C003','P003',mother),
('R004','C004','P004',father),
('R005','C005','P005',father),
('R006','C006','P006',step-mother),
('R007','C007','P007',mother),
('R008','C008','P008',grand-mother),
('R009','C009','P009',father),
('R010','C010','P010',mother),
('R011','C011','P011',father),
('R012','C012','P012',guardian),
('R013','C013','P013',mother),
('R014','C014','P014',father),
('R015','C015','P015',mother);

select * from malnutrition.relationship_table