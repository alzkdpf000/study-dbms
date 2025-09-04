
CREATE TABLE tbl_post(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	post_title VARCHAR(255) NOT NULL,
	post_content VARCHAR(255) NOT NULL,
	post_read_count INT DEFAULT 0,
	post_status ENUM('disable','enable') DEFAULT 'enable',
	member_id BIGINT UNSIGNED,
	
	created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_post_member FOREIGN KEY(member_id)
	REFERENCES tbl_member(id)
);

SELECT * FROM tbl_post; 
