-- 유저 데이터 조회
select * from user;

-- 가게 정보 조회
select * from store;

-- 카테고리 정보 데이터 조회
select * from category_info;

-- 가게 카테고리 데이터 조회
select * from store_category;

-- 가게정보 전체 데이터 조회
select store_name as 상호명,address as 주소,intro as 가게설명,category_name as 가게카테고리 from store s 
inner join store_category sc on s.store_id = sc.store_id 
inner join category_info ci on sc.s_category_info_id = ci.category_info_id;

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
    
-- 결제 결과
select order_id as 주문번호,method as 결제방식,amount as 결제가격,payment_created_at as 결제날짜,payment_state as 결제여부 from payment;

-- 결제 완료한 메뉴
select mc.menu_category_name as 메뉴카테고리, m.menu_name as 메뉴명,oi.quantity as 수량,oi.price as 가격, (oi.price * oi.quantity) as 총가격, p.payment_state as 결제여부 from payment p 
	inner join orders o on p.order_id = o.order_id 
	inner join order_item oi on o.order_id = oi.order_id 
	inner join menu m on oi.menu_id  = m.menu_id  
	inner join menu_category mc on m.menu_category_id  = mc.menu_category_id
	where p.payment_state = '결제완료';
    
-- 모든 리뷰 조회
select store_name as 가게이름, r.review_rating as 평점, r.review_img as 이미지링크, r.review_comment as 리뷰내용 from store s 
	left join review r on s.store_id = r.store_id ;

-- 가게별 평점 조회
select store_name as 가게이름, r.avg_rating as 평점 from store s 
	left join (select store_id,AVG(review_rating) as avg_rating from review group by store_id) r on s.store_id = r.store_id;
    
-- 모든 리뷰의 대댓글 조회
select store_name as 가게이름, r.review_rating as 평점, r.review_img as 이미지링크, r.review_comment as 리뷰내용,rc.comment as 대댓글 from store s 
	left join review r on s.store_id = r.store_id 
	left join review_comment rc on r.review_id =rc.review_id;