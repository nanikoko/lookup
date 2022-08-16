
<%@page import="kr.or.ddit.member.vo.MessegeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOKUP</title>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/별.png" type="image/x-icon">

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="http://localhost/lookupProject/css/board.css"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberUpdate(수정).css">
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

.pagination li.last {
	width: 100px;
}

.pagination a:hover {
	text-decoration: underline;
	background-color: white;
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
	position: absolute;
	top: 1050px;
	right: 130px;
	z-index: initial;
	padding: 5px 10px;
}

table.infoTable {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 10px;
}

table.infoTable th {
	width: 80px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.infoTable td {
	padding: 5px;
	color: black;
}

.infoMain {
	display: flex;
}


#memupdate {
	display: inline-block;
	left: 100px;
}

input[type=button], .updateBtn {
	background-color: white;
	border: 1px solid #FF5675;
}

table .blackBtn{
	width: 20%;
}

</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('.btn').on('click',function(){
	    canceleid=$(this).attr('id');
		
		$.ajax({
			url:'<%=request.getContextPath()%>/BlockCancele.do',
			type:'get',
			data:{"id":canceleid},
			success:function(res){
				if(res=="false"){
					alert("취소 실패")
				}else{
					alert("취소 성공!!")
				}
			},
			error:function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType:'json'
			
		})
		  location.href='<%=request.getContextPath()%>/BlockMember.do';
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
					<a href="<%=request.getContextPath()%>/main/main.jsp"> <img class="titleImg"
						alt="메인배너R.png" src="<%=request.getContextPath()%>/images/메인배너R.png">
					</a>
				</div>

				<div class="dropdown FF topText">
					<a href="<%=request.getContextPath()%>/Logout.do" class="join">LOGOUT</a>
				</div>
				<div class="dropdown FF topText">
					<a href="<%=request.getContextPath()%>/membermypage/mypageMenu.jsp" class="login">MYPAGE</a>
				</div>

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

		<ul style="border-radius: 0px 0px 40px 0px; background: black;" class="FR">
			<li><a
				href='<%=request.getContextPath()%>/membermypage/memberdetail.jsp'>회원정보수정</a></li>
			<li><a href='<%=request.getContextPath()%>/mycontentcheck/mycontentview.jsp'>내 글 보기</a></li>
			<!-- 문의관리서블릿 따로 만들어야함 -->
			<li><a
				href='<%=request.getContextPath()%>/question/questionList.jsp'>문의관리</a></li>
			<li><a href='<%=request.getContextPath()%>/BlockMember.do'>차단사용자
					관리</a></li>
			<li><a href='<%=request.getContextPath()%>/ObserveCheck.do'>관측회
					신청 현황</a></li>
			<li><a href='<%= request.getContextPath()%>/schedule/memSchedule.jsp'>관심
					일정 관리</a></li>
		</ul>


	</aside>


	<section>
		<div class="mainContent">
				<div class="subTitle">
						<h2>차단사용자 관리</h2>
					<!-- 소 제목 -->
				</div>
			<div class="passInputDiv" style="left: 150px; width: 850px; box-shadow: 0px 0px 10px 5px">

				<div class="memberInfo" style="margin: 20px;">
					<%List<String>blacklist=(List<String>)request.getAttribute("blacklist"); %>
					<table border='1' style="width:100%; color:black;" class="FF">
						<tr>
						<th colspan="2" style="background-color: #0000007a; color: white;">차단된 아이디</th>
						<% 
						for(String s:blacklist){
						%>
						  <tr>
							  <td><%=s %></td>
							  <td class="blackBtn"><input type='button' value='차단 취소' class='btn' id='<%=s%>'></td>
						  </tr>  
						<% 
						}
						%>
					</table>
					

				</div>

			</div>
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