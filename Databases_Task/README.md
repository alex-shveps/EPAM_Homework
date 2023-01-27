# Database Administration Homework

## TASK DB1

### PART 1

#### 1-2 Download MySQL server for your OS on VM and install MySQL server on VM.
Use Ubuntu 20.04 
```` 
sudo apt-get update 
sudo apt-get install mysql-server
sudo systemctl start mysql.service
````
---
#### 3-4 Select a subject area and describe the database schema and Create a database on the server through the console.
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
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE hospitals (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE hotels (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

````
---
#### 5. Fill in tables.

