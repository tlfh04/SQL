use temp;

-- 유저 테이블 생성
create table user(
	user_id	INT PRIMARY KEY auto_increment,
	email VARCHAR(50) NOT null unique,
	password_hash VARCHAR(255) not null,
	phone VARCHAR(20) not null unique 
);

-- 유저 데이터 생성
insert into user(email,password_hash,phone) values
('tlfh04@gmail.com','hash1234','010-8030-5631')

-- 유저 데이터 조회
select * from user;

create table business_user(
	buser_id int primary key auto_increment,
	name varchar(30) not null,
	email varchar(30) not null unique,
	password_hash VARCHAR(255) not null,
	phone varchar(20) not null unique,
	business_number varchar(30) not null,
	business_name varchar(20) not null
)

select * from business_user;

insert into business_user(name,email,password_hash,phone,business_number,business_name) values
('홍길동','rlfehd22@naver.com','hash2222','010-4444-2222','271-65-78633','던킨도넛 홍대점')

create table address(
	address_id int primary key auto_increment,
	user_id int not null,
	foreign key (user_id) references user(user_id),
	alias varchar(20) not null,
	address_load varchar(50) not null
)

-- 유저 데이터 삭제
delete from user where user_id = 1;

-- 가게정보 테이블 생성
create table store(
	store_id INT primary key auto_increment,
	store_name VARCHAR(50) not null,
	address VARCHAR(100) not null,
	intro varchar(255) not null
);

-- 가게 정보 조회
select * from store;

-- 가게 정보 데이터 생성
insert into store(store_name,address,intro) values
('던킨도넛','서울 장안동','최고의 도넛가게');

-- 가게 카테고리 테이블 생성
create table store_category(
	s_category int primary key auto_increment,
	store_id int not null,
	foreign key (store_id) references store(store_id),
	s_category_info_id int not null,
	foreign key (s_category_info_id) references category_info(category_info_id)
);

-- 카테고리 정보 테이블 생성
create table category_info(
	category_info_id int primary key auto_increment,
	category_name varchar(30) not null
);

-- 카테고리 정보 데이터 생성
insert into category_info(category_name) values
('분식'),
('양식'),
('중식');

-- 카테고리 정보 데이터 조회
select * from category_info

-- 가게 카테고리 데이터 생성
insert into store_category(store_id,s_category_info_id) values
(1,2);

-- 가게 카테고리 데이터 조회
select * from store_category;

-- 가게정보 전체 데이터 조회
select store_name as 상호명,address as 주소,intro as 가게설명,category_name as 가게카테고리 from store s 
inner join store_category sc on s.store_id = sc.store_id 
inner join category_info ci on sc.s_category_info_id = ci.category_info_id;

-- 메뉴 카테고리 테이블 생성
create table menu_category(
	menu_category_id int primary key auto_increment,
	menu_category_name varchar(20) not null,
	store_id int not null,
	foreign key (store_id) references store(store_id)
);

-- 메뉴 카테고리 데이터 생성
insert into menu_category(menu_category_name,store_id) values
('임박메뉴',1),
('맛있는 도넛',1),
('음료',1);

-- 메뉴 카테고리 데이터 조회
select * from menu_category;

-- 메뉴 테이블 생성
create table menu(
	menu_id int primary key auto_increment,
	menu_category_id int not null,
	foreign key (menu_category_id) references menu_category(menu_category_id),
	menu_name varchar(20) not null,
	menu_description varchar(255),
	menu_image_url varchar(255),
	menu_stock int not null,
	menu_price int not null
);

-- 메뉴 데이터 생성
insert into menu(menu_category_id,menu_name,menu_description,menu_image_url,menu_stock,menu_price) values
(1,'스위트도넛','매우 달콤한 도넛','',5,500),
(1,'특가도넛','정말 달콤한 도넛','',5,300),
(2,'일반도넛','살짝 달콤한 도넛','',5,800),
(2,'고급도넛','고급진 달콤한 도넛','',5,800),
(3,'아이스아메리카노','맛있는 커피','',5,2500);

-- 메뉴 데이터 조회
select * from menu;

-- 메뉴 카테고리 데이터 조회
select * from menu_category;

-- 가게정보 전체 데이터 조회
select store_name as 상호명,address as 주소,intro as 가게설명,category_name as 가게카테고리 from store s 
	inner join store_category sc on s.store_id = sc.store_id 
	inner join category_info ci on sc.s_category_info_id = ci.category_info_id;

-- 가게 메뉴 카테고리 조회
select store_name as 상호명, menu_category_name as 카테고리메뉴 from store s
	inner join menu_category mc on s.store_id = mc.store_id
	where store_name = '던킨도넛';

-- 메뉴 카테고리의 메뉴 조회
select store_name as 상호명, menu_category_name as 카테고리메뉴, menu_name as 메뉴이름 from store s
	inner join menu_category mc on s.store_id = mc.store_id
	inner join menu m on mc.menu_category_id = m.menu_category_id
	where store_name = '던킨도넛';

-- 오더 테이블 생성
create table orders(
	order_id int primary key auto_increment,
	order_date datetime not null default now(),
	total_price int,
	order_state enum('대기','완료') not null,
	user_id int not null,
	foreign key (user_id) references user(user_id),
	store_id int not null,
	foreign key (store_id) references store(store_id)
);

drop table orders;

select * from orders;

-- 주문 물품 테이블 생성
create table order_item(
	order_item int primary key auto_increment,
	menu_id int not null,
	quantity int not null,
	price int not null,
	order_id int not null,
	foreign key (order_id) references orders(order_id)
)

drop table order_item;
select * from user;
select * from order_item;
select * from orders;
select * from store s inner join menu_category mc on s.store_id = mc.store_id inner join menu m on mc.menu_category_id = m.menu_category_id

-- 결제 테이블 생성
create table payment(
	payment_id int primary key auto_increment,
	order_id int not null,
	foreign key (order_id) references orders(order_id),
	method varchar(5),
	payment_created_at datetime not null default now(),
	amount int not null,
	payment_state enum('결제대기','결제완료') default '결제대기'
)

-- 1번 유저가 던킨 도넛에서 맛있는 도넛중 고급도넛 2개와 일반 도넛 3개를 구매한다.

-- 주문 목록 생성
insert into orders (order_state,user_id,store_id) values
('대기',2,1);

-- 메뉴 추가
insert into order_item (order_id,menu_id,quantity,price)
select order_id,menu_id,3,menu_price from orders o
	inner join store s on o.store_id = s.store_id
	inner join menu_category mc on s.store_id = mc.store_id
	inner join menu m on mc.menu_category_id = m.menu_category_id
	where mc.menu_category_id = 2 and m.menu_id = 3;

-- 메뉴 추가
insert into order_item (order_id,menu_id,quantity,price)
select order_id,menu_id,2,menu_price from orders o
	inner join store s on o.store_id = s.store_id
	inner join menu_category mc on s.store_id = mc.store_id
	inner join menu m on mc.menu_category_id = m.menu_category_id
	where mc.menu_category_id = 2 and m.menu_id = 4;

delete from order_item where order_item = 2;
select * from order_item;

-- 가격 총합 구하기
update orders o 
left join (select order_id,sum(price*quantity) as total_price from order_item group by order_id) t
on o.order_id = t.order_id
set o.total_price = coalesce(t.total_price), o.order_state = '완료';

-- 결제창 출력을 위한 payment
insert into payment (order_id,amount)
(select order_id,total_price from orders)

select * from payment;

-- 결제 데이터 업데이트
update payment p
set p.method = '카카오페이',p.payment_state = '결제완료';

-- 결과
select order_id as 주문번호,method as 결제방식,amount as 결제가격,payment_created_at as 결제날짜,payment_state as 결제여부 from payment;

-- 결제 완료한 메뉴
select mc.menu_category_name as 메뉴카테고리, m.menu_name as 메뉴명,oi.quantity as 수량,oi.price as 가격, (oi.price * oi.quantity) as 총가격, p.payment_state as 결제여부 from payment p 
	inner join orders o on p.order_id = o.order_id 
	inner join order_item oi on o.order_id = oi.order_id 
	inner join menu m on oi.menu_id  = m.menu_id  
	inner join menu_category mc on m.menu_category_id  = mc.menu_category_id
	where p.payment_state = '결제완료'

create table review(
	review_id int primary key auto_increment,
	review_img varchar(255),
	review_comment varchar(255),
	review_rating int not null,
	user_id int not null,
	store_id int not null,
	foreign key (user_id) references user(user_id),
	foreign key (store_id) references store(store_id)
)

-- 1번 유저가 1번 가게에 평점 3점, 맛있는데 아쉽습니다 라는 리뷰를 남긴다
insert into review(review_img,review_comment,review_rating,user_id,store_id) values
('https://adsad.com/qewrwqew','너무 맛있어요!',5,2,1);

-- 모든 리뷰 조회
select store_name as 가게이름, r.review_rating as 평점, r.review_img as 이미지링크, r.review_comment as 리뷰내용 from store s 
	left join review r on s.store_id = r.store_id ;

-- 가게별 평점 조회
select store_name as 가게이름, r.avg_rating as 평점 from store s 
	left join (select store_id,AVG(review_rating) as avg_rating from review group by store_id) r on s.store_id = r.store_id;

-- 리뷰 코멘트 테이블 생성
create table review_comment(
	r_comment_id int primary key auto_increment,
	comment varchar(255) not null,
	buser_id int not null,
	foreign key (buser_id) references business_user(buser_id),
	review_id int not null,
	foreign key (review_id) references review(review_id)
)

select * from review_comment

-- 업주 대댓글
insert into review_comment(comment,buser_id,review_id) values
('찾아주셔서 감사합니다 다음엔 더 맛있는 음식으로 보답하겠습니다',1,5)

insert into review_comment(comment,buser_id,review_id) values
('좋은리뷰 감사합니다 다음엔 더 맛있는 음식으로 보답하겠습니다',1,6)

-- 모든 리뷰의 대댓글 조회
select store_name as 가게이름, r.review_rating as 평점, r.review_img as 이미지링크, r.review_comment as 리뷰내용,rc.comment as 대댓글 from store s 
	left join review r on s.store_id = r.store_id 
	left join review_comment rc on r.review_id =rc.review_id;