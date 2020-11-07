SELECT * FROM violet_user_login;
SELECT * FROM violet_cart;
SELECT * FROM violet_contact;
SELECT * FROM violet_order;
SELECT * FROM violet_categories;
SELECT * FROM violet_products;

sp_help violet_products;

CREATE TABLE violet_user_login (uname VARCHAR(50) PRIMARY KEY, email VARCHAR(50) NOT NULL UNIQUE, username VARCHAR(20) NOT NULL UNIQUE, password VARCHAR(20) NOT NULL, phone DECIMAL(10, 0) NOT NULL UNIQUE, dob DATE NOT NULL, country VARCHAR(20) NOT NULL, state VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, gender VARCHAR(10) NOT NULL, address VARCHAR(500) NOT NULL, secq VARCHAR(100) NOT NULL, seca VARCHAR(20) NOT NULL);
CREATE TABLE violet_products (pname VARCHAR(50) PRIMARY KEY, price DECIMAL(20,2) NOT NULL, pimage VARCHAR(250) NOT NULL UNIQUE, category VARCHAR(50) NOT NULL, stock INT, uname VARCHAR(50), keywords VARCHAR(500));
CREATE TABLE violet_cart (uname VARCHAR(50), sno int PRIMARY KEY, pimage VARCHAR(250) NOT NULL, pname VARCHAR(50), price DECIMAL(20, 2) NOT NULL, quantity INT NOT NULL, total DECIMAL(20, 2) NOT NULL, sname VARCHAR(50));
CREATE TABLE violet_contact (uname VARCHAR(50), email VARCHAR(50), message VARCHAR(500));
CREATE TABLE violet_order (uname VARCHAR(50), pname VARCHAR(50), orderID VARCHAR(20) NOT NULL, orderDate DATE NOT NULL, quantity INT NOT NULL, total DECIMAL(20,2) NOT NULL);
CREATE TABLE violet_categories (cname VARCHAR(100), cimage VARCHAR(100));


INSERT INTO violet_user_login VALUES ('daryl', 'daryl.fernandes50@gmail.com', 'daryl99', 'Abcd@1234', 9867831910, '04/26/1999', 'India', 'Maharashtra', 'Mumbai', 'Male', 'Everest Gardens, C/501', 'Something Something Something', 'DSV', 3452);

INSERT INTO violet_products VALUES ('HP Printer', 7999, 'img/products/printer.png', 'Desktop', 10, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Apple', 49, 'img/products/apple.png', 'computer', 32, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Apple Logo', 1593, 'img/products/appol.png', 'computer', 53, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Arcade Gaming Console', 70599, 'img/products/arcade.png', 'computer', 42, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Oil', 69, 'img/products/img1.png', 'computer', 13, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Fossil Watch', 15999, 'img/products/watch.png', 'computer', 6, 'The only human traffickers', 'electronics, computer');
INSERT INTO violet_products VALUES ('Anirudha', 1999, 'img/products/human.png', 'hooman', 20, 'The only human traffickers', 'electronics, computer, human, man, monkey');

INSERT INTO violet_categories VALUES ('Shirt', '/img/categories/shirt.png');
INSERT INTO violet_categories VALUES ('Pant', '/img/categories/pant.png');
INSERT INTO violet_categories VALUES ('Laptop', '/img/categories/laptop.png');
INSERT INTO violet_categories VALUES ('Desktop', '/img/categories/desktop.png');

INSERT INTO violet_cart values ('daryl', 1, 'img/products/apple.png', 'Apple', 49.00, 1, 49.00, 'The only human traffickers');

UPDATE violet_products SET keywords='electronics computer human man' WHERE pname='Anirudha';
UPDATE violet_products SET uname='The only human traffickers' WHERE pname='oil';

INSERT INTO violet_user_login VALUES ('The only human traffickers', 'trafficking@gmail.com', 'human99', 'Abcd@1234', 9856433191, '04/26/1999', 'India', 'Maharashtra', 'Mumbai', 'Male', 'i live here, this is the place where i live', 'Something Something Something', 'DSV', 5343);

delete from violet_user_login;
delete from violet_contact;
delete from violet_products;
delete from violet_order;
delete from violet_cart;

drop table violet_cart;
drop table violet_products;
drop table violet_contact;
drop table violet_user_login;
drop table violet_order;

ALTER TABLE violet_user_login DROP COLUMN uid;

CREATE TABLE violet_seller_login (sname VARCHAR(50) PRIMARY KEY, email VARCHAR(50) NOT NULL UNIQUE, username VARCHAR(20) NOT NULL UNIQUE, password VARCHAR(20) NOT NULL, phone DECIMAL(10, 0) NOT NULL UNIQUE, dob DATE NOT NULL, country VARCHAR(20) NOT NULL, state VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, gender VARCHAR(10) NOT NULL, address VARCHAR(500) NOT NULL, secq VARCHAR(100) NOT NULL, seca VARCHAR(20) NOT NULL);
INSERT INTO violet_seller_login VALUES ('daryl', 'daryl.fernandes50@gmail.com', 'daryl99', 'Abcd@1234', 9867831910, '04/26/1999', 'India', 'Maharashtra', 'Mumbai', 'Male', 'Everest Gardens, C/501', 'Something Something Something', 'DSV');
SELECT * FROM violet_seller_login;
delete from violet_seller_login;
drop table violet_seller_login;
UPDATE violet_seller_login SET sname='The only human traffickers';

select * from seq;