set timezone = 'Asia/Seoul';
select now();


create type status as enum('active', 'inactive');
create type provider as enum('kakao','google','naver','crewstation');
/* 관리자 질문 */
create type role as enum('member','guest');
create type gender as enum('male','female');

create table tbl_member(
    id bigint generated always as identity primary key,
    member_name varchar(255) not null,
    member_phone varchar(255),
    member_email varchar(255) unique,
    member_social_url varchar(255),
    member_birth varchar(8),
    member_gender gender default 'male',
    member_mbti char(4),
    member_password varchar(255),
    member_status status default
);

select * from tbl_member;

create table tbl_post(
    id bigint generated always as identity primary key,
    post_status status default('active'),
    member_id bigint not null,
    constraint fk_post_member foreign key(member_id)
                     references tbl_member(id)
);













