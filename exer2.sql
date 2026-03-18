-- Atividade 2 18/03/26 
CREATE DATABASE funcionariosdb;
CREATE TABLE employee(
	id 					INT PRIMARY KEY AUTO_INCREMENT,
    name				VARCHAR(100) NOT NULL,
    birth_date			DATE NOT NULL,
    baseSalary			DECIMAL NOT NULL,
    currentSalary		DECIMAL NOT NULL
);

CREATE TABLE monthsEmployeeBonus(
	id 					INT PRIMARY KEY AUTO_INCREMENT,
    employeeId			INT NOT NULL,
    bonusDate			DATE NOT NULL,
    bonusPercentual		INT NOT NULL,
    FOREIGN KEY (employeeId) REFERENCES employee(id)
);

DELIMITER $$
CREATE FUNCTION calcCurrentSalary(baseSalary DECIMAL(20,2),  bonusPercentual INT)
RETURNS INT DETERMINISTIC
	BEGIN
		DECLARE currentSalary DECIMAL(20, 2);
		SET currentSalary = ROUND(baseSalary + (baseSalary / 100 * bonusPercentual));
	RETURN currentSalary;
END $$
a
DELIMITER ;
