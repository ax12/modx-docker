CREATE DATABASE IF NOT EXISTS modx_dev;
CREATE DATABASE IF NOT EXISTS modx_proda;

CREATE USER IF NOT EXISTS 'modx_user'@'%' IDENTIFIED BY 'modx_password';
GRANT ALL PRIVILEGES ON modx_dev.* TO 'modx_user'@'%';
GRANT ALL PRIVILEGES ON modx_proda.* TO 'modx_user'@'%';
FLUSH PRIVILEGES;