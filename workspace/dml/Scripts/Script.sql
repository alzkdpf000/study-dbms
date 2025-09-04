CREATE TABLE tbl_fullText_test1 (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO employees.tbl_fullText_test1
(name)
VALUES('안녕 타요'),('뽀로로와 친구'),('크레용 신짱구'),('안녕 자두야');

SHOW GLOBAL VARIABLES LIKE "ngram_token_size";

CREATE FULLTEXT INDEX full_test ON movie (name)  WITH PARSER ngram;
set global innodb_ft_aux_table = 'employees/movie';

SELECT * FROM information_schema.innodb_ft_index_table;

SELECT * FROM movie WHERE MATCH(name) AGAINST('짱구');

CREATE INDEX idx_name ON movie(name);

SELECT * FROM movie WHERE name LIKE '짱구%';

