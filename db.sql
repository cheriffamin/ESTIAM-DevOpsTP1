CREATE USER 'amine'@'localhost' IDENTIFIED BY 'amine';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON mydb.* TO 'amine'@'localhost';
USE mydb;
CREATE TABLE Compteur(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
position INT(20));













