# 와인부띠: 와인샵 프로젝트

2026.01.11. EC2 컨테이너 종료

### 팀 김양구이

![Backend Stacks](https://skillicons.dev/icons?i=spring,java,mysql&theme=light)

![Frontend Stacks](https://skillicons.dev/icons?i=figma,html,css,jquery&theme=light)

### 환경설정
- 환경변수 UPLOAD_DIR를 설정합니다.
- assets/upload 폴더의 내용을 해당 폴더로 이동합니다.

### Repositories
 - [배포 페이지](http://13.209.210.176:8092/winebouti/)
 - [Figma Repository](https://www.figma.com/design/RndhZXRwcqwp1USI1bE5Ud/WINE-BOUTI?node-id=0-1&t=8rYDeam9JFPIerhG-1)

팀원 구본찬 김보민 이창현 양정민

## 고객층

* 와인 비전문가인 20대~50대 쇼핑몰 이용자를 주 고객층으로 하여 접근성이 쉬운 UI/UX를 지향함.
* 전문적인 지식 없이 즉시 구매할 수 있도록 상품 추천 및 선물의 비중을 늘림


## 요구사항

### 엔티티 구조

* 사용자 - 판매자, 소비자, 관리자, MD
* 상품 - 와인, 곁들임, 세트상품, 악세서리
* 소개글 - 사이트 소개, MD 소개
* 리뷰
* 주문 및 결제 - 장바구니, 결제
* 챗봇 상담

### 판매자

* 상품 등록, 삭제, 수정
* 상품 재고 확인

### 소비자

* 상품 검색
* 상품 구매
* 리뷰 작성

## 고려사항

* 상품의 분류 기준이 매우 다양하며 검색 및 등록에서 특히 편리성이 요구됨
* 추천 정렬을 기본으로 하되 추천 기준을 명시
* 리뷰를 무한 스크롤로 구현하여 페이지 로딩 시 부담 완화
* 챗봇 실시간 상담 기능 구현?

## Tool

* Spring 5.0.8, Spring Security 5.0.7
* Tiles 3.0.8
* MySQL, MyBatis, HikariCP

## 담당 작업

| 구본찬 | 김보민 | 이창현 | 양정민 | 이승관 |
| --- | --- | --- | --- | --- |
| 버전 충돌 해결 | 프로젝트 기획 | 상품 데이터 모델링 | 기획 | |
|  | 이미지 작업 | 시장 조사 | 기획서 작성 | |

## 작업 일정

| 일정 | 수행결과 |
| --- | --- |
| 25.01.14 - 25.01.17 | 프로젝트 기획 |
| | 시장 조사 및 일정 조율 |
| 25.01.18 - 25.01.21 | 데이터 모델링 |
| | 요구사항 분석 및 도표 작성 |
| 25.01.22 - 25.01.23 | 프로그램 분석 |
| | 프로그램 구조 설계 |
| 25.01.24 - 25.02.04 | 프로그램 구현 |
| 25.02.05 - 25.02.11 | 테스트 및 버그 수정 |
| | Github Issue를 통한 오류 관리 |
| 25.02.12 - 25.02.13 | 시연 및 발표 준비 |



### Modeling sample

---

### 참고 프로젝트

- https://github.com/spartaKotlinTeamSober/wachu_server
- https://github.com/joohongkim1/WineSns_Web_App
- https://www.figma.com/design/EM4HvIdJLbfFOG4d9AZCv8/%EC%99%80%EC%9D%B8..%EA%B2%8C%EB%90%98%EB%84%A4-%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84

### 참고 사이트

- https://www.fortnumandmason.com/
- https://www.virginwines.co.uk/
- https://domestiquewine.com/collections/structured-reds
- https://www.redtongue.co.kr/982
- https://www.wine.com/

---
반례
- https://www.virginwines.co.uk/

### 참고 문헌
- [jQuery 무한스크롤](https://velopert.com/1890)
- [Tiles3 동적 경로 지정](https://goldswan.tistory.com/41)
- [Tiles3 동적 경로 지정](https://everyflower.tistory.com/211)
- [스프링부트 포트원 연결](https://howisitgo1ng.tistory.com/entry/%EC%8A%A4%ED%94%84%EB%A7%81%EC%9C%BC%EB%A1%9C-%ED%8F%AC%ED%8A%B8%EC%9B%90-%EC%82%AC%EC%9A%A9%ED%95%B4%EC%84%9C-%EA%B2%B0%EC%A0%9C-%EA%B5%AC%ED%98%84-%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95Java-Spring-Boot-JPA-PortOne)
- [스프링부트 포트원 연결](https://velog.io/@blackarea/%EC%8A%A4%ED%94%84%EB%A7%81%EB%B6%80%ED%8A%B8-%ED%8F%AC%ED%8A%B8%EC%9B%90%EC%95%84%EC%9E%84%ED%8F%AC%ED%8A%B8-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)
- [포트원 공식문서 API v2](https://developers.portone.io/api/rest-v2/auth?v=v2)
