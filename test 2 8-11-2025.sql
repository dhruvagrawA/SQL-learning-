use tushar;
drop table orders;
drop table books;
-- CREATE TABLE Books (
--     book_id INT PRIMARY KEY,
--     title VARCHAR(100) NOT NULL UNIQUE,
--     author VARCHAR(100) NOT NULL,
--     genre VARCHAR(50) NOT NULL,
--     price DECIMAL(6,2) NOT NULL CHECK (price > 0),
--     publication_year INT NOT NULL
--     CHECK (publication_year BETWEEN 1900 AND 9999)

-- );
-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY,
--     book_id INT,
--     customer_name VARCHAR(100),
--     order_date DATE,
--     quantity INT,
--     total_price DECIMAL(8,2),
--     FOREIGN KEY (book_id) REFERENCES Books(book_id)
-- );

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2),
    publication_year INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(100),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(8,2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books (book_id, title, author, genre, price, publication_year) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 15.99, 2019),
(2, 'Where the Crawdads Sing', 'Delia Owens', 'Mystery', 18.99, 2018),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 21.50, 2018),
(4, 'The Midnight Library', 'Matt Haig', 'Fiction', 17.25, 2020),
(5, 'Educated', 'Tara Westover', 'Memoir', 14.75, 2018),
(6, 'Becoming', 'Michelle Obama', 'Biography', 22.99, 2018),
(7, 'The Alchemist', 'Paulo Coelho', 'Fiction', 12.99, 1988);

INSERT INTO Orders (order_id, book_id, customer_name, order_date, quantity, total_price) VALUES
(101, 1, 'John Doe', '2023-01-15', 2, 31.98),
(102, 2, 'Jane Smith', '2023-02-10', 1, 18.99),
(103, 3, 'Alice Johnson', '2023-03-05', 3, 64.50),
(104, 4, 'David Brown', '2023-04-12', 1, 17.25),
(105, 1, 'Sophia Wilson', '2023-05-25', 4, 63.96),
(106, 6, 'Michael Lee', '2023-06-08', 2, 45.98),
(107, 3, 'Emma Davis', '2023-07-19', 1, 21.50),
(108, 5, 'Olivia Taylor', '2023-08-01', 2, 29.50),
(109, 7, 'Daniel Martinez', '2023-09-05', 3, 38.97),
(110, 2, 'Lucas White', '2023-10-20', 2, 37.98);

select * from books;
select * from orders;

SELECT title, author, price
FROM Books
WHERE price = (SELECT MAX(price) FROM Books);

SELECT 
    title, 
    genre, 
    price
FROM Books b
WHERE price > (
    SELECT AVG(price)
    FROM Books
    WHERE genre = b.genre
);

SELECT 
    b.author,
    SUM(o.total_price) AS total_revenue
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.author;

SELECT 
    title,
    author,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Books;

SELECT 
    order_id,
    order_date,
    total_price,
    SUM(total_price) OVER (ORDER BY order_date) AS running_total_revenue
FROM Orders;

SELECT author,title
FROM Books
GROUP BY author,title
HAVING COUNT(author) > 1;

SELECT 
    b.title,
    SUM(o.total_price) AS total_revenue
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.title
ORDER BY total_revenue DESC
LIMIT 1;


SELECT 
    title, 
    price
FROM Books
WHERE price = (
    SELECT MAX(price)
    FROM Books
    WHERE price < (SELECT MAX(price) FROM Books)
);













