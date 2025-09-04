/*
1. 요구사항
   유치원을 하려고 하는데, 아이들이 체험학습 프로그램을 신청해야 합니다.
   아이들 정보는 이름, 나이, 성별이 필요하고 학부모는 이름, 나이, 주소, 전화번호, 성별이 필요해요
   체험학습은 체험학습 제목, 체험학습 내용, 이벤트 이미지 여러 장이 필요합니다.
   아이들은 여러 번 체험학습에 등록할 수 있어요.
*/

create table tbl_member(
   id bigint unsigned primary key,
   member_name varchar(255) not null
);

create table tbl_kindergarten(
   id bigint unsigned primary key,
   kindergarten_name varchar(255) not null,
   kindergarten_address varchar(255),
   member_id bigint unsigned,
   constraint fk_kindergarten_member foreign key(member_id)
   references tbl_member(id)
);

create table tbl_parent(
   id bigint unsigned primary key,
   parent_name varchar(255) not null,
   parent_address varchar(255) not null,
   parent_phone varchar(255) not null,
   parent_gender varchar(255) default '선택 안함'
);

create table tbl_child(
   id bigint unsigned primary key,
   child_age int not null,
   child_gender varchar(255) default '여아',
   parent_id bigint unsigned,
   constraint fk_child_parent foreign key(parent_id)
   references tbl_parent(id)
);

create table tbl_field_trip(
   id bigint unsigned primary key,
   field_trip_title varchar(255) not null,
   field_trip_content varchar(255) not null,
   kindergarten_id bigint unsigned,
   created_date datetime default current_timestamp(),
   updated_date datetime default current_timestamp(),
   constraint fk_field_trip_kindergarten foreign key(kindergarten_id)
   references tbl_kindergarten(id)
);

create table tbl_file(
   id bigint unsigned primary key,
   file_path varchar(255) not null,
   file_name varchar(255) not null,
   file_size int not null,
   field_trip_id bigint unsigned not null,
   constraint fk_file_field_trip foreign key(field_trip_id)
   references tbl_field_trip(id)
);

create table tbl_apply(
   id bigint unsigned primary key,
   field_trip_id bigint unsigned not null,
   child_id bigint unsigned not null,
   constraint fk_apply_field_trip foreign key(field_trip_id)
   references tbl_field_trip(id),
   constraint fk_apply_child foreign key(child_id)
   references tbl_child(id)
);



/*
1. 요구사항
   안녕하세요, 광고 회사를 운영하려고 준비중인 사업가입니다.
   광고주는 기업이고 기업 정보는 이름, 주소, 대표번호, 기업종류(스타트업, 중소기업, 중견기업, 대기업)입니다.
   광고는 제목, 내용이 있고 기업은 여러 광고를 신청할 수 있습니다.
   기업이 광고를 선택할 때에는 카테고리로 선택하며, 대카테고리, 중카테고리, 소카테고리가 있습니다.
*/

create table tbl_category_A(
   id bigint unsigned primary key,
   category_A_name varchar(255) not null
);

create table tbl_category_B(
   id bigint unsigned primary key,
   category_B_name varchar(255) not null,
   category_A_id bigint unsigned,
   constraint fk_category_B_category_A foreign key(category_A_id)
   references tbl_category_A(id)
);

create table tbl_category_C(
   id bigint unsigned primary key,
   category_C_name varchar(255) not null,
   category_B_id bigint unsigned,
   constraint fk_category_C_category_B foreign key(category_B_id)
   references tbl_category_B(id)
);

create table tbl_ad(
   id bigint unsigned primary key,
   ad_title varchar(255) not null,
   ad_contents varchar(255) not null,
   category_C_id bigint unsigned not null,
   constraint fk_ad_category_C foreign key(category_C_id)
   references tbl_category_C(id)
);

create table tbl_company(
   id bigint unsigned primary key,
   comapny_name varchar(255) not null,
   comapny_address varchar(255) not null,
   comapny_tel varchar(255) not null,
   comapny_type enum('a', 'b', 'c', 'd') default 'a'
);

create table tbl_apply(
   id bigint unsigned primary key,
   company_id bigint unsigned not null,
   ad_id bigint unsigned not null,
   constraint fk_apply_company foreign key(company_id)
   references tbl_company(id),
   constraint fk_apply_ad foreign key(ad_id)
   references tbl_ad(id)
);

/*
1. 요구사항
   음료수 판매 업체입니다. 음료수마다 당첨번호가 있습니다. 
   음료수의 당첨번호는 1개이고 당첨자의 정보를 알아야 상품을 배송할 수 있습니다.
   당첨 번호마다 당첨 상품이 있고, 당첨 상품이 배송 중인지 배송 완료인지 구분해야 합니다.
*/
create table tbl_soft_drink(
   id bigint unsigned primary key,
   soft_drink_name varchar(255) not null
);

create table tbl_product(
   id bigint unsigned primary key,
   product_name varchar(255) not null,
   product_stockt int default 0
);

create table tbl_lottery(
   id bigint unsigned primary key,
   lottery_number varchar(255) not null,
   product_id bigint unsigned,
   constraint fk_lottery_product foreign key(product_id)
   references tbl_product(id)
);

create table tbl_circulation(
   id bigint unsigned primary key,
   soft_drink_id bigint unsigned,
   lottery_id bigint unsigned,
   constraint fk_circulation_soft_drink foreign key(soft_drink_id)
   references tbl_soft_drink(id),
   constraint fk_circulation_lottery foreign key(lottery_id)
   references tbl_lottery(id)
);

create table tbl_member(
   id bigint unsigned primary key,
   member_name varchar(255),
   member_address varchar(255)
);

create table tbl_delivery(
   id bigint unsigned primary key,
   delivery_status enum('상품 준비', '배송중', '배송 완료') default '상품 준비',
   member_id bigint unsigned,
   product_id bigint unsigned,
   constraint fk_delivery_member foreign key(member_id)
   references tbl_member(id),
   constraint fk_delivery_product foreign key(product_id)
   references tbl_product(id)
);


/*
1. 요구사항
   이커머스 창업 준비중입니다. 기업과 사용자 간 거래를 위해 기업의 정보와 사용자 정보가 필요합니다.
   기업의 정보는 기업 이름, 주소, 대표번호가 있고
   사용자 정보는 이름, 주소, 전화번호가 있습니다. 결제 시 사용자 정보와 기업의 정보, 결제한 카드의 정보 모두 필요하며,
   상품의 정보도 필요합니다. 상품의 정보는 이름, 가격, 재고입니다.
   사용자는 등록한 카드의 정보를 저장할 수 있으며, 카드의 정보는 카드번호, 카드사, 회원 정보가 필요합니다.
*/
create table tbl_company(
   id bigint unsigned primary key,
   company_name varchar(255) not null,
   company_address varchar(255) not null,
   company_tel varchar(255) not null
);

create table tbl_client(
   id bigint unsigned primary key,
   client_name varchar(255) not null,
   client_address varchar(255) not null,
   client_tel varchar(255) not null
);

create table tbl_card(
   id bigint unsigned primary key,
   card_number varchar(255) not null,
   card_company varchar(255) not null,
   client_id bigint unsigned not null,
   constraint fk_card_client foreign key(client_id)
   references tbl_client(id)
);

create table tbl_product(
   id bigint unsigned primary key,
   product_name varchar(255) not null,
   product_price int default 0,
   product_stock int default 0,
   company_id bigint unsigned not null,
   constraint fk_product_comapny foreign key(company_id)
   references tbl_company(id)
);

create table tbl_pay(
   id bigint unsigned primary key,
   card_id bigint unsigned not null,
   product_id bigint unsigned not null,
   constraint fk_pay_card foreign key(card_id)
   references tbl_card(id),
   constraint fk_pay_product foreign key(product_id)
   references tbl_product(id)
);

INSERT INTO tbl_category_A (id, category_A_name) VALUES
(1, '전자제품'),
(2, '의류');

INSERT INTO tbl_category_B (id, category_B_name, category_A_id) VALUES
(1, '스마트폰', 1),
(2, '노트북', 1);

INSERT INTO tbl_category_C (id, category_C_name, category_B_id) VALUES
(1, '안드로이드', 1),
(2, '윈도우', 2);

INSERT INTO tbl_ad (id, ad_title, ad_contents, category_C_id) VALUES
(1, '갤럭시 S 광고', '최신 안드로이드 스마트폰 출시!', 1),
(2, 'LG그램 광고', '초경량 윈도우 노트북 출시!', 2);

INSERT INTO tbl_company (id, comapny_name, comapny_address, comapny_tel, comapny_type) VALUES
(1, '삼성전자', '서울시 강남구', '02-1234-5678', 'a'),
(2, 'LG전자', '서울시 영등포구', '02-8765-4321', 'b');


INSERT INTO tbl_apply (id, company_id, ad_id) VALUES
(1, 1, 1),
(2, 2, 2);

SELECT ta.ad_contents, tcc.category_C_name , tcb.category_B_name , tca.category_A_name , tc.comapny_name  FROM tbl_company tc join tbl_apply a on tc.id = a.company_id
join tbl_ad ta  on a.ad_id = ta.id
join tbl_category_C tcc on ta.category_C_id  = tcc.id 
join tbl_category_B tcb on tcc.category_B_id = tcb.id 
join tbl_category_A tca on tca.id = tcb.category_A_id ;