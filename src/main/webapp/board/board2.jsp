<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK UP</title>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/gif.js"></script>
<script src="<%=request.getContextPath() %>/js/board.js"></script>
<script src="<%=request.getContextPath() %>/js/freeboard.js"></script>
<!-- <link rel="stylesheet" href="http://localhost/lookupProject/css/board.css"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board(자유게시판).css">
<!-- <link rel="stylesheet" href="http://lookupProject/css/btn.css"> -->


<style>
.mainContent {
	position: fixed;
	overflow: auto;
}

.titleUl {
	border: 3px dotted gray;
	display: inline-flex;
	flex-direction: row;
	align-items: baseline;
	justify-content: space-evenly;
	width: 90%;
	height: 200px;
	position: absolute;
}

.subTitle {
	margin-left: 50px;
	margin-top: 40px;
	padding: 5px;
}

.titleBox {
	width: 80%;
	height: 200px;
	margin: 40px;
	padding: 10px;
}

.middleBox {
	display: flex;
	margin: 20px 50px 1px 50px;
	justify-content: space-between;
	width: 91%;
	height: 40px;
}

.midsearch {
	padding-top: 3px;
	margin-right: 40px;
	margin-top: 20px;
}

.midSpan {
	margin-left: 40px;
	font-size: 1.5em;
}

.midHr {
	margin-right: 120px;
}

table.type04 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
	margin-left: 60px;
	width: 90%;
	text-align: center;
}

table.type04 th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type04 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.tableNum1 {
	width: 3%;
}

table.tableNum2 {
	width: 50%;
}

table.tableNum3 {
	width: 15%;
}

table.tableNum4 {
	width: 15%;
}

table.tableNum5 {
	width: 15%;
}

#footer {
	position: fixed;
	bottom: 0;
	clear: both;
	width: 100%;
	height: 80px;
	color: black;
	background-color: white;
}

.pagination {
	display: inline-flex;
	justify-content: center;
	position: absolute;
	width: auto;
	height: 45px;
	text-align: center;
	border-bottom: none;
	background-color: white;
}

.pagination a {
	color: #444;
}

.pagination li {
	border: 1px solid gray;
	margin: auto 5px;
	width: 30px;
}

.pagination li.next {
	width: 65px;
}

.pagination li.pr {
	width: 65px;
}

.pagination li.last {
	width: 100px;
}

.pagination a:hover{
	text-decoration: none;
	background-color: #46649b;
	color: #ffffff;
}
.pagination .active{
	background-color: #46649b;
	
}
.pagination .active a {
    color: #ffffff;
}

/* 표 클릭 호버*/
.tablecilck:hover {
	background-color: #dedede;
	text-decoration: underline;
	font-weight: bold;
}

.page {
	width: 90%;
	height: 100px;
	display: inline-flex;
	justify-content: center;
}

/* 검색어 입력 옆 select박스*/
#listCheck {
	margin: 8px;
	width: 120px;
	height: 40px;
	border-radius: 8px;
}

/* 테이블 검색 창 */
#tableSearch {
	width: 250px;
}

/* 글쓰기 버튼 */
#create button {
	display: inline;
	float: right;
	width: 80px;
	height: 35px;
	top: 1050px;
	right: 130px;
	z-index: initial;
	padding: 5px 10px;
}

/* 돋보기 위치 조정 */
#boardSearch {
	top: -3px;
}



.titleUl{
	border : 3px solid #CDECFA;
	display: block;
	text-align: center;
	background-image: url('<%=request.getContextPath()%>/images/파노라마.jpg');
/* 	opacity: 0.6; */
	transition: 1s;
	background-size : cover;
	
	width: 90%; 
 	height: 200px;
 	position: absolute;
}

/*
.titleUl:hover{
	opacity: 1;
}
*/
.subTitle{
	margin-left: 50px;
	margin-top: 40px;
	padding: 5px;	
	
}
 
.titleBox{
	width: 80%;
	height: 200px;
	margin: 40px;
	
		
	padding: 10px;
}


/*텍스트 효과*/
.header { 
/*   font-family: Helvetica Neue, Helvetica, Arial, sans-serif; */
font-size: 3rem;
    font-weight: 300;
    /* letter-spacing: 2px; */
    text-align: center;
    color: #f35626;
    background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 5s infinite linear;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: black;
    float: left;
    margin-top: 0px;
    margin-left: 18px;
}

@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }
  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}

</style> 
<script type="text/javascript">

currentPage=1;
reply={};//객체 생성
$(function(){
		typevalue="";
		wordvalue="";
		freeboardlist();
		
		
		$('#list').on('click','tr',function(){
			id=$(this).attr('id');
			if(typeof id=='undefined'){
				
			}else{
			location.href='<%=request.getContextPath()%>/FreeBoardDetail.do?id='+id;
			}	
		})
		
 $('#boardSearch').on('click',function(){
	   typevalue=$('#listCheck option:selected').val().trim();
       wordvalue=$('#text').val().trim();
       
     	  crrentPage=1;
     	 freeboardlist();
   })		
   
    //page번호 클릭하는 이벤트
   $('.pagination').on('click','.pnum',function(){
	   
	   currentPage=$(this).text();
	 
	   freeboardlist();
	   
   })
   
   
   
	  //이전버튼
     $('.page').on('click','.pr',function(){
    	
    
    	 var w=$(this).next(); 
    	
    	
    
	   currentPage=parseInt($('a',w).text())-1;
	
	   freeboardlist();
   })
   //다음 버튼 클릭하는 이벤트
   $('.page').on('click','.next',function(){
	  
	   var t=$(this).prev()
	   var k=$('a',t);
	   currentPage=parseInt(k.last().text())+1;
	   
	   freeboardlist();
   })		
		
	$('#create').on('click',function(){
		
		location.href='<%=request.getContextPath()%>/board/freecreate.jsp';
	})	
	    
})



</script>

</head>
<body>

	<!-- 상단메뉴 -->
	<header>
		<nav>
			<div id="topMenu" class="FF">
				<div class="title">
					<a href="<%=request.getContextPath() %>/main/main.jsp">
				<img class="titleImg" alt="메인배너R.png" src="<%=request.getContextPath() %>/images/메인배너R.png">
				</a>
				</div>
	
		<div class="dropdown FF topText">
					<a href="<%=request.getContextPath()%>/login/join.jsp" class="join">JOIN</a>
				</div>

				<div class="dropdown FF topText">
					<a href="<%=request.getContextPath()%>/login/login.jsp" class="login">LOGIN</a>
				</div>


				<div class="dropdown FF ">
					<button id="notice" class="dropbtn FF ahover">
						<span class="dropbtn_icon"></span> 공지사항
					</button>
					<div class="dropdown-content">
						<a href="<%=request.getContextPath() %>/selectNoticeList.do">공지사항</a> 
						<a href="<%=request.getContextPath() %>/selectQnaList.do">자주 묻는 질문</a> 
			<%if(session.getAttribute("loginMember")!=null){ 
			%> 
						<a href="<%=request.getContextPath() %>/question/questionList.jsp">1:1문의</a>
			<% 
			}
			%>
					</div>
				</div>

				<div class="dropdown FF">
					<button class="dropbtn FF ahover">
						<span class="dropbtn_icon"></span> 게시판
					</button>
					<div class="dropdown-content">
						<a href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a> 
						<a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a> 
						<a href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a> 
						<a href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회게시판</a>
						<a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a> 
					</div>
				</div>



			</div>
		</nav>
	</header>

	<aside>

		<ul style="border-radius: 0px 0px 40px 0px; background-color:black;" class="FR">
		
			<li><a href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a></li>
			<li><a class="home" href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a></li>
		</ul>


	</aside>

	<section>
		<div class="mainContent">

			<div class="titleBox">
				<!-- 목록 박스 -->
				<ul class="titleUl">
					<li class="titleLi"></li>
					<li class="titleLi"></li>
					<li class="titleLi">
						<h1 class="header FF">FREE BOARD</h1>
					</li>
				</ul>
					<span class="stripe">
					FREE BOARD
					</span>
			</div>


			<hr class="midHr" style="width: 90%">
			<!-- 글의 총 갯수, 검색창 -->
			<div class="middleBox">
				<span class="midSpan" id='total'>Total : 목록에 출력되는 글의 총 갯수</span>
				<div class="search midsearch" id="tableSearch">
					<select id="listCheck">
						<option value='free_no'>번 호</option>
						<option value='title'>제 목</option>
						<option value='mem_id'>작성자 아이디</option>
					</select> <input class="searchBtn" type="text" placeholder="검색어 입력"
						id='text'> <img id="boardSearch"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</div>
			<hr class="midHr" style="width: 90%">

			<!-- 글 목록, 글 출력은 총 10개까지 나머지 글은 페이지를 다르게-->
			<table class="type04" id='list'>
				<!--   				<tr> -->
				<!-- 	    			<th scope="row" class="tableNum1">번호</th> -->
				<!-- 	    			<th scope="row" class="tableNum2">제 목</th> -->
				<!-- 	    			<th scope="row" class="tableNum3">작성자</th> -->
				<!-- 	    			<th scope="row" class="tableNum4">등록일</th> -->

				<!--   				</tr> -->

			</table>

			<hr>
			<nav class="page">
				<ul class='pagination'>

				</ul>

			</nav>

			<div id="create">
				<button>글 쓰기</button>
			</div>


			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</section>

	<footer id="footer">
		<div id="footer" class="FR">
			<hr>
			(34055) 대전광역시 유성구 대덕대로 776 전화: 080-373-3333(무료) / 042-865-3333(유료)
			천문정보 ARS: 042-865-3332 팩스: 042-861-5610<br> Copyright (C) 2017
			Korea Astronomy and Space Science Institute. All Rights Reserved.
		</div>
	</footer>

</body>
</html>