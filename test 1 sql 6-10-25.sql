-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Active', 'Inactive'))
);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, customer_name, status) VALUES
(1, 'Alice Johnson', 'Active'),
(2, 'Bob Smith', 'Active'),
(3, 'Carol White', 'Inactive'),
(4, 'David Lee', 'Active');



-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-01-15', 250.00),
(102, 2, '2025-01-20', 180.00),
(103, 1, '2025-02-10', 300.00),
(104, 4, '2025-02-12', 150.00);


select * from customers;
select * from orders;

select month(order_date), avg(total_amount) from orders
where year(order_date) = 2025 group by month(order_date) ;

select year(order_date), month(order_date), sum(total_amount) from orders
where year(order_date) = 2025 group by year(order_date), month(order_date);

select c.customer_name, o.order_id, o.total_amount from customers c
join orders o on c.customer_id = o.customer_id ;

select c.customer_name, o.order_id, o.order_date, o.total_amount from orders o
join customers c on o.customer_id = c.customer_id where c.status = 'active';

select c.customer_name, o.order_id, o.total_amount from orders o
join customers c on o.customer_id = c.customer_id where month(order_date) = 2
and year(order_date) = 2025;

select c.customer_name, avg(o.total_amount) from customers c
join orders o on c.customer_id = o.customer_id group by c.customer_name;