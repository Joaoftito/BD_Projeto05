CREATE DATABASE UserProjects

GO
USE UserProjects

CREATE TABLE Users (
id int IDENTITY(1, 1),
name_ varchar(45),
username varchar(45) UNIQUE,
password_ varchar(45) DEFAULT('123mudar'),
email varchar(45)
PRIMARY KEY(id)
)

CREATE TABLE Projects (
id int IDENTITY(10001, 1),
name_ varchar(45),
description_ varchar(45) NULL,
date_ date CHECK(date_ > '2014-09-01')
PRIMARY KEY(id)
)

CREATE TABLE Users_Has_Projects (
usersId int,
projectsId int
PRIMARY KEY(usersId, projectsId)
FOREIGN KEY(usersId) REFERENCES Users(id),
FOREIGN KEY(projectsId) REFERENCES Projects(id)
)

ALTER TABLE Users
ALTER COLUMN username varchar(10)

ALTER TABLE Users
ALTER COLUMN password_ varchar(8)

INSERT INTO Users (name_, username, email) VALUES
('Maria', 'Rh_maria', 'maria@empresa.com')

INSERT INTO Users (name_, username, password_, email) VALUES
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')

INSERT INTO Users (name_, username, email) VALUES
('Ana', 'Rh_ana', 'ana@empresa.com'),
('Clara', 'Ti_clara', 'clara@empresa.com')

INSERT INTO Users (name_, username, password_, email) VALUES
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

INSERT INTO Projects (name_, description_, date_) VALUES
('Re-folha', 'Refatoração das Folhas', '2014-09-05'),
('Manutenção', 'Manutencao PC', '2014-09-06')

INSERT INTO Projects (name_, date_) VALUES
('Auditoria', '2014-09-07')

INSERT INTO Users_has_projects VALUES
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)

UPDATE Projects
SET date_ = '2014-09-12'
WHERE id = 10002

UPDATE Users
SET username = 'Rh_cido'
WHERE id = 5

UPDATE Users
SET password_ = '888@*'
WHERE username = 'Rh_maria' AND password_ = '123mudar'

DELETE Users_has_projects
WHERE usersId = 2

select * from Users_has_projects