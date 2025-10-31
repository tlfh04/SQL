use temp;

-- 유저 테이블 생성
create table user(
	user_id	INT PRIMARY KEY auto_increment,
	email VARCHAR(50) NOT null unique,
	password_hash VARCHAR(255) not null,
	phone VARCHAR(20) not null unique 
);

-- 업주 유저 테이블 생성
create table business_user(
	buser_id int primary key auto_increment,
	name varchar(30) not null,
	email varchar(30) not null unique,
	password_hash VARCHAR(255) not null,
	phone varchar(20) not null unique,
	business_number varchar(30) not null,
	business_name varchar(20) not null
);

-- 주소 테이블 생성
create table address(
	address_id int primary key auto_increment,
	user_id int not null,
	foreign key (user_id) references user(user_id),
	alias varchar(20) not null,
	address_load varchar(50) not null
);

-- 가게정보 테이블 생성
create table store(
	store_id INT primary key auto_increment,
	store_name VARCHAR(50) not null,
	address VARCHAR(100) not null,
	intro varchar(255) not null
);

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

-- 메뉴 카테고리 테이블 생성
create table menu_category(
	menu_category_id int primary key auto_increment,
	menu_category_name varchar(20) not null,
	store_id int not null,
	foreign key (store_id) references store(store_id)
);

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

-- 주문 물품 테이블 생성
create table order_item(
	order_item int primary key auto_increment,
	menu_id int not null,
	quantity int not null,
	price int not null,
	order_id int not null,
	foreign key (order_id) references orders(order_id)
);

-- 결제 테이블 생성
create table payment(
	payment_id int primary key auto_increment,
	order_id int not null,
	foreign key (order_id) references orders(order_id),
	method varchar(5),
	payment_created_at datetime not null default now(),
	amount int not null,
	payment_state enum('결제대기','결제완료') default '결제대기'
);

create table review(
	review_id int primary key auto_increment,
	review_img varchar(255),
	review_comment varchar(255),
	review_rating int not null,
	user_id int not null,
	store_id int not null,
	foreign key (user_id) references user(user_id),
	foreign key (store_id) references store(store_id)
);

-- 리뷰 코멘트 테이블 생성
create table review_comment(
	r_comment_id int primary key auto_increment,
	comment varchar(255) not null,
	buser_id int not null,
	foreign key (buser_id) references business_user(buser_id),
	review_id int not null,
	foreign key (review_id) references review(review_id)
)