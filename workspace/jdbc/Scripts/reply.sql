
CREATE TABLE tbl_reply(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	reply_content VARCHAR(255) NOT NULL,
	reply_status enum('disable', 'enable') default 'enable',
	member_id BIGINT UNSIGNED,
	post_id BIGINT UNSIGNED,
	created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_reply_post FOREIGN KEY(member_id)
	REFERENCES tbl_post(id),
	CONSTRAINT fk_reply_member FOREIGN KEY(post_id)
	REFERENCES tbl_member(id)	
);

SELECT * FROM tbl_reply ;