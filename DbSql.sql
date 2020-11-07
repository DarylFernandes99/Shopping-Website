CREATE DATABSE website;
USE website;

CREATE TABLE violet_user_login (uname VARCHAR(50) PRIMARY KEY, email VARCHAR(50) NOT NULL UNIQUE, username VARCHAR(20) NOT NULL UNIQUE, password VARCHAR(20) NOT NULL, phone DECIMAL(10, 0) NOT NULL UNIQUE, dob DATE NOT NULL, country VARCHAR(20) NOT NULL, state VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, gender VARCHAR(10) NOT NULL, address VARCHAR(500) NOT NULL, secq VARCHAR(100) NOT NULL, seca VARCHAR(20) NOT NULL);
CREATE TABLE violet_seller_login (sname VARCHAR(50) PRIMARY KEY, email VARCHAR(50) NOT NULL UNIQUE, username VARCHAR(20) NOT NULL UNIQUE, password VARCHAR(20) NOT NULL, phone DECIMAL(10, 0) NOT NULL UNIQUE, dob DATE NOT NULL, country VARCHAR(20) NOT NULL, state VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, gender VARCHAR(10) NOT NULL, address VARCHAR(500) NOT NULL, secq VARCHAR(100) NOT NULL, seca VARCHAR(20) NOT NULL);
CREATE TABLE violet_products (pname VARCHAR(50) PRIMARY KEY, price DECIMAL(20,2) NOT NULL, pimage VARCHAR(250) NOT NULL UNIQUE, category VARCHAR(15), sname VARCHAR(50) REFERENCES violet_seller_login(sname));
CREATE TABLE violet_cart (uname VARCHAR(50) REFERENCES violet_user_login(uname), pname VARCHAR(50) REFERENCES violet_products(pname), quantity INT NOT NULL);
CREATE TABLE violet_contact (uname VARCHAR(50), email VARCHAR(50), message VARCHAR(500));

SELECT * FROM violet_user_login;
SELECT * FROM violet_seller_login;
SELECT * FROM violet_products;
SELECT * FROM violet_cart;

'
drop table violet_cart;
drop table violet_products;
drop table violet_seller_login;
drop table violet_user_login;
'