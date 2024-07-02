show databases;
create database park_smart;
use park_smart;
drop database park_smart;

CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    user_password VARCHAR(50),
    phone_number VARCHAR(10),
    email VARCHAR(100) UNIQUE);
	INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Angelin','Angelin1','9344868945','angelin@parkingspot.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Selena','Selena11','9876543212','selena@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Taylor','Taylor22','6789765434','taylor@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Hailey','Hailey33','9898987678','hailey@gmail.com');
    INSERT INTO user (user_name,user_password,phone_number,email) VALUES ('Ariana','Ariana44','6767678798','ariana@gmail.com');
select * from user;
drop table user;

CREATE TABLE spots (
    user_id INT,
    spot_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    spot_number VARCHAR(50) NOT NULL,
    count_spot_number INT,
    spot_status BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    UNIQUE KEY (location_name, spot_number));
select * from spots;
drop table spots;

CREATE TABLE reservation (
    user_id INT,
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    number_plate VARCHAR(800) NOT NULL,
    start_date_time VARCHAR(100) NOT NULL,
    end_date_time VARCHAR(100) NOT NULL,
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
    transaction_time DATETIME NOT NULL,
    card_number VARCHAR(20),
    expiry_date VARCHAR(50) NOT NULL,
    cvv VARCHAR(10), 
    payment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id));
 
select * from transaction;
drop table transaction;
