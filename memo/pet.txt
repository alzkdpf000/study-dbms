create table tbl_owner(
	id bigint unsigned auto_increment primary key,
	owner_name varchar(255) not null,
	owner_age int default 0,
	owner_phone varchar(255) not null,
	owner_address varchar(255) not null,
	owner_type enum('owner', 'center') default 'owner'
);

create table tbl_pet(
	id bigint unsigned auto_increment primary key,
	pet_ill_name varchar(255) not null,
	pet_name varchar(255),
	pet_age int not null,
	pet_weight decimal(5, 2) not null,
	owner_id bigint unsigned unsigned,
	constraint fk_pet_owner foreign key(owner_id)
	references tbl_owner(id)
);