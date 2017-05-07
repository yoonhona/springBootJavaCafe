## jdbc template 구현에서 리스트 만들어 보기  

1. 프로그램 구동 시 테스트 데이터가 존재하기 위해 prperties에 spring.datasource.initialize=true 추가와 data.sql에 테스트 데이터 생성  
2. ArticleListRequest 클래스 생성하여 페이징에 관한 정보를 담당  
3. 리스트에 bootstrap을 적용 
4. 추가 보완 사항 
	1. init data를 하겠다고 id컬럼을 자동생성하면서 글 생성 후 글 id를 모르다 보니 상세 페이지로 넘어가질 못 함.
	2. 리스트 말고 아직 bootstrap 적용 안 함