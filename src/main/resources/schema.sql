CREATE TABLE article
(
  ID INT PRIMARY KEY auto_increment
, title varchar(255)
, author varchar(255)
, body varchar(255)
, created timestamp DEFAULT CURRENT_TIMESTAMP
);