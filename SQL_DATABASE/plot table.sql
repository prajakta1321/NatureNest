
# plots table
use garden;

create table plot(plot_id int , location char(70) , size int, statuss varchar(255), member_id int );

INSERT INTO  plot(plot_id, location, size, statuss, member_id )
VALUES (1, 'Garden A', 100, 'Occupied', 1),
(2, 'Garden B', 75, 'Occupied', 2),
(3, 'Greenfield Park', 120, 'Available', NULL),
(4, 'Sunny Meadows', 90, 'Occupied', 3),
(5, 'Orchard Hills', 110, 'Available', NULL),
(6, 'Meadowview', 80, 'Occupied', 4),
(7, 'Riverside Garden', 95, 'Available', NULL),
(8, 'Maple Grove', 70, 'Available', NULL),
(9, 'Sunset Fields', 105, 'Occupied', 5),
(10, 'Lakeside Gardens', 85, 'Available', NULL),
(11, 'Pinecrest Park', 115, 'Occupied', 6),
(12, 'Oakwood Estates', 65, 'Occupied', 7),
(13, 'Rosewood Terrace', 125, 'Available', NULL),
(14, 'Elmwood Gardens', 95, 'Available', NULL),
(15, 'Willow Creek', 100, 'Occupied', 8),
(16, 'Birchwood Meadows', 75, 'Available', NULL),
(17, 'Cedar Ridge', 110, 'Occupied', 9),
(18, 'Sunflower Fields', 85, 'Available', NULL),
(19, 'Lavender Valley', 120, 'Occupied', 10),
(20, 'Magnolia Gardens', 70, 'Available', NULL),
(21, 'Jasmine Park', 100, 'Occupied', 11),
(22, 'Daffodil Grove', 80, 'Available', NULL),
(23, 'Tulip Hill', 105, 'Occupied', 12),
(24, 'Bluebell Gardens', 90, 'Available', NULL),
(25, 'Violet Valley', 115, 'Occupied', 13),
(26, 'Iris Meadows', 95, 'Available', NULL),
(27, 'Lily Lane', 110, 'Available', NULL),
(28, 'Poppy Field', 75, 'Occupied', 14),
(29, 'Marigold Manor', 120, 'Occupied', 15),
(30, 'Dahlia Heights', 85, 'Available', NULL);

# retrieve all the plots
select * from plots;

# find available plots larger than 100 in size
select avg(size)
from plot
where size > 100 and statuss = 'Available';

# get the count of occupied plots
SELECT COUNT(*) AS OccupiedPlotsCount 
FROM Plot WHERE Statuss = 'Occupied';

# Find the location and size of the smallest plot:
SELECT Location, Size 
FROM Plot 
ORDER BY Size 
ASC LIMIT 1;
 
# find the aveeerag size ofall occupants
SELECT AVG(Size) AS AvgSizeOccupiedPlots
FROM Plot
WHERE Statuss = 'Occupied';

# Retrieve plots allocated to a specific member (e.g., Member_ID = 3)
SELECT * FROM Plot WHERE Member_ID = 3;

# Count the number of available plots in each location:
SELECT Location, COUNT(*) AS AvailablePlotsCount
FROM Plot
WHERE Statuss = 'Available'
GROUP BY Location;

# Find the total size of all occupied plots:
SELECT SUM(Size) AS TotalSizeOccupiedPlots
FROM Plot
WHERE Statuss = 'Occupied';

# Retrieve plots ordered by size in descending order:
SELECT *
FROM Plot
ORDER BY Size DESC;

# retrieve plots that are either occupied or larger in size
SELECT *
FROM Plot
WHERE Statuss = 'Occupied' OR Size > 100;

# calculate the average plot size for each location
SELECT Location, AVG(Size) AS AvgPlotSize
FROM Plot
GROUP BY Location;

# retrieve plots sorted by location and size
SELECT *
FROM Plot
ORDER BY Location, Size;

# Find plots that are available and have a size between 80 and 100 (inclusive):
select * 
from plot
where statuss = 'Available' and size between 80 and 100;

# Calculate the total count of plots in each status category
select count(*)
from plot
group by statuss;

# find the maximum plot size among available plots
select max(size) as maximum_available_plot_size
from plot
where statuss = 'Available';
