---
tags:
  - SQL
  - programming_SQL
Catagory: SQL
aliases:
  - database
---
Relational data base for 
# Build a Celestial Bodies Database

This is one of the required projects to earn your certification. For this project, you will build a database of celestial bodies using PostgreSQL.

This course runs in a virtual Linux machine using Gitpod. Follow these instructions to start the course:

1. [Create a GitHub](https://github.com/join "Source Code Link") account if you don't have one
2. Click the start button below
3. Login to Gitpod with your GitHub account if you aren't already
4. Once the virtual Linux machine is finished loading, start the CodeRoad extension by:
    - Clicking the "hamburger" menu near the top left of the VSCode window,
    - Going to the "View" menu,
    - Clicking on the "Command Palette" option,
    - and running the "CodeRoad: Start" command
5. Follow the instructions in CodeRoad to complete the course

Complete both steps below to finish the challenge.

## Step 1: Complete the project

The project runs in a virtual machine, complete the user stories described in there and get all the tests to pass to finish step 1.

**Important:** After you pass all the project tests, save a dump of your database into a `universe.sql` file so you can complete step 2. There will be instructions how to do that within the virtual machine

## Instructions

For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering 
```SQL
psql --username=freecodecamp --dbname=postgres
```
in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

**Don't forget to connect to your database after you create it** 😄

Here's some ideas for other column and table names: `description`, `has_life`, `is_spherical`, `age_in_millions_of_years`, `planet_types`, `galaxy_types`, `distance_from_earth`.

**Notes:**  
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering 
```SQL
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```
in a bash terminal (not the psql one). It will save the commands to rebuild your database in `universe.sql`. The file will be located where the command was entered. If it's anything inside the `project` folder, the file will be saved in the VM. You can rebuild the database by entering `psql -U postgres < universe.sql` in a terminal where the `.sql` file is.

If you are saving your progress on [freeCodeCamp.org](http://freeCodeCamp.org), after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the `universe.sql` file in a public repository and submit the URL to it on [freeCodeCamp.org](http://freeCodeCamp.org).

Complete the tasks below

- You should create a database named `universe`
    
- Be sure to connect to your database with `\c universe`. Then, you should add tables named `galaxy`, `star`, `planet`, and `moon`
    
- Each table should have a primary key
    
- Each primary key should automatically increment
    
- Each table should have a `name` column
    
- You should use the `INT` data type for at least two columns that are not a primary or foreign key
    
- You should use the `NUMERIC` data type at least once
    
- You should use the `TEXT` data type at least once
    
- You should use the `BOOLEAN` data type on at least two columns
    
- Each "star" should have a foreign key that references one of the rows in `galaxy`
    
- Each "planet" should have a foreign key that references one of the rows in `star`
    
- Each "moon" should have a foreign key that references one of the rows in `planet`
    
- Your database should have at least five tables
    
- Each table should have at least three rows
    
- The `galaxy` and `star` tables should each have at least six rows
    
- The `planet` table should have at least 12 rows
    
- The `moon` table should have at least 20 rows
    
- Each table should have at least three columns
    
- The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns
    
- At least two columns per table should not accept `NULL` values
    
- At least one column from each table should be required to be `UNIQUE`
    
- All columns named `name` should be of type `VARCHAR`
    
- Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key column named `moon_id`
    
- Each foreign key column should have the same name as the column it is referencing

---
## Plan
universe

galaxy--
galaxy_id (primary key)
name (VARCHAR NOT NULL UNIQUE)
type(VARCHAR )
galaxy_size(INT)
age(NUMERIC NOT NULL)
d

star--
star_id(PRIMARY KEY)
name(VARCHAR NOT NULL UNIQUE)
galaxy_id(NOT NULL)
type(VARCHAR )
size(INT)
mass(NUMERIC)
d

planet--
planet_id(PRIMARY KEY)
name(VARCHAR NOT NULL UNIQUE)
star_id(NOT NULL)
galaxy_id(NOT NULL)
type(VARCHAR )
size(INT)
d

moon--
moon_id(PRIMARY KEY)
name(VARCHAR NOT NULL UNIQUE)
planet_id(NOT NULL)
moon_size(NUMERIC)
type(VARCHAR )
size(INT)
d

deacriptions--
description_id(PRIMARY KEY )
description(TEXT NOT NULL UNIQUE)
planet_id
galaxy_id
star_id
moon_id
has_life(BOOLEAN)

---
```SQL
psql --username=freecodecamp --dbname=postgres
```

```SQL
CREATE DATABASE universe;
```

```SQL
\c universe
```

`galaxy`, `star`, `planet`, and `moon`
- Each table should have a primary key
    
- Each primary key should automatically increment
```SQL
CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY);
CREATE TABLE star(star_id SERIAL PRIMARY KEY);
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY);
CREATE TABLE moon(moon_id SERIAL PRIMARY KEY);
CREATE TABLE descriptions(descriptions_id SERIAL PRIMARY KEY);
```

- Each table should have a `name` column
```SQL
ALTER TABLE galaxy ADD COLUMN name VARCHAR NOT NULL UNIQUE;
ALTER TABLE star ADD COLUMN name VARCHAR NOT NULL UNIQUE;
ALTER TABLE planet ADD COLUMN name VARCHAR NOT NULL UNIQUE;
ALTER TABLE moon ADD COLUMN name VARCHAR NOT NULL UNIQUE;
ALTER TABLE descriptions ADD COLUMN name VARCHAR NOT NULL UNIQUE;
```

galaxy table--
```SQL
ALTER TABLE galaxy ADD COLUMN type VARCHAR;
ALTER TABLE galaxy ADD COLUMN size INT;
ALTER TABLE galaxy ADD COLUMN age NUMERIC NOT NULL;
```

```SQL
ALTER TABLE galaxy ADD COLUMN descriptions_id INT REFERENCES descriptions(descriptions_id);
```
star table--
```SQL
ALTER TABLE star ADD COLUMN type VARCHAR;
ALTER TABLE star ADD COLUMN size INT;
ALTER TABLE star ADD COLUMN mass NUMERIC NOT NULL;
```

```SQL
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE star ADD COLUMN descriptions_id INT REFERENCES descriptions(descriptions_id);
```

planet table--
```SQL
ALTER TABLE planet ADD COLUMN type VARCHAR;
ALTER TABLE planet ADD COLUMN size INT;
ALTER TABLE planet ADD COLUMN mass NUMERIC NOT NULL;
ALTER TABLE planet ADD COLUMN has_atmosphere BOOLEAN NOT NULL DEFAULT FALSE;

```

```SQL
ALTER TABLE planet ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE planet ADD COLUMN descriptions_id INT REFERENCES descriptions(descriptions_id);
```

moon table--
```SQL
ALTER TABLE moon ADD COLUMN type VARCHAR;
ALTER TABLE moon ADD COLUMN size INT;
ALTER TABLE moon ADD COLUMN mass NUMERIC NOT NULL;
```

```SQL
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);
ALTER TABLE moon ADD COLUMN descriptions_id INT REFERENCES descriptions(descriptions_id);
```

description table--
```SQL
ALTER TABLE descriptions ADD COLUMN description TEXT;
ALTER TABLE descriptions ADD COLUMN has_life BOOLEAN NOT NULL;
```

```SQL
ALTER TABLE descriptions ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE descriptions ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE descriptions ADD COLUMN planet_id INT REFERENCES planet(planet_id);
ALTER TABLE descriptions ADD COLUMN moon_id INT REFERENCES moon(moon_id);
```

---
## Populate the rows

```SQL
-- Populate the galaxy table with 6 rows
INSERT INTO galaxy (name, type, size, age)
VALUES 
    ('Milky Way', 'Spiral', 100000, 13.6),
    ('Andromeda', 'Spiral', 120000, 10.1),
    ('Triangulum', 'Spiral', 50000, 5.3),
    ('Messier 87', 'Elliptical', 150000, 12.4),
    ('Whirlpool', 'Spiral', 80000, 8.2),
    ('Sombrero', 'Spiral', 90000, 9.7);

```

```SQL
-- Populate the star table with 6 rows
INSERT INTO star (name, type, size, mass, galaxy_id)
VALUES
    ('Sun', 'G-type main-sequence', 1, 1.989e30, 1),
    ('Sirius', 'A-type main-sequence', 2, 2.02 * 1.989e30, 1),
    ('Alpha Centauri A', 'G-type main-sequence', 1.1, 1.1 * 1.989e30, 1),
    ('Alpha Centauri B', 'K-type main-sequence', 0.907, 0.907 * 1.989e30, 1),
    ('Betelgeuse', 'Red supergiant', 1000, 15 * 1.989e30, 1),
    ('VY Canis Majoris', 'Red hypergiant', 1420, 17 * 1.989e30, 1);
```

```SQL
-- Populate the planet table with 12 rows
INSERT INTO planet (name, type, size, mass, galaxy_id, star_id)
VALUES
    ('Earth', 'Terrestrial', 1, 5.972e24, 1, 1),
    ('Mars', 'Terrestrial', 0.107, 6.39e23, 1, 1),
    ('Jupiter', 'Gas giant', 318, 1.898e27, 1, 1),
    ('Saturn', 'Gas giant', 95, 5.683e26, 1, 1),
    ('Kepler-442b', 'Super-Earth', 1.34, 2.34e25, 2, 2),
    ('Kepler-186f', 'Terrestrial', 1, 1.4e25, 2, 2),
    ('Neptune', 'Ice giant', 17, 1.024e26, 1, 1),
    ('Uranus', 'Ice giant', 14.5, 8.68e25, 1, 1),
    ('Mercury', 'Terrestrial', 0.055, 3.285e23, 1, 1),
    ('Venus', 'Terrestrial', 0.815, 4.867e24, 1, 1),
    ('HD 189733b', 'Hot Jupiter', 1.138, 1.138 * 318, 3, 3),
    ('WASP-12b', 'Hot Jupiter', 1.79, 1.79 * 318, 3, 3);
```

```SQL
ALTER TABLE planet RENAME COLUMN has_atmosphere TO has_ring;
UPDATE planet SET has_ring = true WHERE name='Jupiter';
UPDATE planet SET has_ring = true WHERE name='Saturn';
UPDATE planet SET has_ring = true WHERE name='Neptune';

```

```SQL
-- Populate the moon table with 20 rows
INSERT INTO moon (name, type, size, mass, planet_id)
VALUES
    ('Luna', 'Terrestrial', 0.273, 7.35e22, 1),
    ('Phobos', 'Irregular', 0.00000000000108, 1.08 * 10^15, 2),
    ('Deimos', 'Irregular', 0.00000000000021, 0.21 * 10^15, 2),
    ('Europa', 'Terrestrial', 0.246, 4.8e22, 5),
    ('Ganymede', 'Terrestrial', 0.413, 1.48e23, 5),
    ('Callisto', 'Terrestrial', 0.378, 1.08e23, 5),
    ('Titan', 'Terrestrial', 0.404, 1.35e23, 4),
    ('Enceladus', 'Terrestrial', 0.123, 1.08e20, 4),
    ('Io', 'Terrestrial', 0.286, 8.93e22, 4),
    ('Triton', 'Terrestrial', 0.212, 2.14e22, 7),
    ('Charon', 'Terrestrial', 0.154, 1.52e21, 9),
    ('Lysithea', 'Irregular', 0.006, 7.7e16, 8),
    ('Proteus', 'Irregular', 0.042, 5.1e19, 7),
    ('Nereid', 'Irregular', 0.106, 3.1e19, 8),
    ('Oberon', 'Terrestrial', 0.346, 3.01e21, 8),
    ('Miranda', 'Terrestrial', 0.025, 6.59e19, 8),
    ('Umbriel', 'Terrestrial', 0.302, 1.27e21, 8),
    ('Ariel', 'Terrestrial', 0.317, 1.27e21, 8),
    ('Tethys', 'Terrestrial', 0.091, 6.18e20, 4),
    ('Rhea', 'Terrestrial', 0.165, 2.31e21, 4);
```

```SQL
-- Populate the description table with 16 rows
INSERT INTO descriptions (name, description, galaxy_id, star_id, planet_id, moon_id, has_life)
VALUES
    ('Milky Way Description', 'Description of the Milky Way galaxy', 1, NULL, NULL, NULL,true),
    ('Andromeda Description', 'Description of the Andromeda galaxy', 2, NULL, NULL, NULL,false),
    ('Triangulum Description', 'Description of the Triangulum galaxy', 3, NULL, NULL, NULL,false),
    ('Messier 87 Description', 'Description of the Messier 87 galaxy', 4, NULL, NULL, NULL,false),
    ('Sun Description', 'Description of the Sun', NULL, 1, NULL, NULL,false),
    ('Sirius Description', 'Description of the Sirius star', NULL, 2, NULL, NULL,false),
    ('Earth Description', 'Description of the Earth', NULL, NULL, 1, NULL,true),
    ('Mars Description', 'Description of Mars', NULL, NULL, 2, NULL,false),
    ('Luna Description', 'Description of the Moon (Luna)', NULL, NULL, NULL, 1,false),
    ('Phobos Description', 'Description of Phobos', NULL, NULL, NULL, 2,false), 
    ('Deimos Description', 'Description of Deimos', NULL, NULL, NULL, 3,false), 
    ('Europa Description', 'Description of Europa', NULL, NULL, NULL, 4,false), 
    ('Ganymede Description', 'Description of Ganymede', NULL, NULL, NULL, 5,false), 
    ('Callisto Description', 'Description of Callisto', NULL, NULL, NULL, 6,false), 
    ('Titan Description', 'Description of Titan', NULL, NULL, NULL, 7,false), 
    ('Enceladus Description', 'Description of Enceladus', NULL, NULL, NULL, 8,false);
```


```SQL
UPDATE galaxy SET descriptions_id = 1 WHERE galaxy_id=1;
UPDATE galaxy SET descriptions_id = 2 WHERE galaxy_id=2;
UPDATE galaxy SET descriptions_id = 3 WHERE galaxy_id=3;
UPDATE galaxy SET descriptions_id = 4 WHERE galaxy_id=4;

UPDATE star SET descriptions_id = 5 WHERE star_id=1;
UPDATE star SET descriptions_id = 6 WHERE star_id=2;

UPDATE planet SET descriptions_id = 7 WHERE planet_id=1;
UPDATE planet SET descriptions_id = 8 WHERE planet_id=2;

UPDATE moon SET descriptions_id = 9 WHERE moon_id=1;
UPDATE moon SET descriptions_id = 10 WHERE moon_id=2;
UPDATE moon SET descriptions_id = 11 WHERE moon_id=3;
UPDATE moon SET descriptions_id = 12 WHERE moon_id=4;
UPDATE moon SET descriptions_id = 13 WHERE moon_id=5;
UPDATE moon SET descriptions_id = 14 WHERE moon_id=6;
UPDATE moon SET descriptions_id = 15 WHERE moon_id=7;
UPDATE moon SET descriptions_id = 16 WHERE moon_id=8;
```


---

## Check
Let's go through each condition to verify if it's fulfilled:

1. **Database Name**: You've created a database named `universe`.
   
2. **Tables Created**: You've created tables named `galaxy`, `star`, `planet`, and `moon`.

3. **Primary Keys**: Each table has a primary key column.

4. **Automatic Increment**: Primary keys are set to automatically increment.

5. **Name Column**: Each table has a `name` column.

6. **Data Types**: You've used `INT`, `NUMERIC`, `TEXT`, and `BOOLEAN` data types as specified.

7. **Foreign Keys**: Each "star" references a row in `galaxy`, each "planet" references a row in `star`, and each "moon" references a row in `planet`.

8. **At Least Five Tables**: You have five tables (`galaxy`, `star`, `planet`, `moon`, `description`).

9. **At Least Three Rows**: Each table has at least three rows.

10. **Minimum Row Requirements**: `galaxy` and `star` have at least six rows, `planet` has at least 12 rows, and `moon` has at least 20 rows.

11. **Minimum Columns**: Each table has at least three columns.

12. **Column Count Requirements**: `galaxy`, `star`, `planet`, and `moon` have at least five columns.

13. **NULL Values**: At least two columns per table do not accept `NULL` values.

14. **UNIQUE Constraint**: At least one column per table is required to be `UNIQUE`.

15. **Name Columns**: All columns named `name` are of type `VARCHAR`.

16. **Primary Key Naming Convention**: Primary key columns follow the naming convention `table_name_id`.

17. **Foreign Key Naming**: Foreign key columns have the same name as the column they are referencing.

It seems like you've fulfilled all the conditions specified. Well done! Your database meets all the requirements.

---
## Final Save
In linux terminal
if no files then try sudo
```SQL
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

run in linux terminal
```SQL
psql -U postgres < universe.sql
```
---
## Extra codes

To make the `planet_id` column start from 1 and have consecutive values, you can use the `ALTER SEQUENCE` statement to reset the sequence used by the `planet_id` column. Here's how you can do it:

```sql
-- First, find out the name of the sequence associated with the planet_id column
SELECT pg_get_serial_sequence('planet', 'planet_id');

-- This will return something like 'planet_planet_id_seq'

-- Then, reset the sequence to start from 1
ALTER SEQUENCE planet_planet_id_seq RESTART WITH 1;

-- Now, when you insert new rows into the planet table, planet_id will start from 1
```

Replace `'planet'` with the actual name of your table if it's different, and `'planet_id'` with the name of your primary key column if it's different.

By resetting the sequence associated with the `planet_id` column, new values inserted into the `planet_id` column will start from 1 and increment accordingly.

To delete a table in SQL, you use the `DROP TABLE` statement followed by the name of the table you want to delete. Here's the basic syntax:


```sql
DROP TABLE table_name;
```

To delete all rows from the `planet` table in SQL, you use the `DELETE FROM` statement without specifying any conditions. Here's how you can do it:

```sql
DELETE FROM planet;
```

This statement will remove all rows from the `planet` table, effectively clearing out all data from the table while keeping its structure intact.

---
