-- Member 테이블에 샘플 데이터 20개 추가
INSERT INTO Member (username, password, email, address, zipcode, profile_image_name, real_profile_image_name)
VALUES 
('user1', 'password1', 'user1@example.com', 'Address 1', '11111', 'user1_profile.jpg', 'user1_real_profile.jpg'),
('user2', 'password2', 'user2@example.com', 'Address 2', '22222', 'user2_profile.jpg', 'user2_real_profile.jpg'),
('user3', 'password3', 'user3@example.com', 'Address 3', '33333', 'user3_profile.jpg', 'user3_real_profile.jpg'),
('user4', 'password4', 'user4@example.com', 'Address 4', '44444', 'user4_profile.jpg', 'user4_real_profile.jpg'),
('user5', 'password5', 'user5@example.com', 'Address 5', '55555', 'user5_profile.jpg', 'user5_real_profile.jpg'),
('user6', 'password6', 'user6@example.com', 'Address 6', '66666', 'user6_profile.jpg', 'user6_real_profile.jpg'),
('user7', 'password7', 'user7@example.com', 'Address 7', '77777', 'user7_profile.jpg', 'user7_real_profile.jpg'),
('user8', 'password8', 'user8@example.com', 'Address 8', '88888', 'user8_profile.jpg', 'user8_real_profile.jpg'),
('user9', 'password9', 'user9@example.com', 'Address 9', '99999', 'user9_profile.jpg', 'user9_real_profile.jpg'),
('user10', 'password10', 'user10@example.com', 'Address 10', '10000', 'user10_profile.jpg', 'user10_real_profile.jpg'),
('user11', 'password11', 'user11@example.com', 'Address 11', '11111', 'user11_profile.jpg', 'user11_real_profile.jpg'),
('user12', 'password12', 'user12@example.com', 'Address 12', '12222', 'user12_profile.jpg', 'user12_real_profile.jpg'),
('user13', 'password13', 'user13@example.com', 'Address 13', '13333', 'user13_profile.jpg', 'user13_real_profile.jpg'),
('user14', 'password14', 'user14@example.com', 'Address 14', '14444', 'user14_profile.jpg', 'user14_real_profile.jpg'),
('user15', 'password15', 'user15@example.com', 'Address 15', '15555', 'user15_profile.jpg', 'user15_real_profile.jpg'),
('user16', 'password16', 'user16@example.com', 'Address 16', '16666', 'user16_profile.jpg', 'user16_real_profile.jpg'),
('user17', 'password17', 'user17@example.com', 'Address 17', '17777', 'user17_profile.jpg', 'user17_real_profile.jpg'),
('user18', 'password18', 'user18@example.com', 'Address 18', '18888', 'user18_profile.jpg', 'user18_real_profile.jpg'),
('user19', 'password19', 'user19@example.com', 'Address 19', '19999', 'user19_profile.jpg', 'user19_real_profile.jpg'),
('user20', 'password20', 'user20@example.com', 'Address 20', '20000', 'user20_profile.jpg', 'user20_real_profile.jpg');

-- Auth 테이블에 샘플 데이터 20개 추가
INSERT INTO Auth (auth, username)
VALUES 
('admin', 'user1'),
('admin', 'user2'),
('admin', 'user3'),
('user', 'user4'),
('user', 'user5'),
('user', 'user6'),
('user', 'user7'),
('user', 'user8'),
('user', 'user9'),
('admin', 'user10'),
('admin', 'user11'),
('admin', 'user12'),
('user', 'user13'),
('user', 'user14'),
('user', 'user15'),
('admin', 'user16'),
('user', 'user17'),
('user', 'user18'),
('user', 'user19'),
('admin', 'user20');

-- persistent_login 테이블에 샘플 데이터 20개 추가
INSERT INTO persistent_login (series, username, token)
VALUES 
('series1', 'user1', 'token1'),
('series2', 'user2', 'token2'),
('series3', 'user3', 'token3'),
('series4', 'user4', 'token4'),
('series5', 'user5', 'token5'),
('series6', 'user6', 'token6'),
('series7', 'user7', 'token7'),
('series8', 'user8', 'token8'),
('series9', 'user9', 'token9'),
('series10', 'user10', 'token10'),
('series11', 'user11', 'token11'),
('series12', 'user12', 'token12'),
('series13', 'user13', 'token13'),
('series14', 'user14', 'token14'),
('series15', 'user15', 'token15'),
('series16', 'user16', 'token16'),
('series17', 'user17', 'token17'),
('series18', 'user18', 'token18'),
('series19', 'user19', 'token19'),
('series20', 'user20', 'token20');

-- Product 테이블에 샘플 데이터 20개 추가
INSERT INTO Product (category, korean_name, product_image_name, real_product_image_name, detail_image_name, real_detail_image_name, original_price, once)
VALUES 
('Wine', '레드 와인 1', 'wine_red1.jpg', 'wine_red1_real.jpg', 'wine_red1_detail.jpg', 'wine_red1_detail_real.jpg', 10000, TRUE),
('Wine', '화이트 와인 2', 'wine_white2.jpg', 'wine_white2_real.jpg', 'wine_white2_detail.jpg', 'wine_white2_detail_real.jpg', 15000, FALSE),
('Wine', '레드 와인 3', 'wine_red3.jpg', 'wine_red3_real.jpg', 'wine_red3_detail.jpg', 'wine_red3_detail_real.jpg', 20000, TRUE),
('Wine', '화이트 와인 4', 'wine_white4.jpg', 'wine_white4_real.jpg', 'wine_white4_detail.jpg', 'wine_white4_detail_real.jpg', 18000, FALSE),
('Wine', '레드 와인 5', 'wine_red5.jpg', 'wine_red5_real.jpg', 'wine_red5_detail.jpg', 'wine_red5_detail_real.jpg', 22000, TRUE),
('Wine', '화이트 와인 6', 'wine_white6.jpg', 'wine_white6_real.jpg', 'wine_white6_detail.jpg', 'wine_white6_detail_real.jpg', 25000, FALSE),
('Wine', '레드 와인 7', 'wine_red7.jpg', 'wine_red7_real.jpg', 'wine_red7_detail.jpg', 'wine_red7_detail_real.jpg', 30000, TRUE),
('Wine', '화이트 와인 8', 'wine_white8.jpg', 'wine_white8_real.jpg', 'wine_white8_detail.jpg', 'wine_white8_detail_real.jpg', 35000, FALSE),
('Wine', '레드 와인 9', 'wine_red9.jpg', 'wine_red9_real.jpg', 'wine_red9_detail.jpg', 'wine_red9_detail_real.jpg', 28000, TRUE),
('Wine', '화이트 와인 10', 'wine_white10.jpg', 'wine_white10_real.jpg', 'wine_white10_detail.jpg', 'wine_white10_detail_real.jpg', 22000, FALSE),
('Wine', '레드 와인 11', 'wine_red11.jpg', 'wine_red11_real.jpg', 'wine_red11_detail.jpg', 'wine_red11_detail_real.jpg', 24000, TRUE),
('Wine', '화이트 와인 12', 'wine_white12.jpg', 'wine_white12_real.jpg', 'wine_white12_detail.jpg', 'wine_white12_detail_real.jpg', 26000, FALSE),
('Wine', '레드 와인 13', 'wine_red13.jpg', 'wine_red13_real.jpg', 'wine_red13_detail.jpg', 'wine_red13_detail_real.jpg', 20000, TRUE),
('Wine', '화이트 와인 14', 'wine_white14.jpg', 'wine_white14_real.jpg', 'wine_white14_detail.jpg', 'wine_white14_detail_real.jpg', 17000, FALSE),
('Wine', '레드 와인 15', 'wine_red15.jpg', 'wine_red15_real.jpg', 'wine_red15_detail.jpg', 'wine_red15_detail_real.jpg', 15000, TRUE),
('Wine', '화이트 와인 16', 'wine_white16.jpg', 'wine_white16_real.jpg', 'wine_white16_detail.jpg', 'wine_white16_detail_real.jpg', 19000, FALSE),
('Wine', '레드 와인 17', 'wine_red17.jpg', 'wine_red17_real.jpg', 'wine_red17_detail.jpg', 'wine_red17_detail_real.jpg', 22000, TRUE),
('Wine', '화이트 와인 18', 'wine_white18.jpg', 'wine_white18_real.jpg', 'wine_white18_detail.jpg', 'wine_white18_detail_real.jpg', 23000, FALSE),
('Wine', '레드 와인 19', 'wine_red19.jpg', 'wine_red19_real.jpg', 'wine_red19_detail.jpg', 'wine_red19_detail_real.jpg', 24000, TRUE),
('Wine', '화이트 와인 20', 'wine_white20.jpg', 'wine_white20_real.jpg', 'wine_white20_detail.jpg', 'wine_white20_detail_real.jpg', 25000, FALSE);

-- Wine 테이블에 샘플 데이터 20개 추가
INSERT INTO Wine (type, original_name, volume, origin, vintage, alcohol_content, acidity, sweetness, tannins)
VALUES 
('Red', 'Wine A', 750, 'France', 2018, 12.5, 3, 2, 5),
('White', 'Wine B', 750, 'Italy', 2019, 13.0, 2, 3, 4),
('Red', 'Wine C', 750, 'Spain', 2017, 14.0, 4, 1, 3),
('White', 'Wine D', 750, 'USA', 2020, 11.5, 1, 4, 2),
('Red', 'Wine E', 750, 'Chile', 2015, 15.0, 5, 2, 6),
('White', 'Wine F', 750, 'Argentina', 2016, 12.0, 3, 5, 4),
('Red', 'Wine G', 750, 'France', 2014, 13.5, 2, 3, 5),
('White', 'Wine H', 750, 'Australia', 2021, 11.0, 4, 1, 2),
('Red', 'Wine I', 750, 'Italy', 2019, 14.5, 3, 4, 6),
('White', 'Wine J', 750, 'Spain', 2018, 13.0, 2, 2, 5),
('Red', 'Wine K', 750, 'USA', 2020, 15.5, 4, 3, 4),
('White', 'Wine L', 750, 'Argentina', 2020, 12.5, 1, 4, 3),
('Red', 'Wine M', 750, 'Chile', 2017, 13.5, 5, 2, 6),
('White', 'Wine N', 750, 'Australia', 2019, 11.5, 3, 5, 2),
('Red', 'Wine O', 750, 'France', 2020, 14.0, 2, 4, 4),
('White', 'Wine P', 750, 'Italy', 2018, 12.0, 4, 1, 3),
('Red', 'Wine Q', 750, 'Spain', 2016, 13.0, 3, 2, 5),
('White', 'Wine R', 750, 'USA', 2020, 12.5, 2, 3, 4),
('Red', 'Wine S', 750, 'Chile', 2015, 14.0, 4, 2, 6),
('White', 'Wine T', 750, 'Argentina', 2021, 11.5, 3, 5, 3);

-- Cart 테이블에 샘플 데이터 20개 추가
INSERT INTO Cart (member_id, product_id, quantity, total_amount)
VALUES 
(1, 1, 2, 20000),
(2, 2, 1, 15000),
(3, 3, 3, 60000),
(4, 4, 2, 36000),
(5, 5, 1, 22000),
(6, 6, 4, 100000),
(7, 7, 2, 44000),
(8, 8, 3, 63000),
(9, 9, 1, 28000),
(10, 10, 2, 44000),
(11, 11, 2, 48000),
(12, 12, 1, 26000),
(13, 13, 3, 72000),
(14, 14, 2, 34000),
(15, 15, 2, 30000),
(16, 16, 1, 22000),
(17, 17, 2, 44000),
(18, 18, 1, 23000),
(19, 19, 3, 72000),
(20, 20, 2, 50000);

-- Purchase 테이블에 샘플 데이터 20개 추가
INSERT INTO Purchase (member_id, address, total_amount)
VALUES 
(1, 'Address 1', 20000),
(2, 'Address 2', 15000),
(3, 'Address 3', 60000),
(4, 'Address 4', 36000),
(5, 'Address 5', 22000),
(6, 'Address 6', 100000),
(7, 'Address 7', 44000),
(8, 'Address 8', 63000),
(9, 'Address 9', 28000),
(10, 'Address 10', 44000),
(11, 'Address 11', 48000),
(12, 'Address 12', 26000),
(13, 'Address 13', 72000),
(14, 'Address 14', 34000),
(15, 'Address 15', 30000),
(16, 'Address 16', 22000),
(17, 'Address 17', 44000),
(18, 'Address 18', 23000),
(19, 'Address 19', 72000),
(20, 'Address 20', 50000);

-- Review 테이블에 샘플 데이터 20개 추가 (한국어 리뷰 내용)
INSERT INTO Review (product_id, member_id, purchase_id, content, star, is_open, password, response)
VALUES 
(1, 1, 1, '정말 좋은 품질의 와인입니다. 강력히 추천합니다!', 5, TRUE, 'password1', '감사합니다!'),
(2, 2, 2, '맛은 좋지만 가격이 비쌉니다.', 3, TRUE, 'password2', '소중한 의견 감사합니다!'),
(3, 3, 3, '다시 사지 않을 것 같아요. 기대보다 별로였습니다.', 2, FALSE, 'password3', '불편을 드려 죄송합니다. 더 나은 제품을 위해 노력하겠습니다.'),
(4, 4, 4, '이 가격에 이 정도 품질이라면 아주 만족합니다.', 5, TRUE, 'password4', '좋게 봐주셔서 감사합니다!'),
(5, 5, 5, '친구에게 선물했는데 아주 좋아했어요!', 5, TRUE, 'password5', '좋은 반응을 얻어 기쁩니다!'),
(6, 6, 6, '가성비가 뛰어난 제품입니다.', 4, TRUE, 'password6', '좋게 평가해주셔서 감사합니다!'),
(7, 7, 7, '일반적인 와인입니다. 특별한 느낌은 없어요.', 3, FALSE, 'password7', '더 좋은 제품을 제공할 수 있도록 노력하겠습니다.'),
(8, 8, 8, '너무 달고 강한 맛이었어요. 제 취향은 아니었어요.', 2, FALSE, 'password8', '피드백 감사합니다. 개선하도록 하겠습니다.'),
(9, 9, 9, '정말 맛있는 와인, 앞으로 자주 구매할 예정입니다.', 5, TRUE, 'password9', '감사합니다!'),
(10, 10, 10, '파티에서 정말 잘 어울리는 와인이었어요.', 5, TRUE, 'password10', '좋은 리뷰 감사합니다!'),
(11, 11, 11, '훌륭한 품질의 와인, 또 구매할게요.', 5, TRUE, 'password11', '좋은 리뷰 감사합니다!'),
(12, 12, 12, '그저 그렇네요. 기대보다는 별로였어요.', 3, FALSE, 'password12', '품질 개선을 위해 노력하겠습니다!'),
(13, 13, 13, '지금까지 먹어본 최고의 레드 와인입니다.', 5, TRUE, 'password13', '이렇게 좋아해주셔서 감사합니다!'),
(14, 14, 14, '나쁘지 않지만 가격이 너무 비쌉니다.', 3, FALSE, 'password14', '피드백 감사합니다!'),
(15, 15, 15, '부드럽고 풍부한 맛이 정말 좋습니다.', 5, TRUE, 'password15', '좋아해 주셔서 감사합니다!'),
(16, 16, 16, '제 입맛에는 너무 쓴 맛이 강했습니다.', 2, FALSE, 'password16', '소중한 피드백 감사합니다. 개선하겠습니다.'),
(17, 17, 17, '특별한 날에 좋은 와인입니다.', 4, TRUE, 'password17', '좋은 리뷰 감사합니다!'),
(18, 18, 18, '너무 강한 맛이었지만 품질은 좋았습니다.', 3, FALSE, 'password18', '의견 감사합니다!'),
(19, 19, 19, '제일 좋아하는 레드 와인입니다.', 5, TRUE, 'password19', '이렇게 좋아해 주셔서 감사합니다!'),
(20, 20, 20, '좋지만 다른 종류를 선호합니다.', 3, FALSE, 'password20', '피드백 감사합니다!');


-- Purchase_Product 테이블에 샘플 데이터 20개 추가
INSERT INTO Purchase_Product (purchase_id, product_id, quantity)
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 4),
(7, 7, 2),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2),
(11, 11, 2),
(12, 12, 1),
(13, 13, 3),
(14, 14, 2),
(15, 15, 2),
(16, 16, 1),
(17, 17, 2),
(18, 18, 1),
(19, 19, 3),
(20, 20, 2);

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
