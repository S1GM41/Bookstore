-- Create the bookstore database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Bookstore;

-- Use the bookstore database
USE Bookstore;

-- Create authors table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

-- Create books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create sales table
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data into authors table
INSERT INTO Authors (Name, Country) VALUES
('George Orwell', 'UK'),
('Harper Lee', 'USA'),
('J.K. Rowling', 'UK');

-- Insert sample data into books table
INSERT INTO Books (Title, AuthorID, Genre, Price) VALUES
('1984', 1, 'Dystopian', 15.99),
('To Kill a Mockingbird', 2, 'Fiction', 10.99),
('Harry Potter and the Sorcerer''s Stone', 3, 'Fantasy', 12.99);

-- Insert sample data into sales table
INSERT INTO Sales (BookID, SaleDate, Quantity) VALUES
(1, '2024-09-01', 3),
(2, '2024-09-02', 2),
(3, '2024-09-03', 5);

-- Sample query to get total sales for each book
SELECT 
    B.Title, 
    SUM(S.Quantity) AS TotalSales 
FROM 
    Books B 
JOIN 
    Sales S ON B.BookID = S.BookID 
GROUP BY 
    B.Title;

-- Sample query to get the total revenue generated from sales
SELECT 
    B.Title,
    SUM(S.Quantity * B.Price) AS TotalRevenue 
FROM 
    Books B 
JOIN 
    Sales S ON B.BookID = S.BookID 
GROUP BY 
    B.Title;
