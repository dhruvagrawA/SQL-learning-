use sakila;     
delimiter //

create procedure p7(in var int)
begin

	tushar: loop
	-- select actor_id from sakila.actor where actor_id<var
    set var=var+1;
    select * from actor where actor_id=var;
    
    if var=14 then
         leave tushar;                 -- calling in procedure plsql last sheet
    end if  ;   
    
end loop;
end //    
    
DELIMITER $$
-- procedure is created
CREATE PROCEDURE create_email_list (in eid int, out email_list TEXT )
BEGIN
	-- variable to access value from cursor to plsql
    DECLARE done BOOL DEFAULT false;
    DECLARE email_address VARCHAR(100) DEFAULT "";
    
    -- declare cursor for employee email
    DECLARE cur CURSOR FOR SELECT first_name FROM sakila.actor where
    actor_id<eid;
    
    -- handler to see cursor have all the elemnts
    DECLARE CONTINUE handler 
		for not found set done= true;
        
   -- open the cursor
   OPEN cur;
   
 SET email_list = ' ';
	
    process_email: LOOP
    
    -- cur will first row and we insert it into email_address variable
    FETCH cur INTO email_address;
    
    IF done = true THEN
		LEAVE process_email;
    END IF;
    
    -- concatenate the email into the emailist
    SET email_list = CONCAT(email_address,'-',email_list);
		
   END LOOP;
   
   -- close the cursor
   CLOSE cur;
   
END $$

DELIMITER ;   

-- u have to crate a procedure for declare a cursor whcih access the amount  
-- for paymnt_id<10 from saklia.paymnets table open a cursor fetch cursor value 
-- into the variable if amount is 5.99 then close the cursor
        
DROP PROCEDURE IF EXISTS create_payment;
DELIMITER $$

CREATE PROCEDURE create_payment (
OUT amount_list TEXT
)
BEGIN
DECLARE v_amount DECIMAL(5,2);
DECLARE done INT DEFAULT 0;

DECLARE cur CURSOR FOR
SELECT amount FROM sakila.payment WHERE payment_id < 10;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

-- initialize OUT param
SET amount_list = '';

OPEN cur;

read_loop: LOOP
   FETCH cur INTO v_amount;

    IF done = 1 THEN
		LEAVE read_loop;
    END IF;
    
    -- stop early if amount is 5.99
    if v_amount = 5.99 then
    leave read_loop;
    end if;
    
  end loop;
  
  close cur;

END $$	  

DELIMITER ;    
    



































