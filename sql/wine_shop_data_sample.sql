use project_winebouti;

set foreign_key_checks = 0;
TRUNCATE TABLE Member;
TRUNCATE TABLE Auth  ;
TRUNCATE TABLE persistent_login;
TRUNCATE TABLE Product;
TRUNCATE TABLE Wine  ;
TRUNCATE TABLE Purchase;
TRUNCATE TABLE Review;
TRUNCATE TABLE Purchase_Product;
TRUNCATE TABLE Coupon;
TRUNCATE TABLE CouponDetail;
TRUNCATE TABLE Purchase_Coupon;
TRUNCATE TABLE RecentVisits;
set foreign_key_checks = 1;

/*
-- Member 테이블에 샘플 데이터 20개 추가
INSERT INTO Member (username, password, email, address, zipcode, profile_image_name, real_profile_image_name, phone_number)
VALUES 
('user1', 'password1', 'user1@example.com', 'Address 1', '11111', 'user1_profile.png', 'user1_real_profile.png', '0103141592'),
('user2', 'password2', 'user2@example.com', 'Address 2', '22222', 'user2_profile.png', 'user2_real_profile.png', '0103141593'),
('user3', 'password3', 'user3@example.com', 'Address 3', '33333', 'user3_profile.png', 'user3_real_profile.png', '0103141594'),
('user4', 'password4', 'user4@example.com', 'Address 4', '44444', 'user4_profile.png', 'user4_real_profile.png', '0103141595'),
('user5', 'password5', 'user5@example.com', 'Address 5', '55555', 'user5_profile.png', 'user5_real_profile.png', '0103141596'),
('user6', 'password6', 'user6@example.com', 'Address 6', '66666', 'user6_profile.png', 'user6_real_profile.png', '0103141597'),
('user7', 'password7', 'user7@example.com', 'Address 7', '77777', 'user7_profile.png', 'user7_real_profile.png', '0103141598'),
('user8', 'password8', 'user8@example.com', 'Address 8', '88888', 'user8_profile.png', 'user8_real_profile.png', '0103141599'),
('user9', 'password9', 'user9@example.com', 'Address 9', '99999', 'user9_profile.png', 'user9_real_profile.png', '0103141600'),
('user10', 'password10', 'user10@example.com', 'Address 10', '10000', 'user10_profile.png', 'user10_real_profile.png', '0103141601'),
('user11', 'password11', 'user11@example.com', 'Address 11', '11111', 'user11_profile.png', 'user11_real_profile.png', '0103141602'),
('user12', 'password12', 'user12@example.com', 'Address 12', '12222', 'user12_profile.png', 'user12_real_profile.png', '0103141603'),
('user13', 'password13', 'user13@example.com', 'Address 13', '13333', 'user13_profile.png', 'user13_real_profile.png', '0103141604'),
('user14', 'password14', 'user14@example.com', 'Address 14', '14444', 'user14_profile.png', 'user14_real_profile.png', '0103141605'),
('user15', 'password15', 'user15@example.com', 'Address 15', '15555', 'user15_profile.png', 'user15_real_profile.png', '0103141606'),
('user16', 'password16', 'user16@example.com', 'Address 16', '16666', 'user16_profile.png', 'user16_real_profile.png', '0103141607'),
('user17', 'password17', 'user17@example.com', 'Address 17', '17777', 'user17_profile.png', 'user17_real_profile.png', '0103141608'),
('user18', 'password18', 'user18@example.com', 'Address 18', '18888', 'user18_profile.png', 'user18_real_profile.png', '0103141609'),
('user19', 'password19', 'user19@example.com', 'Address 19', '19999', 'user19_profile.png', 'user19_real_profile.png', '0103141610'),
('user20', 'password20', 'user20@example.com', 'Address 20', '20000', 'user20_profile.png', 'user20_real_profile.png', '0103141611');


-- Auth 테이블에 샘플 데이터 20개 추가
INSERT INTO Auth (auth, email)
VALUES 
('ROLE_ADMIN', 'user1@example.com'),
('ROLE_ADMIN', 'user2@example.com'),
('ROLE_ADMIN', 'user3@example.com'),
('ROLE_USER', 'user4@example.com'),
('ROLE_USER', 'user5@example.com'),
('ROLE_USER', 'user6@example.com'),
('ROLE_USER', 'user7@example.com'),
('ROLE_USER', 'user8@example.com'),
('ROLE_USER', 'user9@example.com'),
('ROLE_ADMIN', 'user10@example.com'),
('ROLE_ADMIN', 'user11@example.com'),
('ROLE_ADMIN', 'user12@example.com'),
('ROLE_USER', 'user13@example.com'),
('ROLE_USER', 'user14@example.com'),
('ROLE_USER', 'user15@example.com'),
('ROLE_ADMIN', 'user16@example.com'),
('ROLE_USER', 'user17@example.com'),
('ROLE_USER', 'user18@example.com'),
('ROLE_USER', 'user19@example.com'),
('ROLE_ADMIN', 'user20@example.com');


-- persistent_login 테이블에 샘플 데이터 20개 추가
INSERT INTO persistent_login (series, username, token)
VALUES 
('series1', 'user1@example.com', 'token1'),
('series2', 'user2@example.com', 'token2'),
('series3', 'user3@example.com', 'token3'),
('series4', 'user4@example.com', 'token4'),
('series5', 'user5@example.com', 'token5'),
('series6', 'user6@example.com', 'token6'),
('series7', 'user7@example.com', 'token7'),
('series8', 'user8@example.com', 'token8'),
('series9', 'user9@example.com', 'token9'),
('series10', 'user10@example.com', 'token10'),
('series11', 'user11@example.com', 'token11'),
('series12', 'user12@example.com', 'token12'),
('series13', 'user13@example.com', 'token13'),
('series14', 'user14@example.com', 'token14'),
('series15', 'user15@example.com', 'token15'),
('series16', 'user16@example.com', 'token16'),
('series17', 'user17@example.com', 'token17'),
('series18', 'user18@example.com', 'token18'),
('series19', 'user19@example.com', 'token19'),
('series20', 'user20@example.com', 'token20');
*/

INSERT INTO Product (category, korean_name, product_image_name, real_product_image_name, detail_image_name, real_detail_image_name, original_price, once)
VALUES 
('Wine', '레드 와인 1', 'wine_red1.png', 'wine_red1_DOT_png', 'wine_red1_detail.png', 'wine_red1_detail_DOT_png', 10000, TRUE),
('Wine', '화이트 와인 2', 'wine_white2.png', 'wine_white2_DOT_png', 'wine_white2_detail.png', 'wine_white2_detail_DOT_png', 15000, FALSE),
('Wine', '레드 와인 3', 'wine_red3.png', 'wine_red3_DOT_png', 'wine_red3_detail.png', 'wine_red3_detail_DOT_png', 20000, TRUE),
('Wine', '화이트 와인 4', 'wine_white4.png', 'wine_white4_DOT_png', 'wine_white4_detail.png', 'wine_white4_detail_DOT_png', 18000, FALSE),
('Wine', '레드 와인 5', 'wine_red5.png', 'wine_red5_DOT_png', 'wine_red5_detail.png', 'wine_red5_detail_DOT_png', 22000, TRUE),
('Wine', '화이트 와인 6', 'wine_white6.png', 'wine_white6_DOT_png', 'wine_white6_detail.png', 'wine_white6_detail_DOT_png', 25000, FALSE),
('Wine', '레드 와인 7', 'wine_red7.png', 'wine_red7_DOT_png', 'wine_red7_detail.png', 'wine_red7_detail_DOT_png', 30000, TRUE),
('Wine', '화이트 와인 8', 'wine_white8.png', 'wine_white8_DOT_png', 'wine_white8_detail.png', 'wine_white8_detail_DOT_png', 35000, FALSE),
('Wine', '레드 와인 9', 'wine_red9.png', 'wine_red9_DOT_png', 'wine_red9_detail.png', 'wine_red9_detail_DOT_png', 28000, TRUE),
('Wine', '화이트 와인 10', 'wine_white10.png', 'wine_white10_DOT_png', 'wine_white10_detail.png', 'wine_white10_detail_DOT_png', 22000, FALSE),
('Wine', '레드 와인 11', 'wine_red11.png', 'wine_red11_DOT_png', 'wine_red11_detail.png', 'wine_red11_detail_DOT_png', 24000, TRUE),
('Wine', '화이트 와인 12', 'wine_white12.png', 'wine_white12_DOT_png', 'wine_white12_detail.png', 'wine_white12_detail_DOT_png', 26000, FALSE),
('Wine', '레드 와인 13', 'wine_red13.png', 'wine_red13_DOT_png', 'wine_red13_detail.png', 'wine_red13_detail_DOT_png', 20000, TRUE),
('Wine', '화이트 와인 14', 'wine_white14.png', 'wine_white14_DOT_png', 'wine_white14_detail.png', 'wine_white14_detail_DOT_png', 17000, FALSE),
('Wine', '레드 와인 15', 'wine_red15.png', 'wine_red15_DOT_png', 'wine_red15_detail.png', 'wine_red15_detail_DOT_png', 15000, TRUE),
('Wine', '화이트 와인 16', 'wine_white16.png', 'wine_white16_DOT_png', 'wine_white16_detail.png', 'wine_white16_detail_DOT_png', 19000, FALSE),
('Wine', '레드 와인 17', 'wine_red17.png', 'wine_red17_DOT_png', 'wine_red17_detail.png', 'wine_red17_detail_DOT_png', 22000, TRUE),
('Wine', '화이트 와인 18', 'wine_white18.png', 'wine_white18_DOT_png', 'wine_white18_detail.png', 'wine_white18_detail_DOT_png', 23000, FALSE),
('Wine', '레드 와인 19', 'wine_red19.png', 'wine_red19_DOT_png', 'wine_red19_detail.png', 'wine_red19_detail_DOT_png', 24000, TRUE),
('Wine', '화이트 와인 20', 'wine_white20.png', 'wine_white20_DOT_png', 'wine_white20_detail.png', 'wine_white20_detail_DOT_png', 25000, FALSE);




-- Wine 테이블에 샘플 데이터 20개 추가
INSERT INTO Wine (wine_id, type, original_name, volume, origin, vintage, alcohol_content, acidity, sweetness, tannins)
VALUES 
(1, 'Red', 'Wine A', 750, 'France', 2018, 12.5, 3, 2, 5),
(2, 'White', 'Wine B', 750, 'Italy', 2019, 13.0, 2, 3, 4),
(3, 'Red', 'Wine C', 750, 'Spain', 2017, 14.0, 4, 1, 3),
(4, 'White', 'Wine D', 750, 'USA', 2020, 11.5, 1, 4, 2),
(5, 'Red', 'Wine E', 750, 'Chile', 2015, 15.0, 5, 2, 6),
(6, 'White', 'Wine F', 750, 'Argentina', 2016, 12.0, 3, 5, 4),
(7, 'Red', 'Wine G', 750, 'France', 2014, 13.5, 2, 3, 5),
(8, 'White', 'Wine H', 750, 'Australia', 2021, 11.0, 4, 1, 2),
(9, 'Red', 'Wine I', 750, 'Italy', 2019, 14.5, 3, 4, 6),
(10, 'White', 'Wine J', 750, 'Spain', 2018, 13.0, 2, 2, 5),
(11, 'Red', 'Wine K', 750, 'USA', 2020, 15.5, 4, 3, 4),
(12, 'White', 'Wine L', 750, 'Argentina', 2020, 12.5, 1, 4, 3),
(13, 'Red', 'Wine M', 750, 'Chile', 2017, 13.5, 5, 2, 6),
(14, 'White', 'Wine N', 750, 'Australia', 2019, 11.5, 3, 5, 2),
(15, 'Red', 'Wine O', 750, 'France', 2020, 14.0, 2, 4, 4),
(16, 'White', 'Wine P', 750, 'Italy', 2018, 12.0, 4, 1, 3),
(17, 'Red', 'Wine Q', 750, 'Spain', 2016, 13.0, 3, 2, 5),
(18, 'White', 'Wine R', 750, 'USA', 2020, 12.5, 2, 3, 4),
(19, 'Red', 'Wine S', 750, 'Chile', 2015, 14.0, 4, 2, 6),
(20, 'White', 'Wine T', 750, 'Argentina', 2021, 11.5, 3, 5, 3);

/*
-- Purchase 테이블에 샘플 데이터 20개 추가
INSERT INTO Purchase (purchase_id, member_id, address, total_price, order_name)
VALUES 
(UNHEX('6b3a9b1d98d84cfc8d9edc8d2d8f02c4'), 1, 'Address 1', 20000  , 'test order 01'),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 2, 'Address 2', 15000  , 'test order 02'),
(UNHEX('f91b3f0b86ff46b4a8bb9065d8b94030'), 3, 'Address 3', 60000  , 'test order 03'),
(UNHEX('2a6c0cdaaf7b4a758d24245c7731a94e'), 4, 'Address 4', 36000  , 'test order 04'),
(UNHEX('3c8c98beccbd466dbb07decb8c5fc8a6'), 5, 'Address 5', 22000  , 'test order 05'),
(UNHEX('b192c5bc592a4666b57a6c3b045b0d88'), 6, 'Address 6', 100000 , 'test order 06'),
(UNHEX('968b6f0b30c74ee9bf748b1b0ff34818'), 7, 'Address 7', 44000  , 'test order 07'),
(UNHEX('429a3cc8d47a49229b3fd67f09a1d201'), 8, 'Address 8', 63000  , 'test order 08'),
(UNHEX('19891d8b383a4be7b42fb2826d2e122e'), 9, 'Address 9', 28000  , 'test order 09'),
(UNHEX('5e31940bb2274a479fb4e90e7b5473c9'), 10, 'Address 10', 44000, 'test order 10'),
(UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), 11, 'Address 11', 48000, 'test order 11'),
(UNHEX('5a5e7386a24f4a2a8380739f029dd1ff'), 12, 'Address 12', 26000, 'test order 12'),
(UNHEX('a6b7468ad29f4c16b43e4cfb7a593bfa'), 13, 'Address 13', 72000, 'test order 13'),
(UNHEX('8cc5fa3b5c6b418189d00477bca4c6c7'), 14, 'Address 14', 34000, 'test order 14'),
(UNHEX('b9f9e4f8ca634fcb8d54b9b92647e0f7'), 15, 'Address 15', 30000, 'test order 15'),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 16, 'Address 16', 22000, 'test order 16'),
(UNHEX('99ed1798d8a7405c8a50a6c29a433107'), 17, 'Address 17', 44000, 'test order 17'),
(UNHEX('f346cb2bb9c94fa79925c8716e49fcdf'), 18, 'Address 18', 23000, 'test order 18'),
(UNHEX('268d27898686461f9c5055f2a8e79c0b'), 19, 'Address 19', 72000, 'test order 19'),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 20, 'Address 20', 50000, 'test order 20');


-- Review 테이블에 샘플 데이터 20개 추가 (한국어 리뷰 내용)
INSERT INTO Review (product_id, member_id, purchase_id, title, content, star, is_open, password, response) 
VALUES  
(1, 1, UNHEX('6b3a9b1d98d84cfc8d9edc8d2d8f02c4'), '최고의 와인, 강력 추천!', '정말 좋은 품질의 와인입니다. 강력히 추천합니다!', 5, TRUE, 'password1', '감사합니다!'),
(2, 2, UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), '좋지만 가격이 부담스러워요', '맛은 좋지만 가격이 비쌉니다.', 3, TRUE, 'password2', '소중한 의견 감사합니다!'),
(3, 3, UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), '기대보다 별로였습니다.', '다시 사지 않을 것 같아요. 기대보다 별로였습니다.', 2, FALSE, 'password3', '불편을 드려 죄송합니다. 더 나은 제품을 위해 노력하겠습니다.'),
(4, 4, UNHEX('2a6c0cdaaf7b4a758d24245c7731a94e'), '가성비 갑! 만족합니다.', '이 가격에 이 정도 품질이라면 아주 만족합니다.', 5, TRUE, 'password4', '좋게 봐주셔서 감사합니다!'),
(5, 5, UNHEX('2a6c0cdaaf7b4a758d24245c7731a94e'), '선물용으로 딱이에요!', '친구에게 선물했는데 아주 좋아했어요!', 5, TRUE, 'password5', '좋은 반응을 얻어 기쁩니다!'),
(6, 6, UNHEX('2a6c0cdaaf7b4a758d24245c7731a94e'), '가격 대비 만족스러운 와인', '가성비가 뛰어난 제품입니다.', 4, TRUE, 'password6', '좋게 평가해주셔서 감사합니다!'),
(7, 7, UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), '평범한 와인이었어요.', '일반적인 와인입니다. 특별한 느낌은 없어요.', 3, FALSE, 'password7', '더 좋은 제품을 제공할 수 있도록 노력하겠습니다.'),
(8, 8, UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), '너무 달아서 제 스타일이 아니었어요', '너무 달고 강한 맛이었어요. 제 취향은 아니었어요.', 2, FALSE, 'password8', '피드백 감사합니다. 개선하도록 하겠습니다.'),
(9, 9, UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), '앞으로 자주 구매할 와인!', '정말 맛있는 와인, 앞으로 자주 구매할 예정입니다.', 5, TRUE, 'password9', '감사합니다!'),
(10, 10, UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), '파티에서 인기 폭발!', '파티에서 정말 잘 어울리는 와인이었어요.', 5, TRUE, 'password10', '좋은 리뷰 감사합니다!'),
(11, 11, UNHEX('4e32029c5db64044a89061cd5ad21d83'), '훌륭한 품질, 재구매 예정', '훌륭한 품질의 와인, 또 구매할게요.', 5, TRUE, 'password11', '좋은 리뷰 감사합니다!'),
(12, 12, UNHEX('4e32029c5db64044a89061cd5ad21d83'), '기대만큼은 아니었어요.', '그저 그렇네요. 기대보다는 별로였어요.', 3, FALSE, 'password12', '품질 개선을 위해 노력하겠습니다!'),
(13, 13, UNHEX('4e32029c5db64044a89061cd5ad21d83'), '내 인생 최고의 레드 와인!', '지금까지 먹어본 최고의 레드 와인입니다.', 5, TRUE, 'password13', '이렇게 좋아해주셔서 감사합니다!'),
(14, 14, UNHEX('4e32029c5db64044a89061cd5ad21d83'), '나쁘진 않지만 비쌌어요.', '나쁘지 않지만 가격이 너무 비쌉니다.', 3, FALSE, 'password14', '피드백 감사합니다!'),
(15, 15, UNHEX('4e32029c5db64044a89061cd5ad21d83'), '부드럽고 풍부한 맛이 인상적', '부드럽고 풍부한 맛이 정말 좋습니다.', 5, TRUE, 'password15', '좋아해 주셔서 감사합니다!'),
(16, 16, UNHEX('f79d71ef90b9419f9a43f748010caa45'), '쓴맛이 강해서 아쉬웠어요.', '제 입맛에는 너무 쓴 맛이 강했습니다.', 2, FALSE, 'password16', '소중한 피드백 감사합니다. 개선하겠습니다.'),
(17, 17, UNHEX('f79d71ef90b9419f9a43f748010caa45'), '특별한 날에 좋은 와인', '특별한 날에 좋은 와인입니다.', 4, TRUE, 'password17', '좋은 리뷰 감사합니다!'),
(18, 18, UNHEX('f79d71ef90b9419f9a43f748010caa45'), '강한 맛이지만 품질은 좋음', '너무 강한 맛이었지만 품질은 좋았습니다.', 3, FALSE, 'password18', '의견 감사합니다!'),
(19, 19, UNHEX('f79d71ef90b9419f9a43f748010caa45'), '내가 제일 좋아하는 와인!', '제일 좋아하는 레드 와인입니다.', 5, TRUE, 'password19', '이렇게 좋아해 주셔서 감사합니다!'),
(20, 20, UNHEX('f79d71ef90b9419f9a43f748010caa45'), '좋지만 다른 와인을 선호해요.', '좋지만 다른 종류를 선호합니다.', 3, FALSE, 'password20', '피드백 감사합니다!');

-- Purchase_Product 테이블에 샘플 데이터 20개 추가
INSERT INTO Purchase_Product (purchase_id, product_id, quantity)
VALUES 
(UNHEX('6b3a9b1d98d84cfc8d9edc8d2d8f02c4'), 1, 2),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 2, 1),
(UNHEX('f91b3f0b86ff46b4a8bb9065d8b94030'), 3, 3),
(UNHEX('2a6c0cdaaf7b4a758d24245c7731a94e'), 4, 2),
(UNHEX('3c8c98beccbd466dbb07decb8c5fc8a6'), 5, 1),
(UNHEX('b192c5bc592a4666b57a6c3b045b0d88'), 6, 4),
(UNHEX('968b6f0b30c74ee9bf748b1b0ff34818'), 7, 2),
(UNHEX('429a3cc8d47a49229b3fd67f09a1d201'), 8, 3),
(UNHEX('19891d8b383a4be7b42fb2826d2e122e'), 9, 1),
(UNHEX('5e31940bb2274a479fb4e90e7b5473c9'), 10, 2),
(UNHEX('d12571c05ac745ff9d56a58ff5d6db4a'), 11, 2),
(UNHEX('5a5e7386a24f4a2a8380739f029dd1ff'), 12, 1),
(UNHEX('a6b7468ad29f4c16b43e4cfb7a593bfa'), 13, 3),
(UNHEX('8cc5fa3b5c6b418189d00477bca4c6c7'), 14, 2),
(UNHEX('b9f9e4f8ca634fcb8d54b9b92647e0f7'), 15, 2),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 16, 1),
(UNHEX('99ed1798d8a7405c8a50a6c29a433107'), 17, 2),
(UNHEX('f346cb2bb9c94fa79925c8716e49fcdf'), 18, 1),
(UNHEX('268d27898686461f9c5055f2a8e79c0b'), 19, 3),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 20, 2);


-- Coupon 테이블에 샘플 데이터 20개 추가
INSERT INTO Coupon (name, fixed_discount, percent_discount, expire_date)
VALUES 
('Coupon 1', 5000, 0, '2025-01-01'),
('Coupon 2', 0, 10, '2025-02-01'),
('Coupon 3', 2000, 0, '2025-03-01'),
('Coupon 4', 0, 15, '2025-04-01'),
('Coupon 5', 5000, 0, '2025-05-01'),
('Coupon 6', 0, 5, '2025-06-01'),
('Coupon 7', 3000, 0, '2025-07-01'),
('Coupon 8', 0, 20, '2025-08-01'),
('Coupon 9', 1000, 0, '2025-09-01'),
('Coupon 10', 0, 25, '2025-10-01'),
('Coupon 11', 7000, 0, '2025-11-01'),
('Coupon 12', 0, 30, '2025-12-01'),
('Coupon 13', 4000, 0, '2026-01-01'),
('Coupon 14', 0, 10, '2026-02-01'),
('Coupon 15', 6000, 0, '2026-03-01'),
('Coupon 16', 0, 5, '2026-04-01'),
('Coupon 17', 8000, 0, '2026-05-01'),
('Coupon 18', 0, 12, '2026-06-01'),
('Coupon 19', 9000, 0, '2026-07-01'),
('Coupon 20', 0, 18, '2026-08-01');

-- CouponDetail 테이블에 샘플 데이터 20개 추가
INSERT INTO CouponDetail (member_id, coupon_id, is_used)
VALUES 
(1, 1, FALSE),
(2, 2, TRUE),
(3, 3, FALSE),
(4, 4, TRUE),
(5, 5, FALSE),
(6, 6, TRUE),
(7, 7, FALSE),
(8, 8, TRUE),
(9, 9, FALSE),
(10, 10, TRUE),
(11, 11, FALSE),
(12, 12, TRUE),
(13, 13, FALSE),
(14, 14, TRUE),
(15, 15, FALSE),
(16, 16, TRUE),
(17, 17, FALSE),
(18, 18, TRUE),
(19, 19, FALSE),
(20, 20, TRUE);

-- Purchase_Coupon 테이블에 샘플 데이터 20개 추가
INSERT INTO Purchase_Coupon (purchase_id, coupon_id)
VALUES 
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 1),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 2),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 3),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 4),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 5),
(UNHEX('f79d71ef90b9419f9a43f748010caa45'), 6),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 7),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 8),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 9),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 10),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 11),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 12),
(UNHEX('4e32029c5db64044a89061cd5ad21d83'), 13),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 14),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 15),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 16),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 17),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 18),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 19),
(UNHEX('6d3f0b1a98374f00bc79fdb5b8f92827'), 20);

-- RecentVisits 테이블에 샘플 데이터 20개 추가
INSERT INTO RecentVisits (member_id, product_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);
*/

-- gift_set 카테고리 상품 삽입
INSERT INTO Product (category, korean_name, product_image_name, real_product_image_name, detail_image_name, real_detail_image_name, original_price, once)
VALUES
('gift_set', '선물 세트 1', 'gift_set1.png', 'gift_set1_DOT_png', 'gift_set1_detail.png', 'gift_set1_detail_DOT_png', 50000, TRUE),
('gift_set', '선물 세트 2', 'gift_set2.png', 'gift_set2_DOT_png', 'gift_set2_detail.png', 'gift_set2_detail_DOT_png', 60000, FALSE),
('gift_set', '선물 세트 3', 'gift_set3.png', 'gift_set3_DOT_png', 'gift_set3_detail.png', 'gift_set3_detail_DOT_png', 70000, TRUE),
('gift_set', '선물 세트 4', 'gift_set4.png', 'gift_set4_DOT_png', 'gift_set4_detail.png', 'gift_set4_detail_DOT_png', 75000, FALSE),
('gift_set', '선물 세트 5', 'gift_set5.png', 'gift_set5_DOT_png', 'gift_set5_detail.png', 'gift_set5_detail_DOT_png', 80000, TRUE);


-- pairing 카테고리 상품 삽입
INSERT INTO Product (category, korean_name, product_image_name, real_product_image_name, detail_image_name, real_detail_image_name, original_price, once)
VALUES
('pairing', '페어링 세트 1', 'pairing_set1.png', 'pairing_set1_DOT_png', 'pairing_set1_detail.png', 'pairing_set1_detail_DOT_png', 45000, TRUE),
('pairing', '페어링 세트 2', 'pairing_set2.png', 'pairing_set2_DOT_png', 'pairing_set2_detail.png', 'pairing_set2_detail_DOT_png', 50000, FALSE),
('pairing', '페어링 세트 3', 'pairing_set3.png', 'pairing_set3_DOT_png', 'pairing_set3_detail.png', 'pairing_set3_detail_DOT_png', 55000, TRUE),
('pairing', '페어링 세트 4', 'pairing_set4.png', 'pairing_set4_DOT_png', 'pairing_set4_detail.png', 'pairing_set4_detail_DOT_png', 60000, FALSE),
('pairing', '페어링 세트 5', 'pairing_set5.png', 'pairing_set5_DOT_png', 'pairing_set5_detail.png', 'pairing_set5_detail_DOT_png', 65000, TRUE);




-- Wine 카테고리에서 Sparkle Wine 샘플 데이터 10개 추가

INSERT INTO Product (category, korean_name, product_image_name, real_product_image_name, detail_image_name, real_detail_image_name, original_price, once)
VALUES 
('Wine', '스파클 와인 1', 'sparkle_wine1.png', 'sparkle_wine1_DOT_png', 'sparkle_wine1_detail.png', 'sparkle_wine1_detail_DOT_png', 15000, TRUE),
('Wine', '스파클 와인 2', 'sparkle_wine2.png', 'sparkle_wine2_DOT_png', 'sparkle_wine2_detail.png', 'sparkle_wine2_detail_DOT_png', 18000, FALSE),
('Wine', '스파클 와인 3', 'sparkle_wine3.png', 'sparkle_wine3_DOT_png', 'sparkle_wine3_detail.png', 'sparkle_wine3_detail_DOT_png', 20000, TRUE),
('Wine', '스파클 와인 4', 'sparkle_wine4.png', 'sparkle_wine4_DOT_png', 'sparkle_wine4_detail.png', 'sparkle_wine4_detail_DOT_png', 25000, FALSE),
('Wine', '스파클 와인 5', 'sparkle_wine5.png', 'sparkle_wine5_DOT_png', 'sparkle_wine5_detail.png', 'sparkle_wine5_detail_DOT_png', 30000, TRUE),
('Wine', '스파클 와인 6', 'sparkle_wine6.png', 'sparkle_wine6_DOT_png', 'sparkle_wine6_detail.png', 'sparkle_wine6_detail_DOT_png', 35000, FALSE),
('Wine', '스파클 와인 7', 'sparkle_wine7.png', 'sparkle_wine7_DOT_png', 'sparkle_wine7_detail.png', 'sparkle_wine7_detail_DOT_png', 22000, TRUE),
('Wine', '스파클 와인 8', 'sparkle_wine8.png', 'sparkle_wine8_DOT_png', 'sparkle_wine8_detail.png', 'sparkle_wine8_detail_DOT_png', 24000, FALSE),
('Wine', '스파클 와인 9', 'sparkle_wine9.png', 'sparkle_wine9_DOT_png', 'sparkle_wine9_detail.png', 'sparkle_wine9_detail_DOT_png', 27000, TRUE),
('Wine', '스파클 와인 10', 'sparkle_wine10.png', 'sparkle_wine10_DOT_png', 'sparkle_wine10_detail.png', 'sparkle_wine10_detail_DOT_png', 32000, FALSE);


-- Wine 테이블에 샘플 데이터 15개 추가 (5개의 pairing + 10개의 sparkle)
INSERT INTO Wine (wine_id, type, original_name, volume, origin, vintage, alcohol_content, acidity, sweetness, tannins)
VALUES 
-- Sparkle 와인 (10개)
(31, 'Sparkle', 'Sparkle Wine 1', 750, 'France', 2018, 12.5, 3, 2, 5),
(32, 'Sparkle', 'Sparkle Wine 2', 750, 'Italy', 2019, 13.0, 2, 3, 4),
(33, 'Sparkle', 'Sparkle Wine 3', 750, 'Spain', 2017, 14.0, 4, 1, 3),
(34, 'Sparkle', 'Sparkle Wine 4', 750, 'USA', 2020, 11.5, 1, 4, 2),
(35, 'Sparkle', 'Sparkle Wine 5', 750, 'Chile', 2015, 15.0, 5, 2, 6),
(36, 'Sparkle', 'Sparkle Wine 6', 750, 'Argentina', 2016, 12.0, 3, 5, 4),
(37, 'Sparkle', 'Sparkle Wine 7', 750, 'France', 2014, 13.5, 2, 3, 5),
(38, 'Sparkle', 'Sparkle Wine 8', 750, 'Australia', 2021, 11.0, 4, 1, 2),
(39, 'Sparkle', 'Sparkle Wine 9', 750, 'Italy', 2019, 14.5, 3, 4, 6),
(40, 'Sparkle', 'Sparkle Wine 10', 750, 'Spain', 2018, 13.0, 2, 2, 5);

