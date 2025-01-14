-- Member 테이블 삭제
DROP TABLE IF EXISTS Member;

-- Auth 테이블 삭제
DROP TABLE IF EXISTS Auth;

-- persistent_login 테이블 삭제
DROP TABLE IF EXISTS persistent_login;

-- Product 테이블 삭제
DROP TABLE IF EXISTS Product;

-- Wine 테이블 삭제
DROP TABLE IF EXISTS Wine;

-- Cart 테이블 삭제
DROP TABLE IF EXISTS Cart;

-- Purchase 테이블 삭제
DROP TABLE IF EXISTS Purchase;

-- Review 테이블 삭제
DROP TABLE IF EXISTS Review;

-- Purchase_Product 테이블 삭제
DROP TABLE IF EXISTS Purchase_Product;

-- Coupon 테이블 삭제
DROP TABLE IF EXISTS Coupon;

-- CouponDetail 테이블 삭제
DROP TABLE IF EXISTS CouponDetail;

-- Purchase_Coupon 테이블 삭제
DROP TABLE IF EXISTS Purchase_Coupon;

-- RecentVisits 테이블 삭제
DROP TABLE IF EXISTS RecentVisits;

-- Member 테이블 생성
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT, -- `memberidx` -> `member_id`로 변경
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    address VARCHAR(255),
    zipcode VARCHAR(20),
    profile_image_name VARCHAR(255), -- `profilelmgName` -> `profile_image_name`으로 명확히 변경
    real_profile_image_name VARCHAR(255) -- `realprofilelmgName` -> `real_profile_image_name`으로 명확히 변경
);

-- Auth 테이블 생성 (회원 권한)
CREATE TABLE Auth (
    auth VARCHAR(255),
    username VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (username) REFERENCES Member(username) ON DELETE CASCADE -- 회원 삭제 시 권한도 삭제되도록 설정
);

-- persistent_login 테이블 생성 (로그인 유지)
CREATE TABLE persistent_login (
    series VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    last_used TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES Member(username) ON DELETE CASCADE -- 로그인 유지 정보 삭제 시 관련 회원 정보도 삭제되도록 설정
);

-- Product 테이블 생성
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT, -- `idx` -> `product_id`로 변경
    category VARCHAR(255),
    korean_name VARCHAR(255), -- `KoreanName` -> `korean_name`으로 명확히 변경
    product_image_name VARCHAR(255), -- `ProductimgName` -> `product_image_name`으로 변경
    real_product_image_name VARCHAR(255), -- `realProductimgname` -> `real_product_image_name`
    detail_image_name VARCHAR(255), -- `detailimgName` -> `detail_image_name`
    real_detail_image_name VARCHAR(255), -- `realDetailingName` -> `real_detail_image_name`
    original_price INT,
    once BOOLEAN -- 일회성 상품 여부
);

-- Wine 테이블 생성
CREATE TABLE Wine (
    wine_id INT PRIMARY KEY AUTO_INCREMENT, -- `idx` -> `wine_id`로 변경
    type VARCHAR(255),
    original_name VARCHAR(255), -- `originalName` -> `original_name`으로 변경
    volume INT,
    origin VARCHAR(255),
    vintage YEAR,
    alcohol_content DECIMAL(3, 1),
    acidity INT,
    sweetness INT,
    tannins INT,
    FOREIGN KEY (wine_id) REFERENCES Product(product_id) -- `idx` -> `wine_id`로 연결
);

-- Cart 테이블 생성
CREATE TABLE Cart (
    member_id INT,
    product_id INT,
    quantity INT,
    total_amount INT,
    PRIMARY KEY (member_id, product_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);


-- Purchase 테이블 생성
CREATE TABLE Purchase (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT, -- `idx` -> `purchase_id`로 변경
    member_id INT,
    address VARCHAR(255),
    total_amount INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

-- Review 테이블 생성
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT, -- `idx` -> `review_id`로 변경
    product_id INT,
    member_id INT, -- `writerldx` -> `member_id`로 변경
    purchase_id INT,
    content TEXT,
    star INT,
    is_open BOOLEAN, -- `isOpen` -> `is_open`으로 변경
    password VARCHAR(255),
    response TEXT,
    write_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE -- Purchase 테이블 생성 후 외래 키 추가
);



-- Review 테이블에 purchase_id 외래 키 추가 (Purchase 테이블 생성 후)
ALTER TABLE Review ADD FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE;

-- Purchase_Product 테이블 생성 (구매 상품 목록)
CREATE TABLE Purchase_Product (
    purchase_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

-- Coupon 테이블 생성
CREATE TABLE Coupon (
    coupon_id INT PRIMARY KEY AUTO_INCREMENT, -- `couponidx` -> `coupon_id`로 변경
    name VARCHAR(255),
    fixed_discount INT, -- `fixedDiscount` -> `fixed_discount`로 변경
    percent_discount DECIMAL(5, 2), -- `percentDiscount` -> `percent_discount`로 변경
    expire_date DATE -- `expireDate` -> `expire_date`로 변경
);

-- CouponDetail 테이블 생성
CREATE TABLE CouponDetail (
    member_id INT,
    coupon_id INT,
    is_used BOOLEAN, -- `isUsed` -> `is_used`로 변경
    PRIMARY KEY (member_id, coupon_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(coupon_id) ON DELETE CASCADE
);

-- Purchase_Coupon 테이블 생성 (구매에 사용된 쿠폰)
CREATE TABLE Purchase_Coupon (
    purchase_id INT,
    coupon_id INT,
    PRIMARY KEY (purchase_id, coupon_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(coupon_id) ON DELETE CASCADE
);

-- RecentVisits 테이블 생성 (최근 방문 상품)
CREATE TABLE RecentVisits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT, -- `idx` -> `visit_id`로 변경
    member_id INT,
    product_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);
