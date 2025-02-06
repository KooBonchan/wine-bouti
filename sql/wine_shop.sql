use project_winebouti;

set foreign_key_checks = 0;
DROP TABLE IF EXISTS Member cascade;
DROP TABLE IF EXISTS Auth  cascade;
DROP TABLE IF EXISTS persistent_login cascade;
DROP TABLE IF EXISTS Product         cascade;
DROP TABLE IF EXISTS Wine            cascade;
DROP TABLE IF EXISTS Cart            cascade;
DROP TABLE IF EXISTS Purchase        cascade;
DROP TABLE IF EXISTS Review         cascade;
DROP TABLE IF EXISTS Purchase_Product cascade;
DROP TABLE IF EXISTS Coupon          cascade;
DROP TABLE IF EXISTS CouponDetail    cascade;
DROP TABLE IF EXISTS Purchase_Coupon cascade;
DROP TABLE IF EXISTS RecentVisits   cascade;
set foreign_key_checks = 1;

CREATE TABLE Member (
    member_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    address VARCHAR(255),
    zipcode VARCHAR(20),
    phone_number VARCHAR(15),
    profile_image_name VARCHAR(255), 
    real_profile_image_name VARCHAR(255)
);


CREATE TABLE Auth (
    auth VARCHAR(255),
    username VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (username) REFERENCES Member(username) ON DELETE CASCADE
);
CREATE TABLE persistent_login (
    series VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    last_used TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES Member(username) ON DELETE CASCADE
);
CREATE TABLE Product (
    product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(255),
    korean_name VARCHAR(255),
    product_image_name VARCHAR(255),
    real_product_image_name VARCHAR(255),
    detail_image_name VARCHAR(255), 
    real_detail_image_name VARCHAR(255),
    original_price INT,
    once BOOLEAN
);
CREATE TABLE Wine (
    wine_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(255),
    original_name VARCHAR(255),
    volume INT,
    origin VARCHAR(255),
    vintage YEAR,
    alcohol_content DECIMAL(3, 1),
    acidity INT,
    sweetness INT,
    tannins INT,
    FOREIGN KEY (wine_id) REFERENCES Product(product_id) -- product_id와 연결
);
CREATE TABLE Cart (
    member_id BIGINT, -- member_id를 BIGINT로 변경
    product_id BIGINT, -- product_id를 BIGINT로 변경
    quantity INT,
    total_amount INT,
    PRIMARY KEY (member_id, product_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);
CREATE TABLE Purchase (
    purchase_id BINARY(16) primary key not null, -- purchase_id를 BIGINT로 변경
    member_id BIGINT, -- member_id를 BIGINT로 변경
    address VARCHAR(255),
    total_amount INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);
CREATE TABLE Review (
    review_id BIGINT PRIMARY KEY AUTO_INCREMENT, -- review_id를 BIGINT로 변경
    product_id BIGINT, -- product_id를 BIGINT로 변경
    member_id BIGINT, -- member_id를 BIGINT로 변경
    purchase_id BINARY(16),
    content TEXT,
    star INT,
    is_open BOOLEAN, -- is_open 수정
    password VARCHAR(255),
    response TEXT,
    write_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    image_path VARCHAR(500) DEFAULT NULL, -- 이미지 파일 경로 추가
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE -- Purchase 테이블과 연결
    
);
ALTER TABLE Review ADD FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE;

-- Purchase_Product 테이블 생성 (구매 상품 목록)
CREATE TABLE Purchase_Product (
    purchase_id binary(16),
    product_id BIGINT, -- product_id를 BIGINT로 변경
    quantity INT,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

-- Coupon 테이블 생성
CREATE TABLE Coupon (
    coupon_id BIGINT PRIMARY KEY AUTO_INCREMENT, -- coupon_id를 BIGINT로 변경
    name VARCHAR(255),
    fixed_discount INT, -- fixed_discount 수정
    percent_discount DECIMAL(5, 2), -- percent_discount 수정
    expire_date DATE -- expire_date 수정
);

-- CouponDetail 테이블 생성
CREATE TABLE CouponDetail (
    member_id BIGINT, -- member_id를 BIGINT로 변경
    coupon_id BIGINT, -- coupon_id를 BIGINT로 변경
    is_used BOOLEAN, -- is_used 수정
    PRIMARY KEY (member_id, coupon_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(coupon_id) ON DELETE CASCADE
);

-- Purchase_Coupon 테이블 생성 (구매에 사용된 쿠폰)
CREATE TABLE Purchase_Coupon (
    purchase_id binary(16),
    coupon_id BIGINT, -- coupon_id를 BIGINT로 변경
    PRIMARY KEY (purchase_id, coupon_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(coupon_id) ON DELETE CASCADE
);

-- RecentVisits 테이블 생성 (최근 방문 상품)
CREATE TABLE RecentVisits (
    visit_id BIGINT PRIMARY KEY AUTO_INCREMENT, -- visit_id를 BIGINT로 변경
    member_id BIGINT, -- member_id를 BIGINT로 변경
    product_id BIGINT, -- product_id를 BIGINT로 변경
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);
