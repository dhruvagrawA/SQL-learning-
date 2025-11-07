use tushar;
DELIMITER $$

CREATE PROCEDURE GetCustomers1()
BEGIN
	select * from sakila.actor;
END$$
DELIMITER ;

-- IN parameter
-- OUT parameter
-- INOUT parameter

DELIMITER //

CREATE PROCEDURE GetP2 ( IN eid int)
BEGIN
	SELECT *
 	FROM sakila.actor
	WHERE actor_id = eid;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetP3 ( IN eid int , out ename varchar(20) )
BEGIN
	SELECT first_name into ename 
 	FROM sakila.actor
	WHERE actor_id = eid;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE GetP4 ( INOUT var int )
BEGIN
	SELECT count(*) 
 	FROM sakila.actor
	WHERE actor_id < var and actor_id>2;
END //

DELIMITER ;














