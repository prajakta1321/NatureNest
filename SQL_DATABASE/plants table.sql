# plants table

use garden;

create table plants(plant_id int , pname varchar(255) , ptype varchar (255), season varchar(50), care varchar(255) );
drop table plants;
create table plants(plant_id int , pname varchar(255) , ptype varchar (255), season varchar(50), care varchar(255) );

INSERT INTO  plants (plant_id, pname, ptype, season, care )
values(1,'Tomato', 'Vegetable', 'Spring', 'Plant in well-draining soil, water regularly, provide sunlight.'),
(2,'Rose', 'Flower', 'Spring, Fall', 'Requires well-drained soil, full sun, and regular pruning.'),
(3,'Lavender', 'Flower', 'Spring', 'Plant in well-drained soil, water sparingly, needs sunlight.'),
(4,'Carrot', 'Vegetable', 'Spring, Fall', 'Requires loose soil, consistent moisture, and cool temperatures.'),
(5,'Basil', 'Herb', 'Spring, Summer', 'Plant in rich, moist soil, provide sunlight, water frequently.'),
(6,'Daisy', 'Flower', 'Spring, Summer', 'Plant in well-drained soil, requires regular watering.'),
(7,'Lettuce', 'Vegetable', 'Spring, Fall', 'Needs rich soil, regular watering, and partial shade.'),
(8,'Sunflower', 'Flower', 'Spring, Summer', 'Plant in fertile soil, full sun, water deeply.'),
(9,'Bell Pepper', 'Vegetable', 'Spring, Summer', 'Requires warm soil, plenty of sunlight, and regular watering.'),
(10,'Chrysanthemum', 'Flower', 'Fall', 'Prefers well-drained soil, needs sunlight, and regular pruning.'),
(11,'Cucumber', 'Vegetable', 'Spring, Summer', 'Plant in fertile soil, full sun, keep soil consistently moist.'),
(12,'Tulip', 'Flower', 'Fall', 'Plant bulbs in well-drained soil, partial sun, water moderately.'),
(13,'Spinach', 'Vegetable', 'Spring, Fall', 'Plant in fertile soil, partial shade, keep soil moist.'),
(14,'Daffodil', 'Flower', 'Fall', 'Plant bulbs in well-drained soil, full sun to partial shade, water moderately.'),
(15,'Zucchini', 'Vegetable', 'Spring, Summer', 'Needs rich soil, full sun, consistent watering.'),
(16,'Mint', 'Herb', 'Spring, Summer', 'Plant in rich, moist soil, partial shade, water frequently.'),
(17,'Pansy', 'Flower', 'Spring, Fall', 'Plant in well-drained soil, partial shade, water regularly.'),
(18,'Broccoli', 'Vegetable', 'Spring, Fall', 'Plant in fertile soil, full sun, water consistently.'),
(19,'Geranium', 'Flower', 'Spring, Summer', 'Plant in well-drained soil, full sun, water moderately.'),
(20,'Potato', 'Vegetable', 'Spring, Summer', 'Requires well-drained soil, full sun, regular hilling.'),
(21,'Lavender', 'Flower', 'Spring', 'Plant in well-drained soil, water sparingly, needs sunlight.'),
(22,'Kale', 'Vegetable', 'Spring, Fall', 'Plant in fertile soil, partial shade, water regularly.'),
(23,'Cherry Blossom', 'Flower', 'Spring', 'Plant in well-drained soil, full sun to partial shade, water moderately.'),
(24,'Onion', 'Vegetable', 'Spring, Summer', 'Plant in fertile soil, full sun, water consistently.'),
(25,'Peony', 'Flower', 'Spring, Summer', 'Plant in well-drained soil, full sun to partial shade, water regularly.'),
(26,'Garlic', 'Vegetable', 'Fall', 'Plant in well-drained soil, full sun, water occasionally.'),
(27,'Hyacinth', 'Flower', 'Spring', 'Plant bulbs in well-drained soil, full sun to partial shade, water moderately.'),
(28,'Radish', 'Vegetable', 'Spring, Fall', 'Plant in loose soil, partial shade, water consistently.'),
(29,'Lily', 'Flower', 'Spring, Summer', 'Plant in well-drained soil, full sun to partial shade, water regularly.'),
(30,'Cabbage', 'Vegetable', 'Spring, Fall', 'Plant in fertile soil, full sun, water consistently.'),
(31,'Aster', 'Flower', 'Fall', 'Plant in well-drained soil, full sun, water moderately.');

# retrieve all plant details
select * from plants;

# find all plants suitable for planting in spring
select pname
from plants
where season = 'Spring'; 

SELECT * FROM Plants 
WHERE season LIKE '%Spring%';

# Count the number of different types of plants:
select ptype , count(*)
from plants
group by type;

# Find plants with names starting with 'L':
SELECT * 
FROM Plants 
WHERE pname LIKE 'L%';

# Retrieve plant names and their corresponding planting seasons:
select pname , season
from plants;

# Find plants that are not vegetables:
select ptype
from plants
where ptype != 'Vegetable';

# Retrieve plants suitable for planting in both Spring and Fall:
select pname
from plants
where season like '%Spring%' and season like '%Fall%';

# Count the number of plants for each planting season:
SELECT season, COUNT(*)   
FROM Plants 
GROUP BY season;

# Find plants with names containing 'flower':
SELECT * 
FROM Plants 
WHERE pname LIKE '%flower%';

# Retrieve plants sorted by name in alphabetical order:
SELECT * 
FROM Plants 
ORDER BY pname;

 # Retrieve the plant types along with the average length of care instructions for each type:
 SELECT ptype, AVG(LENGTH(Care)) AS AvgCareInstructionLength
FROM Plants
GROUP BY ptype;

# Find plants with care instructions mentioning 'sun' or 'water':
select pname
from plants
where care like '%sun%' or care like '%water%'
group by pname;

# Calculate the average length of care instructions for all plants:
select avg(length(care))
from plants;

# Find the plant type with the maximum number of entries:
select count(ptype)
from plants
group by ptype
order by ptype
desc;

# Calculate the total number of characters in care instructions for each planting season:
select count(care)
from plants
group by season;

# Retrieve the top 5 plants with the longest care instructions:
select pname , length(care) as carelength
from plants
order by carelength
limit 5;

# Calculate the number of plants for each type and their respective planting seasons:
SELECT ptype,  Season, COUNT(*) AS PlantCount
FROM Plants
GROUP BY ptype, Season;
