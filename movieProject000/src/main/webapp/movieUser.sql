create database movieUser;

use movieUser;

create table user (
    userID VARCHAR(20) PRIMARY KEY,
    userPassword VARCHAR(20),
    userName VARCHAR(20),
    userGender VARCHAR(20),
    userEmail VARCHAR(50),
    birthdate date,
    nickname varchar(20),
    country varchar(20),
    mobile varchar(13)
    );
select * from movieUser.user;

create table board (
	num int(10) PRIMARY KEY,
	id varchar(20),
	nickname varchar(20),
	title VARCHAR(400),
	content VARCHAR(4000),
	regDate date,
	readCount int(10)
	);