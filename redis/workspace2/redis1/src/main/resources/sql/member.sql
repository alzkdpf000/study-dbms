create table tbl_member(
    id bigint generated always as identity primary key,
    member_email varchar(255) not null unique,
    member_password varchar(255) not null,
    member_name varchar(255)
);