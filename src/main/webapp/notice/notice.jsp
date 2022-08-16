<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.notice.controller.Paging"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>LOOK UP</title>
  <meta charset="utf-8">
  
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
	margin-top: 10px;
	padding: 5px;	
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
	font-size: 1.2em;
}
.midHr{ 
	margin-right: 120px;
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
	width : 65px;
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

/* 표 클릭 호버*/
.tablecilck:hover{
	background-color: #dedede;
	text-decoration: none;
	font-weight: bold;
}
.page{
	width: 90%;
	height: 100px;
	display: inline-flex;
	justify-content: center;
}
/* 검색어 입력 옆 select박스*/
.form-control{
	margin: 8px;
    width: 120px;
    height: 40px;
    border-radius: 8px;
}
/* 테이블 검색 창 */
#tableSearch{
	width: 250px;
}
/* 돋보기 위치 조정 */
#boardSearch{
   top: -3px;
}
#insertbutton{
	margin-right: 120px;
	margin-top : 10px;
	overflow: hidden;
	height: auto;
}
#insertbutton input{
	width: 80px;
	height: 40px;
	float: right;
	margin-right: 20px;
	cursor:pointer;
}
button, textarea {
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}

table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
  margin-left: 60px;  
  width: 89%;
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
</style>

<script type="text/javascript">
	$(function(){
		$("#btnAdd").on("click",function(){
				location.href = "<%=request.getContextPath()%>/noticeInsertForm.do";
		})
		
		$("#boardSearch").on("click",function(){
			stypevalue = $("#stype option:selected").val().trim();
			wordvalue = $("#sword").val().trim();
			
			location.href = "<%=request.getContextPath()%>/selectNoticeList.do?block=1&page=1&stype=" + stypevalue + "&sword=" + wordvalue;
		})
	})
</script>  
</head>
<body>
<%
	MemberVO admin=(MemberVO)session.getAttribute("loginMember"); 
%>

<!-- 상단메뉴 -->
	<header>
	<nav>
		<div id="topMenu" class="FF">
			<div class="title">
				<a href="<%=request.getContextPath()%>/main/main.jsp">
					<img class="titleImg" alt="메인배너R.png" src="<%=request.getContextPath()%>/images/메인배너R.png">
				</a>
			</div>

			<%if(session.getAttribute("loginMember")==null){ 
			%>
				<div class="dropdown FF topText">
				<a href="<%=request.getContextPath() %>/memberjoin/memberForm.jsp" class="login">JOIN</a>	
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
				<a href="<%=request.getContextPath() %>/membermypage/mypageMenu.jsp" class="login">마이페이지</a>
			</div>
			
			<% 
			}
			%>

			<div class="dropdown FF">
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
			<li><a class="home" href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a></li>
		</ul>
	</aside>

<!-- ------------------------------------------------------------------------------------------- -->

<%
 	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("noticeList");
	Paging pg = (Paging)request.getAttribute("paging");
%>

<section>

<div class="mainContent">
	 <div class="subTitle">
	  	<h2> 공지사항 </h2> <!-- 소 제목 -->
	 </div>
	 <hr class="midHr" style="width:90%">	
	  	  
	 <!-- 글의 총 갯수, 검색창 -->
	 <div class="middleBox">
	    <span class="midSpan">Total : <%=pg.getTotaldata()%></span>
	    <div class="search midsearch" id="tableSearch">
	      <select class="form-control" id="stype" style="cursor:pointer;">
	        <option value="title"> 제 목 </option>
	        <option value="content"> 내 용 </option>
	      </select>
		  <input id="sword" class="form-control mr-sm-2" type="text" placeholder="검색어 입력" style="height:20px;">
		  <img id="boardSearch" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"  style="cursor:pointer;">
		  
	    </div>
	 </div>
	 <hr class="midHr" style="width:90%">

  <table class="type04">
      <tr>
        <th class="tableNum1">번 호</th>
		<th class="tableNum2">제 목</th>
		<th class="tableNum3">작성자</th>
		<th class="tableNum4">등록일</th>
      </tr>
<%
	for(NoticeVO vo : list){
%>
		<tr class="tablecilck">
			<td><%=vo.getNotice_no()%></td>
			<td><a href="<%=request.getContextPath()%>/noticeDetail.do?notice_no=<%=vo.getNotice_no()%>" style="color:black"><%=vo.getNo_title()%></a></td>
			<td><%=vo.getMem_id()%></td>
			<td><%=vo.getCreate_date()%></td>
		</tr>
<%
	}
%>
  </table>
  
  <div id="insertbutton">
	<input id="btnAdd" type="button" value="등록">
  </div>

  <nav class="page">
	  <ul class="pagination">
	  	<%
	  		if(pg.getStartblock()>1){
	  		%>
	    <li class="page-item">
	    <a class="page-link" href="<%=request.getContextPath()%>/selectNoticeList.do?block=<%=pg.getPrevblock()%>">이전</a>
	    </li>
	  		<%	
	  		}
	  	%>
	  	<%
	  		for(int i=pg.getStartblock(); i<=pg.getEndblock(); i++){
	  			if(pg.getCurrent()==i){
	  			%>
	    <li class="page-item active">
	    <a class="page-link" href="<%=request.getContextPath()%>/selectNoticeList.do?block=<%=pg.getCurrentblock()%>&page=<%=i%>"><%=i%></a>
	    </li>
	  			<%	
	  			}else{
	  			%>
	    <li class="page-item">
	    <a class="page-link" href="<%=request.getContextPath()%>/selectNoticeList.do?block=<%=pg.getCurrentblock()%>&page=<%=i%>"><%=i%></a>
	    </li>
	  			<%
	  			}
	  		}
	  	%>
	    <%
	    	if(pg.getEndblock()<pg.getTotalblock()){
	    	%>
	    <li class="next">
	    <a class="page-link" href="<%=request.getContextPath()%>/selectNoticeList.do?block=<%=pg.getNextblock()%>">다음</a>
	    </li>
	    	<%	
	    	}
	    %>
	  </ul>
  </nav>

</div>
	
</section>

<!-- ------------------------------------------------------------------------------------------- -->
	
	<footer id="footer">
 	  <div id="footer" class="FR">
    	<hr>
        (34055) 대전광역시 유성구 대덕대로 776     전화: 080-373-3333(무료) / 042-865-3333(유료)     천문정보 ARS: 042-865-3332     팩스: 042-861-5610<br>
        Copyright (C) 2017 Korea Astronomy and Space Science Institute. All Rights Reserved.
      </div>
	</footer>

</body>
</html>