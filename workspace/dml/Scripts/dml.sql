CREATE database dml;
use employees;



-- 풀 스택 실무에서 
-- fulltext -> 문자열은 자연어에서 그램이라는 단위로 끊을 수 잇음 인덱스 종류이다.
-- 이걸 사용하면 match라는 것을 사용한다. match(컬러명) against(원하는 내용) 빠르지만 같다 밖에 안됨
-- ngram_token_size default로  2이다.
-- 그래서 사이트에서 보면 2글자 이상만 입력 가능 이 경우라 생각할 수 있다.
-- against (원하는 내용 is boolean mode)로 2글자 이상 입력 시 검색 가능 포함되는 내용이 나온다.
-- CREATE FULLTEXT INDEX 인덱스이름 ON 테이블이름 (열이름)  WITH PARSER ngram; 사용법이다.
-- SHOW GLOBAL VARIABLES LIKE "ngram_token_size" 토큰 사이즈 검색;
/*
 * 가령 토큰 사이즈가 2라고 할 때 "철학은 어떻게 삶의 무기가 되는가"라는 책 제목을 검색한다면,
 
["철학", "학은", "어떻", "떻게", "삶의", "무기", "기가", "되는", "는가"]
set global innodb_ft_aux_table = '디비명/테이블명';
SELECT * FROM INFORMATION_SCHEMA.INNODB_FT_INDEX_CACHE;
 * Set Token Size
ngram_token_size는 mysqld 실행 시 option으로 설정(startup string)하거나 my.conf 구성 파일에서 설정할 수 있습니다.
 
mysqld --ngram_token_size=2

# OR

[mysqld]
ngram_token_size=2

 */
-- join에서 드라이빙 드라이븐 테이블이 존재하는데 인덱스가 있는 쪽이 드라이븐 없는 쪽이 드라이빙으로 설정된다
-- 만약 두 테이블이 인덱스가 있으면 상관이 없고 둘 중 하나만 있으면 없는 쪽이 드라이빙 테이블이 된다.

/*
항목	Primary Key (PK)							일반 인덱스 (Secondary Index)
고유성	✅ 항상 고유 (UNIQUE + NOT NULL)			❌ 중복 가능
저장 방식	클러스터형 인덱스 (데이터가 인덱스와 같이 저장됨)	보조 인덱스 (데이터를 찾아가는 포인터를 가짐)
탐색 비용	더 적음 (한 번의 탐색으로 데이터에 접근)			약간 더 많음 (인덱스 → PK → 데이터 두 단계)
예측성	높음 (항상 한 건 매칭됨)						낮음 (범위 매칭일 수 있음)
*/
SELECT COUNT(DISTINCT emp_no) as EMP_NO,COUNT(DISTINCT birth_date) as birth_date, COUNT(DISTINCT first_name), COUNT(DISTINCT last_name)
,COUNT(DISTINCT gender) as gender, COUNT(DISTINCT hire_date) as hire_date
from employees e;





ALTER TABLE salaries DROP FOREIGN KEY <Foreign key name>
 alter table salaries drop primary key;


alter table salaries add FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
-- alter table salaries add PRIMARY KEY(from_date);
CREATE INDEX idx_sal ON salaries(salary);
CREATE INDEX idx_emp ON salaries(emp_no);
SELECT COUNT(*) FROM salaries s join employees e ON s.emp_no = e.emp_no; 

CREATE INDEX idx_sal ON salaries(emp_no);
SELECT COUNT(*) FROM  salaries s where s.salary = 10000;



ALTER TABLE employees.salaries DROP INDEX salary;
ALTER TABLE employees.salaries DROP FOREIGN KEY salaries_ibfk_1;

SET SESSION  innodb_parallel_read_threads = 32;

EXPLAIN SELECT COUNT(*) FROM  salaries s where s.salary >= 100000 and s.salary <= 700000;
SELECT COUNT(*) FROM  salaries s where s.salary >= 100000 and s.salary <= 700000;
EXPLAIN SELECT salary, COUNT(*) FROM salaries s GROUP BY s.salary  HAVING s.salary > 500000;

 SELECT salary, COUNT(*) FROM salaries s GROUP BY s.salary  HAVING s.salary > 500000;

EXPLAIN SELECT s.emp_no , MAX(s.salary) as total FROM  salaries s GROUP BY s.emp_no HAVING total > 500000;


SELECT s.emp_no , MAX(s.salary) as total FROM  salaries s GROUP BY s.emp_no HAVING total > 10000;



CREATE TABLE tbl_idx_test1 (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	sals INT
);

CREATE TABLE tbl_idx_test2 (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	sals INT
);

INSERT INTO tbl_idx_test1(sals)
VALUES(1000),(2000),(3000),(4000),(5000),(6000),(7000);

INSERT INTO tbl_idx_test2(sals)
VALUES(1000),(2000),(3000),(4000),(5000),(6000),(7000);


CREATE INDEX idx_sal1 ON tbl_idx_test1(sals);
CREATE INDEX idx_sal2 ON tbl_idx_test2(sals);



SELECT * FROM tbl_idx_test2 t2 join tbl_idx_test1 t1 on t2.sals = t1.sals;
CREATE INDEX idx_sal ON salaries(salary);
SELECT s.salary , MAX(s.emp_no) as total FROM  salaries s GROUP BY s.salary HAVING total > 500000;




