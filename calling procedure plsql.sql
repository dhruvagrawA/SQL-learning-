call GetCustomers1();  -- procedure


select * from sakila.payment;

call GetCustomers1();

call GetP2(3);

call GetP3(5,@ename);

select @ename;

call GetP3(6,@ename);
select @ename;



set @var=9;
call GetP4(@var);
