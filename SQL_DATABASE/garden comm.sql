# garden community database

create database garden;
use garden;

create table member(member_id int , first_name char(70) , last_name char(70), email varchar(255), phone varchar(255), address varchar(255) , join_date varchar(255));
drop table member;

create table member(member_id int , first_name char(70) , last_name char(70), email varchar(255), phone varchar(255), address varchar(255) , join_date varchar(255));

INSERT INTO  member(member_id, first_name, last_name, email, phone, address, join_date)
VALUES
(1, 'John', 'Doe', 'johndoe@email.com', '123-456-7890', '123 Main St, Anytown, USA', '2023-01-05'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St, Anycity, USA', '2022-11-20'),
(3, 'Alex', 'Johnson', 'alex.johnson@email.com', '111-222-3333', '789 Oak St, Anothercity, USA', '2023-03-15'),
(4, 'Emily', 'Williams', 'emily.williams@email.com', '555-666-7777', '101 Pine St, Differentcity, USA', '2022-09-10'),
(5, 'Michael', 'Brown', 'michael.brown@email.com', '444-333-2222', '222 Cedar St, Newcity, USA', '2023-07-25'),
(6, 'Sophia', 'Jones', 'sophia.jones@email.com', '777-888-9999', '333 Birch St, Randomcity, USA', '2022-12-30'),
(7, 'William', 'Davis', 'william.davis@email.com', '666-777-8888', '555 Maple St, Somecity, USA', '2023-02-18'),
(8, 'Olivia', 'Miller', 'olivia.miller@email.com', '222-111-0000', '777 Walnut St, Newtown, USA', '2022-08-05'),
(9, 'Ethan', 'Wilson', 'ethan.wilson@email.com', '999-000-1111', '888 Pineapple St, Elsewhere, USA', '2023-04-12'),
(10, 'Ava', 'Moore', 'ava.moore@email.com', '000-999-8888', '999 Orange St, Farawaycity, USA', '2022-10-29'),
(11, 'Liam', 'Taylor', 'liam.taylor@email.com', '333-555-7777', '111 Plum St, Distantcity, USA', '2023-06-08'),
(12, 'Mia', 'Anderson', 'mia.anderson@email.com', '888-777-6666', '444 Grape St, Remoteville, USA', '2022-12-15'),
(13, 'Noah', 'Thomas', 'noah.thomas@email.com', '111-444-7777', '222 Banana St, Unknowncity, USA', '2023-01-20'),
(14, 'Isabella', 'White', 'isabella.white@email.com', '555-777-9999', '333 Avocado St, Mysterycity, USA', '2022-11-05'),
(15, 'James', 'Hall', 'james.hall@email.com', '777-111-3333', '444 Coconut St, Secretcity, USA', '2023-03-30'),
(16, 'Charlotte', 'Martinez', 'charlotte.martinez@email.com', '222-333-4444', '555 Papaya St, Hiddenplace, USA', '2022-09-15'),
(17, 'Benjamin', 'Robinson', 'benjamin.robinson@email.com', '999-888-7777', '666 Mango St, Unknowncity, USA', '2023-07-10'),
(18, 'Amelia', 'Clark', 'amelia.clark@email.com', '333-222-1111', '777 Kiwi St, Mysteryville, USA', '2022-12-25'),
(19, 'Elijah', 'Rodriguez', 'elijah.rodriguez@email.com', '666-555-4444', '888 Guava St, Enigma, USA', '2023-02-10'),
(20, 'Grace', 'Lewis', 'grace.lewis@email.com', '111-000-9999', '999 Melon St, Puzzleville, USA', '2022-08-15'),
(21, 'Lucas', 'Lee', 'lucas.lee@email.com', '888-999-0000', '111 Watermelon St, Secretville, USA', '2023-04-02'),
(22, 'Harper', 'Walker', 'harper.walker@email.com', '555-444-3333', '222 Berry St, Hiddenvalley, USA', '2022-10-17'),
(23, 'Aiden', 'Perez', 'aiden.perez@email.com', '222-333-4444', '333 Apple St, Riddlecity, USA', '2023-06-22'),
(24, 'Abigail', 'Hall', 'abigail.hall@email.com', '777-888-9999', '444 Cherry St, Enigmaville, USA', '2022-12-07'),
(25, 'Alexander', 'Green', 'alexander.green@email.com', '111-222-3333', '555 Strawberry St, Conundrum, USA', '2023-01-12'),
(26, 'Sofia', 'Hill', 'sofia.hill@email.com', '888-777-6666', '666 Fig St, Mysteriousplace, USA', '2022-11-27'),
(27, 'Jackson', 'Baker', 'jackson.baker@email.com', '555-666-7777', '777 Pear St, Puzzleland, USA', '2023-03-15'),
(28, 'Avery', 'Phillips', 'avery.phillips@email.com', '222-111-0000', '888 Persimmon St, Puzzletown, USA', '2022-09-20'),
(29, 'Scarlett', 'Ross', 'scarlett.ross@email.com', '999-000-1111', '999 Tangerine St, Enigmatown, USA', '2023-07-05'),
(30, 'Carter', 'Wood', 'carter.wood@email.com', '000-999-8888', '111 Lemon St, Mysterytown, USA', '2022-12-20');

# retrieve all the members
select * from member;

# retrieve member with specific name
select * from member
where first_name = 'john' and last_name = 'doe';

# retrieve members who joined after a specific date
SELECT * FROM member WHERE Join_Date > '2023-01-01';

# retrieve members with a specific email domain
select * from member 
where email like '%@email.com';

# Retrieve members with phone numbers starting with a certain area code
select first_name , last_name
from member
where phone like '111%';

# retrieve the count of members
select count(*)
as total_member_count
from member;

# Retrieve members sorted by join date in descending order
select first_name , last_name
from member
order by join_date
desc;

# retrieve the oldest member based on join date
select first_name , last_name
from member
order by join_date
limit 1;

set sql_safe_updates = 0;
# update a members phone number
update member
set phone = '123-834-888'
where  member_id = 4;

# delete a member record
delete from member
where member_id = 12;

# calculate the total number of members
select count(*) as total_members_count
from member;

# find the earliest join date among the members
select min(join_date) as minimum_join_date
from member;

# Determine the average length of membership (in days) for all members:
select avg(join_date)  
from member;

# Find the member with the latest join date
select *
from member
where join_date = (select max(join_date) from member);

# calculate the total number of members for each city
select address , 
count(*) as total_members
from member
group by address;

# Find the member(s) with the shortest tenure (earliest join date):
select *
from member
where join_date = (select min(join_date) as shortest_tenure);

# calculate the average number of members joining per month
SELECT YEAR(Join_Date) AS JoinYear, MONTH(Join_Date) AS JoinMonth, COUNT(*) AS NewMembersCount
FROM Member
GROUP BY YEAR(Join_Date), MONTH(Join_Date);

# Find the member(s) who joined before a specific date:
SELECT *
FROM Member
WHERE Join_Date < '2023-01-01';

# Calculate the total number of members and the percentage they comprise of the entire membership
SELECT COUNT(*) AS TotalMembers,
ROUND((COUNT(*) / (SELECT COUNT(*) FROM Member)) * 100, 2) AS PercentageOfTotal
FROM Member;
