CREATE DATABASE wordpress;
CREATE USER 'hmiso'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hmiso'@'%';
FLUSH PRIVILEGES;