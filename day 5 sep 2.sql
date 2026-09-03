create database Instagram_db;
use Instagram_db;

create table users (
user_id int auto_increment primary key,
username varchar(50) not null unique,
email varchar(100) not null unique,
first_name varchar(50),
last_name varchar(50),
created_at timestamp default current_timestamp
);

---- 2. profile table----
---- one to one relationship with users----

create table profiles (
profile_id int auto_increment primary key,
user_id int unique not null ,
bio varchar (200),
profile_picture varchar (255),
date_of_birth date ,

foreign key (user_id)
references users (user_id)
on delete cascade
);


create table posts (
post_id int auto_increment primary key,
user_id int not null, content text,
image_url varchar(255),created_date timestamp default current_timestamp,

foreign key (user_id)
references users (user_id)
on delete cascade
);



create table comments (
comment_id int auto_increment primary key,
user_id int not null,
post_id int not null,
comment_text varchar (500),
created_date timestamp default current_timestamp,

foreign key (user_id)
references users(user_id)
on delete cascade,
foreign key (post_id)
references posts (post_id)
on delete cascade
);

create table likes(
user_id int,
post_id int,
liked_date timestamp default current_timestamp,

primary key(USER_ID, post_id),

foreign key (user_id)
references users (user_id)
on delete cascade,

foreign key (post_id)
references posts (post_id)
on delete cascade
);
insert into users (username, email,first_name,last_name)
values 
('hitesh123','hitesh@gmail.com','hitesh','pandey'),
('rahul_01','rahul@gmail.com','rahul','sharma'),
('priya_99','priya@gmail.com','priya','patil');

Insert into profiles
(user_id,bio, date_of_birth)
values 
(1,'DATA SCIENCE TRAINER ','1995-05-10'),
(2,'SOFTWARE DEVELOPER' ,'1998-08-15'),
(3, 'DATA ANAYLST','1999-08-15');

insert INTO POSTS 
(USER_ID,CONTENT,IMAGE_URL)
values
(1,'LEARNING SQL DATABASE REALTIONSHIPS!','SQL.JPG'),
(1,'TODAY WE LEARN FOREIGN KEY','FOREIGNKEY.JPG'),
(2,'HELLO FROM INSTAGRAM DATABASE!','INSTAGRAM.JPG');
select*from posts;

insert INTO COMMENTS
(USER_ID,POST_ID,COMMENT_TEXT)
VALUES(2,1,'GREAT EXPLANTION!'),
(3,1,'VERY USEFUL TOPIC.'),
(1,3,'WELCOME TO THE PLATFORM!');

select*from COMMENTS;


desc likes;
insert INTO LIKES 
(user_id,post_id)
values (2,1),(3,1),(1,3),(3,3);

select*from likes;






