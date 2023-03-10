# Database Administration Homework

## TASK DB1

### PART 1

#### 1-2. Download MySQL server for your OS on VM and install MySQL server on VM.
Use Ubuntu 20.04 
```` 
sudo apt-get update 
sudo apt-get install mysql-server
sudo systemctl start mysql.service
````
---
#### 3-4. Select a subject area and describe the database schema and Create a database on the server through the console.
Start work in MySQL  
````
sudo mysql
````
Create DATABASE "city";
````MySQL
CREATE DATABASE city;
USE city;
````
Create tables
````MySQL
CREATE TABLE areas (
    name VARCHAR(50) NOT NULL,
    population INT NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE hospitals (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    e_mail  VARCHAR(50) NOT NULL,
    areas VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
);

CREATE TABLE hotels (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    e_mail  VARCHAR(50) NOT NULL,
    areas VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
);

````
---
#### 5. Fill in tables.
````MySQL
INSER INTO areas (name, population)
    VALUES 
    ('Brooklyn', 2459000),
    ('Staten Island', 441000),
    ('Queens', 2233000),
    ('Manhattan', 1525000),
    ('Bronx', 1376000);

INSERT INTO hospitals (name, phone_number, e_mail, areas)
    VALUES
    ('BELLEVUE HOSPITAL CENTER', 56546546, 'bellevue@ny.com', 'Manhattan'),
    ('BETH ISRAEL MEDICAL', 34522200, 'beth_israel@gmail.com', 'Bronx'),
    ('COLUMBIA', 10031005, 'columbia@ny.org.com', 'Queens'),
    ('LENOX HILL', 44432232, 'lenox_hill@healthy.com', 'Brooklyn');

INSERT INTO hotels (name, phone_number, e_mail, areas)
    VALUES
    ('HILLTON', 33446677, 'hilton@gmail.com', 'Manhattan'),
    ('GRAND HOTEL', 77665544, 'grand_hotel@ny.com', 'Manhattan'),
    ('ISLAND', 00031003, 'island_staten@org.com', 'Staten Island');
````
---
#### 6-7. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY and Execute other different SQL queries DDL, DML, DCL.
````MySQL
SELECT * FROM areas 
    WHERE population > 2000000;
````
![](where_population.png)
---
````MySQL
SELECT name FROM hospitals
    ORDER BY areas;
````
![](order_by.png)
---
````MySQL
SELECT SUBSTR(name,1,1) 
    FROM hotels
    GROUP BY SUBSTR(name,1,1);
````
![](group_by.png)
--- 
````MySQL
ALETER TABLE areas 
    ADD square VARCHAR(20);
````
![](add.png)
---
#### 8. Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions.
Create first user "Sara" with all privileges:

````MySQL
sudo mysql
CREATE USER 'sara'@'localhost' IDENTIFIED BY '*****';
GRANT ALL PRIVILEGES ON *.* TO 'sara'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
````
??heck some queries:
````MySQL
mysql -u sara -p
````
![](connect_sara.png)

````MySQL
SHOW GRANTS FOR 'sara'@'localhost';
````
![](grant_sara.png)

````MySQL
CREATE DATABASE test;
SHOW DATABASES;
````
![](create_sara.png)
---
Create second user "Siri" with privileges (INSERT, SELECT):
````MySQL
CREATE USER 'siri'@'localhost' IDENTIFIED BY '*****';
GRANT INSERT, SELECT on city.* TO 'siri'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'siri'@'localhost';
````
??heck some queries:
````MySQL
mysql -u siri -p
````
![](connect_siri.png)

````MySQL
SHOW GRANTS FOR 'siri'@'localhost';
````
![](grant_siri.png)

````MySQL
CREATE DATABASE test1;
SELECT * FROM city.hospitals;
````
![](select_siri.png)
---
#### 9. Make a selection from the main table DB MySQL.
````MySQL
sudo mysql
USE mysql;
SHOW tables;
SELECT * FROM user WHERE user = 'root' \G
````
![](select_db.png)
---

### PART 2

#### 10. Make backup of your database.
````
mysqldump -u sara -p city>bkup.sql
ls *.sql
cat bkup.sql
````
![](backup_sql.png)
---

#### 11. Delete the table and/or part of the data in the table.
````MySQL
sudo mysql
SHOW DATABASE;
DROP DATABASE city;
SHOW DATABASE;
````
![](drop_db.png)
---

#### 12. Restore your database.
````MySQL
sudo mysql
CREATE DATABASE city_01;
exit
mysql -u sara -p city_01 <bkup.sql
mysql -u sara -p
USE DATABASE city_01;
SHOW TABLES;
````
![](restore_city_01.png)
---

#### 13-16. Transfer your local database to RDS AWS.
Create EC2 instance in AWS.
Connect to instance.
Update apt-get and install MySQL-Server
Check DATABESE
````MySQL
CREATE DATABASE city;
SHOW DATABASE;
````
![](creat_db_aws.png)
---

Connect to your database.
````
sudo mysql -u root -p city<bkup.sql
````
![](backup_aws.png)
---

Execute SELECT operator similar step 6.
![](qerry_aws.png)
---

Create the dump of your database.
````
sudo mysql -u root -p city > bkup_aws.sql
````
![](dump_aws.png)
---

### PART 3 - MongoDB

#### 17. Create a database. Use the use command to connect to a new database (If it doesn't exist, Mongo will create it when you write to it).
Use AWS RED HEAT OS.
Connect to ES2.
Install MongoDB
````Bash
cd /etc/yum.repos.d/
sudo vi mongodb-org-6.0.repo
    [mongodb-org-6.0]
    name=MongoDB Repository
    baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
    gpgcheck=1
    enabled=1
    gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
sudo yum install -y mongodb-org
sudo yum install -y mongodb-org-6.0.3 mongodb-org-database-6.0.3 mongodb-org-server-6.0.3 mongodb-org-mongos-6.0.3 mongodb-org-tools-6.0.3
````
Start MongoDB
````
sudo systemctl start mongod
````
![](install_Mongo.png)

````
sudo mongosh
show dbs;
````
![](show_dbs_mongo.png)

Create DB test1
````
use test1;
````
---

####  18-20. Create a collection. Use db.createCollection to create a collection. I'll leave the subject up to you. Run show dbs and show collections to view your database and collections, Create some documents,insert a couple of documents into your collection, use find() to list documents out.

Create DB city
````
db.city.insertOne({areas: "Brooklyn", population: 2459000});
show collections;
db.city.insertMany([{areas: "Manhattan"}, {square: 23213213}]);
db.city.find();
````
![](mongo_fill.png)




