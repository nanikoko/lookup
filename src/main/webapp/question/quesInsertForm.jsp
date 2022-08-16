<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK UP</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/summernote/js/summernote-lite.js"></script>
  <script src="<%=request.getContextPath()%>/summernote/js/lang/summernote-ko-KR.js"></script>
  <script src="<%=request.getContextPath()%>/js/Observers.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/summernote/css/summernote-lite.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/typing.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/btn.css">

<script>
$(function(){
	// 서머노트 로딩
	$(document).ready(function(){
		$('#content').summernote({
			height : 300,			// 에디터 높이
			minHeight: 50, 			// 최소 높이
			maxHeight: null, 		// 최대 높이
			focus : true,			// 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR",			// 한글 설정
			placeholder: '내용을 입력해주세요.'
		})
	})
})
</script>

<style>
#topMenu{
	height: 70px;
}
.mainContent{
	position: fixed;
	overflow: auto;
}
.subbox{
	margin-left: 70px;
	margin-top: 40px;
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

/* 돋보기 위치 조정 */
#boardSearch{
   top: -3px;
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
button, textarea {
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}

/* 서머노트 배경색 */
.note-editable{
	background-color: white;
}
/* 서머노트 너비 */
.note-editor{
	width: 95%;
}
/* 제목 입력 관련*/
#titleInputbox{
	overflow: hidden;
	height: auto;
}
#titleInput{
	padding: 0 25px 0 11px;
    border: 1px solid #00000032;
    background: #fff;
    text-align: left;
    box-sizing: border-box;
    color: #000;
    cursor: pointer;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    height: 35px;
    font-size: 1.1em;
}

/* 게시판 선택 select 박스 관련 */
#noticeBoard{
	width: 49%;
	height: 35px;
	border: 1px solid #00000032;
	border-radius: 8px;
	font-size: 1.0em;
}
</style>

</head>
<body>

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
					<a href="<%=request.getContextPath() %>/question/questionList.jsp">1:1문의</a>
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

<!-- ------------------------------------------------------------------------------------------- -->

<section>

<div class="mainContent">
	<div class="subbox">
	    <h3>1:1문의하기</h3>
	</div>
	<hr style="width: 92%">
	
	<!-- 내용 작성 -->
    <div class="subbox">
		<form action="<%=request.getContextPath()%>/quesInsert.do" method="post">
			<input type="hidden" name="detail_name" id="detail_name">
			
			<label for="noticeBoard"> 문의종류 </label>
	  	      <select name="noticeBoard" id="noticeBoard">
	  	    	<option value="관측회"> 관측회 </option>
	  	    	<option value="회원가입"> 회원가입 </option>
	  	    	<option value="관심일정"> 관심일정 </option>
	  	    	<option value="차단사용자"> 차단사용자 </option>
	  	      </select>
	  	      <br><br>
			
		<div id="titleInputbox">
  	        <label for="titleInput"> 작성자 </label>
        	<input type="text" name="mem_id" style="width:50%">
        </div>
		
			<br><br>
			<textarea name="question_q" id="content"></textarea>
			
			<div id="insertbutton">
		        <input type="submit" value="저장"> 
				<input type="reset" value="취소"> 
	        </div>
	        <br><br><br><br><br><br>
		</form>
	</div>
	
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