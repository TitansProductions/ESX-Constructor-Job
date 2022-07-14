INSERT INTO `jobs` (name, label) VALUES
	('builder', 'Construction')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('builder',0,'worker','	Worker',0,'{}','{}'),
	('builder',1,'supervisor','Supervisor',0,'{}','{}'),
	('builder',2,'contractor','Contractor',0,'{}','{}')
;


INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('jackhammer', 'Jackhammer', 1, 0, 1),
	('hammer', 'Hammer', 2, 0, 1),
	('electricwelder', 'Electric Welder', 1, 0, 1)
;