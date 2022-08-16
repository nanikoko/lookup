<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	margin-top: 10px;
	padding: 5px;	
}
.subbox{
	margin-left: 70px;
	margin-top: 10px;
	padding: 5px;	
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

/* 글쓰기 버튼 */
#create button{
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
#insertbutton{
	margin-right: 70px;
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
</style>
  
<script type="text/javascript">
	window.onload = function(){
		var btnUpdate = document.getElementById("btnUpdate");
		var btnDelete = document.getElementById("btnDelete");
		var btnList = document.getElementById("btnList");
		
		btnUpdate.onclick = function(){
			var form = document.getElementById("noticeForm");
			form.action = "<%=request.getContextPath()%>/noticeUpdateForm.do";
			form.submit();
		}
		btnDelete.onclick = function(){
			var form = document.getElementById("noticeForm");
			form.action = "<%=request.getContextPath()%>/noticeDelete.do";
			form.submit();
		}
		btnList.onclick = function(){
			location.href = "<%=request.getContextPath()%>/selectNoticeList.do";
		}
	}
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
				<a href="<%=request.getContextPath()%>/memberjoin/memberForm.jsp" class="login">JOIN</a>	
			</div>
			<div class="dropdown FF topText">
				<a href="<%=request.getContextPath()%>/login/login.jsp" class="login">LOGIN</a>
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
	NoticeVO vo = (NoticeVO)request.getAttribute("noticeVo");
%>

<section>

<div class="mainContent">

<form name="noticeForm" id="noticeForm">
  <div class="subbox">
  	<h2> 공지사항 </h2>
  	<input type="hidden" id="notice_no" name="notice_no" value="<%=vo.getNotice_no()%>"> 
 	    <h3><%=vo.getNo_title()%></h3>
 	    <h4><%=vo.getMem_id()%></h4>
 	    <div class="titleInline">
	 	    <h4 class="item"><%=vo.getCreate_date()%></h4>
 	    </div>
  </div>
  <hr style="width: 92%">
  
  <div class="subbox">
  	<p><%=vo.getNo_content()%></p>
  </div>
  <hr style="width: 92%">

  <div id="insertbutton">	
	<input id="btnUpdate" type="button" value="수정"> 
	<input id="btnDelete" type="button" value="삭제"> 
	<input id="btnList" type="button" value="목록">
  </div>
  </form>	
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