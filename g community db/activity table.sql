# activities table
use garden ;
 
create table activity (a_id int , description varchar(255) ,  date Date,  member_id int);
insert into activity values
(1, 'Gardening Workshop on soil preparation', '2023-01-15', 1),
(2, 'Flower Arrangement Class for beginners', '2023-02-05', 2),
(3, 'Harvesting Event with local farmers', '2023-03-10', 3),
(4, 'Composting Seminar for sustainable living', '2023-04-22', 4),
(5, 'Vegetable Gardening Demo showcasing techniques', '2023-05-12', 5),
(6, 'Floral Design Competition for enthusiasts', '2023-06-08', 6),
(7, 'Plant Swap Meet encouraging plant exchange', '2023-07-18', 7),
(8, 'Herb Growing Workshop exploring different herbs', '2023-08-25', 8),
(9, 'Seedling Plantation Drive in the local community', '2023-09-14', 9),
(10, 'Landscaping Exhibition featuring garden designs', '2023-10-03', 10),
(11, 'Indoor Plant Care Class for houseplant enthusiasts', '2023-11-20', 11),
(12, 'Garden Photography Workshop capturing nature', '2023-12-05', 12),
(13, 'Tree Planting Campaign to enhance greenery', '2024-01-08', 13),
(14, 'Succulent Planting Session with rare species', '2024-02-19', 14),
(15, 'Beekeeping Demonstration on apiary management', '2024-03-22', 15),
(16, 'Fruit Tree Pruning Workshop for fruitful harvests', '2024-04-10', 16),
(17, 'Permaculture Seminar for sustainable farming', '2024-05-07', 17),
(18, 'Wildflower Hike exploring local flora', '2024-06-15', 18),
(19, 'Greenhouse Tour showcasing plant varieties', '2024-07-28', 19),
(20, 'Gardening Q&A Session to address queries', '2024-08-09', 20),
(21, 'Pesticide-Free Plant Care Class for eco-conscious', '2024-09-17', 21),
(22, 'Fertilizer Application Workshop for healthy growth', '2024-10-30', 22),
(23, 'Herbal Medicine Making Class with natural herbs', '2024-11-11', 23),
(24, 'Farm-to-Table Cooking Demo using fresh produce', '2024-12-14', 24),
(25, 'Garden Tool Maintenance Workshop for upkeep', '2025-01-25', 25),
(26, 'Water Conservation Seminar for sustainable practices', '2025-02-09', 26),
(27, 'Indigenous Plant Awareness Talk to promote natives', '2025-03-28', 27),
(28, 'Aquaponics System Setup Demo for beginners', '2025-04-05', 28),
(29, 'Insect-Friendly Garden Workshop promoting biodiversity', '2025-05-20', 29),
(30, 'Garden Meditation Session for relaxation', '2025-06-08', 30);

# retrieve all activity names in descending order of their count
select description 
from activity
order by description
desc;

# Find activities with a specific member ID (e.g., member_id = 5): 
select a_id
from activity
where member_id = 5;

# Get activities scheduled after a certain date (e.g., after '2023-06-01'):
SELECT * 
FROM activity 
WHERE Date > '2023-06-01';

# Count the total number of activities:
select count(a_id)
from activity;

# Retrieve activity descriptions for a specific member ID (e.g., member_id = 7):
SELECT description 
FROM activity 
WHERE member_id = 7;

# Find activities that occurred before a specific date (e.g., before '2023-08-15'):
SELECT * 
FROM activity 
WHERE Date < '2023-08-15';

#  Retrieve activities sorted by date in ascending order:
SELECT * 
FROM activity 
ORDER BY Date ASC;

# Get the maximum activity ID in the table:
SELECT MAX(a_id) AS MaxActivityID 
FROM activity;

# Find activities with descriptions containing the word 'Workshop':
SELECT * 
FROM activity 
WHERE description LIKE '%Workshop%';

# Retrieve the latest activity for each member:
SELECT member_id, MAX(Date) AS LatestActivityDate
FROM activity
GROUP BY member_id;

# Find activities with descriptions starting with 'Garden':
SELECT * 
FROM activity 
WHERE description LIKE 'Garden%';

# Retrieve activities with IDs between 5 and 10 (inclusive):
SELECT * 
FROM activity 
WHERE a_id BETWEEN 5 AND 10;

# Count the number of activities for each member:
SELECT member_id, COUNT(*) AS ActivityCount
FROM activity
GROUP BY member_id;

# Find activities where the date is within a specific range (e.g., '2023-06-01' to '2023-08-01'):
SELECT * 
FROM activity 
WHERE Date BETWEEN '2023-06-01' AND '2023-08-01';

# Retrieve activities sorted by member ID in descending order:
SELECT * 
FROM activity 
ORDER BY member_id 
DESC;

 # Retrieve distinct descriptions of activities:
 SELECT DISTINCT description 
 FROM activity;

# Find the earliest and latest activity dates:
SELECT MIN(Date) AS EarliestDate, 
MAX(Date) AS LatestDate 
FROM activity;

# Count the total number of activities:
select count(a_id)  as total_no_of_activities
from activity;

# Retrieve activities sorted by date in descending order:
select *
from activity
order by date
desc;

# Find the top 3 most common activity types along with their counts:
SELECT description AS ActivityType, COUNT(*) AS ActivityCount
FROM activity
GROUP BY description
ORDER BY ActivityCount DESC
LIMIT 3;
