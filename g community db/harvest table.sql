use garden;

create table harvest(h_id int , date Date , quantity int , plant_id int, plot_id int, member_id int); 

INSERT INTO harvest (h_id, date, quantity, plant_id, plot_id, member_id) VALUES
(1, '2023-01-05', 10, 1, 1, 1),
(2, '2023-01-08', 8, 2, 2, 2),
(3, '2023-01-10', 15, 3, 3, 3),
(4, '2023-01-15', 12, 1, 4, 4),
(5, '2023-01-20', 9, 2, 5, 5),
(6, '2023-02-02', 18, 3, 6, 6),
(7, '2023-02-05', 7, 1, 7, 7),
(8, '2023-02-08', 14, 2, 8, 8),
(9, '2023-02-10', 11, 3, 9, 9),
(10, '2023-02-15', 20, 1, 10, 10),
(11, '2023-03-01', 6, 2, 11, 11),
(12, '2023-03-05', 16, 3, 12, 12),
(13, '2023-03-10', 13, 1, 13, 13),
(14, '2023-03-12', 8, 2, 14, 14),
(15, '2023-03-18', 22, 3, 15, 15),
(16, '2023-04-02', 5, 1, 16, 16),
(17, '2023-04-08', 12, 2, 17, 17),
(18, '2023-04-10', 18, 3, 18, 18),
(19, '2023-04-15', 9, 1, 19, 19),
(20, '2023-04-20', 25, 2, 20, 20),
(21, '2023-05-05', 4, 3, 21, 21),
(22, '2023-05-10', 10, 1, 22, 22),
(23, '2023-05-15', 15, 2, 23, 23),
(24, '2023-05-20', 19, 3, 24, 24),
(25, '2023-06-01', 3, 1, 25, 25),
(26, '2023-06-05', 11, 2, 26, 26),
(27, '2023-06-10', 16, 3, 27, 27),
(28, '2023-06-15', 21, 1, 28, 28),
(29, '2023-06-20', 7, 2, 29, 29),
(30, '2023-06-25', 14, 3, 30, 30);

# retrieve all harvest records
SELECT * FROM harvest;

# Find the total quantity harvested for each plant type (plant_id):
SELECT plant_id, SUM(quantity) AS TotalQuantityHarvested
FROM harvest
GROUP BY plant_id;

# Get the harvest details for a specific member (e.g., member_id = 3):
SELECT * 
FROM harvest 
WHERE member_id = 3;

# Find the most recent harvest dates for each plot:
SELECT plot_id, MAX(date) AS RecentHarvestDate
FROM harvest
GROUP BY plot_id;

# Retrieve the total quantity harvested by date in ascending order:
SELECT date, SUM(quantity) AS TotalQuantity
FROM harvest
GROUP BY date
ORDER BY date ASC;

# Find the average quantity harvested for each plant type:
SELECT plant_id, AVG(quantity) AS AvgQuantityHarvested
FROM harvest
GROUP BY plant_id;

# Get the total quantity harvested by each member:
SELECT member_id, SUM(quantity) AS TotalQuantityHarvested
FROM harvest
GROUP BY member_id;

# Retrieve the earliest harvest date for each plant type:
SELECT plant_id, MIN(date) AS EarliestHarvestDate
FROM harvest
GROUP BY plant_id;

# Count the number of harvest records for each plot:
SELECT plot_id, COUNT(*) AS TotalHarvests
FROM harvest
GROUP BY plot_id;

# Find the highest quantity harvested for each plant type:
SELECT plant_id, MAX(quantity) AS MaxQuantityHarvested
FROM harvest
GROUP BY plant_id;

# Retrieve the total quantity harvested for a specific plot 
# (e.g., plot_id = 5) on a particular date (e.g., '2023-04-15'):
SELECT SUM(quantity) AS TotalQuantityHarvested
FROM harvest
WHERE plot_id = 5 AND date = '2023-04-15';

# Get the total quantity harvested month-wise for a particular plant type (e.g., plant_id = 3):
SELECT MONTH(date) AS HarvestMonth, SUM(quantity) AS TotalQuantity
FROM harvest
WHERE plant_id = 3
GROUP BY MONTH(date);

# Retrieve the members who harvested more than 15 units in a single harvest:
SELECT member_id
FROM harvest
GROUP BY member_id
HAVING MAX(quantity) > 15;

# Find the plot with the highest total quantity harvested:
SELECT plot_id, SUM(quantity) AS TotalHarvest
FROM harvest
GROUP BY plot_id
ORDER BY TotalHarvest DESC
LIMIT 1;

# Get the dates with no harvests recorded:
SELECT DISTINCT date
FROM harvest h1
WHERE NOT EXISTS (
    SELECT 1
    FROM harvest h2
    WHERE h1.date = h2.date
);

# Retrieve the average quantity harvested per plot:
SELECT plot_id, AVG(quantity) AS AvgQuantityHarvested
FROM harvest
GROUP BY plot_id;

# Find the date(s) with the highest total quantity harvested:
SELECT date, SUM(quantity) AS TotalHarvest
FROM harvest
GROUP BY date
ORDER BY TotalHarvest DESC
LIMIT 1;

# Get the members who harvested on the most recent date in the database:
SELECT DISTINCT member_id
FROM harvest
WHERE date = (SELECT MAX(date) FROM harvest);
