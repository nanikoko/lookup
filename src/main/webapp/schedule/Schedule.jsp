<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK UP</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/typing.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/btn.css">

<style>


.mainContent{
	position: fixed;
	overflow: auto;
}

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
}
.midHr{ 
	margin-right: 120px;

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

/* 용어설명 관련 */
.titleBox{
	width: 80%;
	height: 200px;
	margin: 40px;
	padding: 10px;
}
.titleUl{
	border : 3px dotted gray;
	display: block;
	
	width: 90%;
 	height: 200px;
}

#calendarMain{
	font-size : 2.5em; 
	padding-left : 1000px;   
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

	<!-- 좌측 배너 -->
	<aside>

		<ul style="border-radius: 0px 0px 40px 0px; background-color: black;" class="FR">
			<li><a class="home" href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a></li>
		</ul>


	</aside>
	
	<section>
	   <!-- 달력 출력 -->
	   <h2 id="calendarMain">천문소식 캘린더</h2>
	   <iframe name="mainContent" class="mainContent"  src="<%=request.getContextPath()%>/schedule/calendar.jsp">
	   </iframe>
	   <br><br><br>
	   
	   
	</section>

</body>
</html>