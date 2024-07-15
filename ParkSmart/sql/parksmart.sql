show databases;
create database park_smart;
use park_smart;
drop database park_smart;

CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    user_password VARCHAR(50),
    phone_number VARCHAR(10),
    email VARCHAR(100) UNIQUE,
    status BOOLEAN NOT NULL DEFAULT true);
	INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Angelin','Angelin1','9344868945','angelin@parkingspot.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Selena','Selena11','9876543212','selena@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Taylor','Taylor22','6789765434','taylor@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Hailey','Hailey33','9898987678','hailey@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Ariana','Ariana44','6767678798','ariana@gmail.com');
select * from user;
drop table user;

CREATE TABLE locations(
	location_id INT AUTO_INCREMENT PRIMARY KEY,
	location VARCHAR(100) UNIQUE,
	location_image longblob);

select * from locations;
drop table locations;

CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT,
    address_name VARCHAR(100) UNIQUE,
    FOREIGN KEY (location_id) REFERENCES locations(location_id));
select * from addresses;
drop table addresses;

CREATE TABLE spots (
    user_id INT,
    spot_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(100),
    address_name VARCHAR(255),
    vehicle_type VARCHAR(50) NOT NULL,
    spot_number VARCHAR(50) NOT NULL,
	spot_status ENUM('occupied', 'unoccupied') DEFAULT 'occupied',
    FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (location) REFERENCES locations(location),
	FOREIGN KEY (address_name) REFERENCES addresses(address_name),
    UNIQUE KEY (location, address_name, spot_number));
select * from spots;
drop table spots;

CREATE TABLE reservation (
    user_id INT,
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    number_plate VARCHAR(800) NOT NULL,
    start_date_time VARCHAR(100) NOT NULL,
    end_date_time VARCHAR(100) NOT NULL,
    fine_amount INT NOT NULL DEFAULT 0,
    reservation_status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    is_active BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id));
select * from reservation;
drop table reservation;

CREATE TABLE transaction (
    user_id INT,
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    price INT,
    payment_method VARCHAR(50) NOT NULL,
    transaction_time VARCHAR(100) NOT NULL,
    card_number VARCHAR(20),
    expiry_date VARCHAR(50),
    cvv VARCHAR(10), 
    payment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id));
select * from transaction;
drop table transaction;







