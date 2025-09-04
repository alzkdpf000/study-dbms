CREATE DATABASE jdbc;

use jdbc;

CREATE TABLE tbl_member(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	member_email VARCHAR(255) UNIQUE NOT NULL,
	member_password VARCHAR(255) NOT NULL,
	member_name VARCHAR(255) NOT NULL,
	member_age INT DEFAULT 0,
	member_gender ENUM ('남','여','선택안함') DEFAULT '선택안함',
	member_status ENUM('disable','enable') DEFAULT 'enable',
	created_date DATETIME DEFAULT CURRENT_TIMESTAMP(),
	updated_date DATETIME DEFAULT CURRENT_TIMESTAMP()
);

SELECT * FROM tbl_member;
DESC tbl_member ;


