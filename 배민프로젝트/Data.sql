-- 유저 데이터 생성
insert into user(email,password_hash,phone) values
('tlfh04@gmail.com','hash1234','010-8030-5631');

-- 업주 유저 데이터 생성
insert into business_user(name,email,password_hash,phone,business_number,business_name) values
('홍길동','rlfehd22@naver.com','hash2222','010-4444-2222','271-65-78633','던킨도넛 홍대점');

-- 가게 정보 데이터 생성
insert into store(store_name,address,intro) values
('던킨도넛','서울 장안동','최고의 도넛가게');

-- 카테고리 정보 데이터 생성
insert into category_info(category_name) values
('분식'),
('양식'),
('중식');

-- 가게 카테고리 데이터 생성
insert into store_category(store_id,s_category_info_id) values
(1,2);

-- 메뉴 카테고리 데이터 생성
insert into menu_category(menu_category_name,store_id) values
('임박메뉴',1),
('맛있는 도넛',1),
('음료',1);

-- 메뉴 데이터 생성
insert into menu(menu_category_id,menu_name,menu_description,menu_image_url,menu_stock,menu_price) values
(1,'스위트도넛','매우 달콤한 도넛','',5,500),
(1,'특가도넛','정말 달콤한 도넛','',5,300),
(2,'일반도넛','살짝 달콤한 도넛','',5,800),
(2,'고급도넛','고급진 달콤한 도넛','',5,800),
(3,'아이스아메리카노','맛있는 커피','',5,2500);

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

-- 가격 총합 구하기
update orders o 
left join (select order_id,sum(price*quantity) as total_price from order_item group by order_id) t
on o.order_id = t.order_id
set o.total_price = coalesce(t.total_price), o.order_state = '완료';

-- 결제창 출력을 위한 payment
insert into payment (order_id,amount)
(select order_id,total_price from orders);

-- 결제 데이터 업데이트
update payment p
set p.method = '카카오페이',p.payment_state = '결제완료';

-- 1번 유저가 1번 가게에 평점 3점, 맛있는데 아쉽습니다 라는 리뷰를 남긴다
insert into review(review_img,review_comment,review_rating,user_id,store_id) values
('https://adsad.com/qewrwqew','너무 맛있어요!',5,2,1);

-- 업주 대댓글
insert into review_comment(comment,buser_id,review_id) values
('찾아주셔서 감사합니다 다음엔 더 맛있는 음식으로 보답하겠습니다',1,5);

insert into review_comment(comment,buser_id,review_id) values
('좋은리뷰 감사합니다 다음엔 더 맛있는 음식으로 보답하겠습니다',1,6);