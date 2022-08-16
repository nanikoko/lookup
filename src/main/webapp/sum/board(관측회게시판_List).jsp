<%@page import="kr.or.ddit.observers.vo.Ob_BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK UP</title>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">

<script>
$(function(){
	// 글 생성하기로 이동하기
	$('#newWrite').on('click', function(){
		location.href = "<%=request.getContextPath()%>/sum/board(관측회게시판새글쓰기).jsp"
	})
	
	// 글을 눌렀을 때 들어가는 모션
	$('.tablecilck').on('click', function(){
		
		// 글 번호를 정보를 받은 뒤
		boardNum = $(this).children().eq(0).text();

		// 글을 읽는 페이지로 넘어가기
		//obBoardRead(boardNum);
		location.href="/middleProject/observersServletGet.do?boardNum=" + boardNum + "&check=11"
	})
	
	
	
	
})


</script>


<style>

@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.FL{
		font-family: 'SDSamliphopangche_Outline', sans-serif;/*웹 폰트 지정*/
		color: white;
}

.mainContent{
	position: fixed;
	overflow: auto;
}


.titleUl{
	border : 3px solid #CDECFA;
	display: block;
	text-align: center;
	background-image: url('<%=request.getContextPath()%>/images/관측회사진.jpg');
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
/*
.topText{
	    margin-top: 50px;
}
*/

/*텍스트 효과*/ 
.header { 
/*   font-family: Helvetica Neue, Helvetica, Arial, sans-serif; */
font-size: 2.2rem;
    font-weight: 300;
    /* letter-spacing: 2px; */
    text-align: center;
    color: #f35626;
    background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
    -webkit-background-clip: text; 
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 5s infinite linear;
/*     -webkit-text-stroke-width: 1px; */
/*     -webkit-text-stroke-color: ; */
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


.middleBox{
	display: flex;
	margin: 20px 50px 1px 50px;
	
	justify-content: space-between;
	width: 91%;		  
	height: 40px;
}
.midsearch{
	padding-top: 3px;
	margin-right: 40px;
	margin-top: 20px;	
}
.midSpan{
	margin-left: 40px;
	font-size: 1.5em;
	
}
.midHr{ 
	margin-right: 120px;

} 

/* 돋보기 위치 조정 */
#boardSearch{
   top: -3px;
}



table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
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
table.tableNum1{
	width: 3%;
}
table.tableNum2{
	width: 50%;
}
table.tableNum3{
	width: 15%;
}
table.tableNum4{
	width: 15%;
}
table.tableNum5{
	width: 15%;
	
}

#footer{
    position: fixed;
    bottom: 0;
    clear: both;
    width: 100%;
    height: 80px;
    color : black;
    background-color: white;
}
.pagination{
	display: inline-flex;
	justify-content: center;
	position: absolute;
	width: auto;
	height: 50px;
	text-align: center;
	border-bottom: none;
	background-color: white;	 
}
.pagination a{
	color: #444;
}

.pagination li{
	border: 1px solid gray;
	margin: auto 5px;
	width : 30px;
}

.pagination li.next{
	width : 70px;
}
.pagination li.last{
	width : 100px;
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
 
.page{
	width: 90%;
	height: 50px;
	display: inline-flex;
	justify-content: center;
}
#create button{
	display: inline;
	float:right;
	width: 80px;
	height: 35px;
	position: absolute;
    right: 170px;
    z-index: initial;
    padding: 5px 10px;
}

/* 표 클릭 호버*/
.tablecilck:hover{
	background-color: #dedede;
	text-decoration: underline;
	font-weight: bold;
}

</style>


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
			
		
			
			<%if(session.getAttribute("loginMember")==null){ 
			%>
				<div class="dropdown FF topText">
				<a href="<%=request.getContextPath() %>/login/join.jsp" class="login">JOIN</a>	
			</div>
			<div class="dropdown FF topText">
				<a href="<%=request.getContextPath() %>/login/login.jsp" class="login">LOGIN</a>
			</div>
			<%
			}else{
			%>
				<div class="dropdown FF topText">
				<a href="<%=request.getContextPath()%>/Logout.do" class="join">LOGOUT</a>		
			</div>
			<div class="dropdown FF topText">
				<a href="<%=request.getContextPath()%>/membermypage/mypageMenu.jsp" class="login">마이페이지</a>
			</div>
			
			<% 
			}
			%>
		
			
				<div class="dropdown FF ">
					<button id="notice" class="dropbtn FF ahover">
						<span class="dropbtn_icon"></span> 공지
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

		<ul style="border-radius: 0px 0px 40px 0px; background-color: black;" class="FR">
			<li><a href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a></li>
			<li><a class="home" href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a></li>
		</ul>


	</aside>
	
	<%
		int totalNum = (int)request.getAttribute("totalNum");
	%>
	
	<section>
		<div class="mainContent">
		  <div class="titleBox">
				<!-- 목록 박스 -->
				<ul class="titleUl">
					<li class="titleLi"></li>
					<li class="titleLi"></li>
					<li class="titleLi">
						<h1 class="header FL" style="margin-top: 20px;">전국 방방곳곳으로 여행을 떠나보시는건 어떤가요~</h1>
					</li>
				</ul>
			</div>
		  
		  
		  <hr class="midHr" style="width:90%">		  
		 <!-- 글의 총 갯수, 검색창 -->
		  <div class="middleBox">
		    <span class="midSpan">Total : <%= totalNum %></span>
		    
		    <div class="search midsearch">
			  <input type="text" placeholder="검색어 입력"> 
			  <img id="boardSearch" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		    </div>
		  </div>
		  <hr class="midHr" style="width:90%">
		
		
		<%
			// 목록 정보 뽑기
			List<Ob_BoardVO> list = (List<Ob_BoardVO>) request.getAttribute("boardList");
		%>
		
		<!-- 글 목록, 글 출력은 총 10개까지 나머지 글은 페이지를 다르게-->
			<table class="type04">
  				<tr>
	    			<th scope="row" class="tableNum1">번호</th>
	    			<th scope="row" class="tableNum2">제 목</th>
	    			<th scope="row" class="tableNum3">작성자</th>
	    			<th scope="row" class="tableNum4">등록일</th>
	    			<th scope="row" class="tableNum5">마감인원</th>
  				</tr>
  				
  				<%
  				for(int i = 0; i < list.size(); i++){
  				%>
  				
  				<tr class="tablecilck">
  					<th scope="row"><%=list.get(i).getOb_no()%></th>
  					<td><%=list.get(i).getTitle() %></td>
    				<td><%=list.get(i).getMem_id() %></td>
    				<td><%=list.get(i).getUpdate_date()%></td>
    				<td><%=list.get(i).getOb_memnumber()%></td>
  				</tr>
  				<%	
  				}
  				%>
  				  				
			</table>
        
        <hr class="midHr" style="width:90%">
        <nav class="page">
		  <ul class='pagination'>
			  <li class='active' title='현재 페이지'><a href='#'>1</a></li>
		  </ul>
		</nav>
		
		<%if(session.getAttribute("loginMember")!=null){ 
		%>
		  <div id="create">
		    <button id="newWrite">글 쓰기</button>
		  </div>
		<%
		}
		%>
		
		
		<br><br><br><br><br><br>
        </div>
	</section>
	
	<footer id="footer">
 	  <div id="footer" class="FR">
    	<hr>
        (34055) 대전광역시 유성구 대덕대로 776     전화: 080-373-3333(무료) / 042-865-3333(유료)     천문정보 ARS: 042-865-3332     팩스: 042-861-5610<br>
        Copyright (C) 2017 Korea Astronomy and Space Science Institute. All Rights Reserved.
      </div>
	</footer>

</body>
</html>