# 공지사항

-----------------------
## 25.01.20. 공지사항
- 게시일 7일, 이후로는 이 파일 맨 밑으로 내리겠습니다.
- web.xml 등의 설정파일은 건들기 전에 에러 상황을 카톡으로 주시거나 이슈 남기세요.
- 메인 페이지 정상 작동합니다.
- details 페이지 정상 작동합니다.
  - URL 경로: localhost:8092/winebouti/product/details/1
  - URL 경로: localhost:8092/winebouti/product/1
- red-wine 페이지 정상 작동합니다.
  - URL 경로: localhost:8092/winebouti/product/red-wine
- 프로젝트 진행 구역 구분했습니다. 구분되지 않은 파일의 경우 작업할 파일에 자기 이름 주석으로 쓰고 작업해주세요.
- 자기 페이지가 열리지 않을 경우 빨리 이슈로 올려주세요.
- 김보민씨는 Member 자기 정보 수정 페이지 + 로그인/회원가입 페이지 작업해주세요.

## 작업 분배

| 구본찬 | 김보민 | 이창현 | 양정민 |
| --- | --- | --- | --- |
| 주문/결제 | 회원 | 상품 리스트 | 리뷰 |
|  | 웹디자인 | DB, VO | RESTful, Ajax |
| OpenAPI 연결 | Spring Security | MyBatis | Controller, Routing |


### 상품 리스트 구현 순서

- [ ] 기본 상품 리스트 페이지 구현하기
	- [ ] Front Wireframe
	- [ ] DB - Repository
	- [ ] Service
	- [ ] Controller
	- [ ] JSP
- [ ] 메인화면에서 보여질 상품 리스트 구현하기
	- [ ] 2개의 추천상품과 10개의 최신상품으로 구성
- [ ] 상품 페이징 기능 구현하기
- [ ] 상품 필터링 기능 구현하기
	- [ ] 대분류와 상세분류 구분하기

### 리뷰 구현 순서

 - [ ] 기본 상품 상세 페이지 구현하기
 	- [ ] Front Wireframe
 	- [ ] DB - Repository
 	- [ ] Service
 	- [ ] Controller
 	- [ ] JSP
 - [ ] 기본 리뷰 기능 구현하기 - Ajax
 	- [ ] RestController ~ Repository, DB
 	- [ ] JavaScript로 Ajax 구현하기
 - [ ] 리뷰에 이미지 업로드 기능 구현하기
 	- [ ] MIME type 확인을 통한 유효성 검사 구현
 	- [ ] Upload, View --> 이미지 저장, 섬네일 저장까지, Thumbnailator 사용
 	- [ ] Update Delete 구현
 - [ ] 무한 스크롤 구현하기 - README 하단 참고문헌 참고하여 구현

## 깃 브랜치 설정하기

### 최초실행 (main 브랜치에서)
```
git pull
git checkout -b {브랜치명}


# 최초 1회
git push -u origin {브랜치명}
# 이후로
git push
```
### 이후로 (개인 브랜치에서)
```
# 매일 프로젝트 시작시
git pull origin main
# 매일 프로젝트 종료시
git push
```


## 커밋 메시지 규칙 : 작업한 내용을 한줄요약하기

## 파일 이름 규칙

- css 파일 위치: `resources/style`
- js 파일 위치: `resources/js`
- 파일 경로와 뷰 경로 일치하게 저장
  - ex) Main page
    - `WEB-INF/views/main.jsp`
    - `resources/style/main.css`
    -  `resources/js/main.js`
  - ex) Mypage page
    - `WEB-INF/views/member/mypage.jsp`
    - `resources/style/member/mypage.css`
    - `resources/js/member/mypage.js`
- `controller`에서 String으로 리턴하여 뒤에 .tiles 붙이기 (tiles/layout-templates.xml 참조)
  - ex) `return "main.tiles";`
- `.css`, `.js` 등 `resources`에서 파일 가져올 때 `<c:url value="" />` JSTL 태그 사용할 것 (layout/layout.jsp 참조)

---

## TODO 리스트

### 다이어그램

- [x] ERD 그리기
- [x] Usecase Diagram
- [ ] Sequence Diagram

### 환경설정

- [x] MySQL
- [x] Git
- [x] Spring
- [ ] AWS EC2 Tomcat
- [ ] RDS

### 구현

- 분할받은 각 기능마다 이하의 순서로 구현 진행
- [ ] DB
- [ ] Repository
- [ ] Service
- [ ] Controller
- [ ] View


### 프로젝트 마무리 시

- [ ] 서버에 저장된 jQuery 날리기
- [ ] AWS에 톰캣 올려서 배포하기

### 하면 좋고 아니면 아쉽고

- [ ] 여러 페이지에서 재사용 가능한 코드 components로 분리하기 - tiles/components.xml
- [ ] 챗봇 기능