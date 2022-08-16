<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.observers.vo.Ob_BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK UP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/Observers.js"></script>


<style>
.mainContent{
	position: fixed;
	overflow: auto;
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

.titleUl{
	border : 3px dotted gray;
	display: inline-flex;
	flex-direction: row;
	align-items: baseline;
	justify-content: space-evenly;
	
	width: 90%;
 	height: 200px;
 	position: absolute;
}


.subbox{
	margin-left: 70px;
	margin-top: 40px;
	padding: 5px;	
	
}
.titleBox{
	width: 80%;
	height: 200px;
	margin: 40px;
		
	padding: 10px;
}
.titleInline{
	display: flex;
	justify-content: space-between;
	width: 95%;
}

/* 댓글 출력 관련 style*/
.CommentBox .comment_list .comment_nick_box {
    margin-bottom: 4px;
}

.CommentBox ul{
	display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.comment_list ul{
	display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.CommentBox .comment_list .comment_text_box {
    position: relative;
    font-size: 13px;
    word-break: break-all;
    word-wrap: break-word;
}
.CommentBox .comment_list .comment_info_box {
    margin-top: 7px;
    font-size: 12px;
    color: var(--skinText979797);
}
.CommentBox .comment_list .comment_tool {
    position: absolute;
    top: 12px;
    right: 0;
}
.CommentBox .comment_list .comment_area {
    position: relative;
    padding: 12px 23px 10px 0;
}


dl, ol, ul {
    list-style: none;
    
}

.subbox a{
	color: black;
}


/* 댓글 작성 관련 style  */
.CommentBox {
    margin-top: -17px;
    border-top: 1px solid #ebecef;
}
.CommentWriter {
    margin: 12px 0 29px;
    padding: 16px 10px 10px 18px;
    border: 2px solid rgba(0, 0, 0, 0.1);
    border-radius: 6px;
    box-sizing: border-box;
    background: #ffffff;
}
.CommentWriter .comment_inbox {
    position: relative;
    margin-bottom: 10px;
}
.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}
.CommentWriter .comment_inbox_name {
    display: block;
    margin-bottom: 10px;
    font-weight: 700;
    font-size: 13px;
}
textarea.comment_inbox_text[data-v-3b426d7d] {
    max-height: 500px;
}
.CommentWriter .comment_inbox_text {
    overflow-x: hidden;
    overflow-y: auto;
    display: block;
    width: 100%;
    min-height: 17px;
    padding-right: 1px;
    border: 0;
    font-size: 13px;
    -webkit-appearance: none;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    color: #000000;
    outline: 0;
}
button, textarea {
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}
.CommentWriter .comment_attach {
    position: relative;
}
.CommentWriter .register_box {
    float: right;
}
.CommentWriter .register_box .button {
    display: inline-block;
    min-width: 46px;
    height: 34px;
    line-height: 36px;
    font-size: 13px;
    color: #b7b7b7;
    border-radius: 6px;
    box-sizing: border-box;
    font-weight: 700;
    text-align: center;
    vertical-align: top;
}
.CommentWriter .comment_attach:after {
    content: "";
    display: block;
    clear: both;
}

/* 신청 마감 버튼 */
#checkClose{
	display: none;
}

/* 신청 관련 정보를 감싼 div */
.appBox{
	text-align: center;
}

/* 서머노트 모달 충돌 억제 */
.note-modal-backdrop{
	z-index: -1;
}

/* 상단 배너 크기 조절 */
#topMenu{
	height: 70px; 
}


</style>

<script>
<%
Ob_BoardVO vo1 = (Ob_BoardVO)request.getAttribute("boardInfo");
MemberVO vo2 = (MemberVO) session.getAttribute("loginMember");
%>
$(function(){
	ObInfo = {}; // 객체
	memCheck = null;
	
	
	// 관측회 모집 현재 인원을 출력
	$.ajax({
		url : '<%=request.getContextPath()%>/observersServlet.do',
		type : 'post',
		data : {"check" : 21,
				"observerNum" : "<%=vo1.getOb_num()%>"},
		success : function(res){
			$('#nowNum').text(res);
			if(res >= <%=vo1.getOb_memnumber()%>){
				$('#modal_ob').hide();
				$('#checkClose').show();
			}
		},
		error : function(xhr){
			alert("관측회 모집 현재 인원 출력 오류 : " + xhr.status);
		},
		dataType : 'json'
		
	})
	
	// 관측회 신청을 눌렀을 때 처리
	// 1. 관측회 신청 테이블에 정보 입력
	// 2. 하나의 관측회에 이미 신청된 인원은 추가 신청 불가
	$('#modal_ob').on('click', function(){
		
		ob_num = "<%=vo1.getOb_num()%>";// 관측회 번호
		//mem_id = "rsz5";// 신청자 아이디(추후 서블릿으로 변경)
		
		ObInfo.ob_num = ob_num;
		ObInfo.mem_id = "<%=vo2.getMem_id() %>";
		ObInfo.check = 22;
		
		obMeetingCheck();// 이미 신청된 인원인지 체크
		
		memCheck = $('#appResult').text();
			
	})
	
	$('#ob_app').on('click', function(){
		console.log(memCheck);
		if(memCheck == '성공'){
			ObInfo.check = 23
			obApplication(); // 관측회 신청 테이블에 정보 입력
			window.location.reload();
		}
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
	
	<!-- 상세 내역 출력 공간 -->
	<%
	Ob_BoardVO vo = (Ob_BoardVO)request.getAttribute("boardInfo");
	%>
	
	
	<!-- 제목 -->
	<section>
		<div class="mainContent">
		  <div class="subbox">
		  	<h3> 🔭 관측회 게시판 </h3> 
		  	<br>
	  	    <h2>글 제목 출력<%=vo.getTitle() %></h2>
	  	    <br>
	  	    <h6>작성자 : <%=vo.getMem_id() %></h6>
	  	    <div class="titleInline">
	  	    <h6 class="item">작성 일자 : <%=vo.getUpdate_date() %></h6>
	  	    </div>
		  </div>
		  <hr style="width: 92%"><br>
		  
		  <!-- 내용 -->
		  <div class="subbox">
		  <p>내용 출력<%=vo.getContent() %></p>
		  </div>
		  
		  <hr style="width: 92%">
		  
		  
		  <!-- 남은 관측회 신청 인원 표시 -->
		  <div class="subbox appBox">
		    <h4>현재 신청인원 / 최대 신청 가능 인원</h4>
		    <h5>  
  	  		  &lt;<span id="nowNum"></span> 명 /
	  	    <span id="maxNum"><%=vo.getOb_memnumber() %>명></span>
		    </h5>
		  
		  	<br>
		    <!-- 신청 결과 -->
		    <div id="appResult" style="color:mediumvioletred;"></div>
	
		    <!-- 관측회 신청 버튼  -->
		    <div>
		    <%if(session.getAttribute("loginMember")!=null){ 
			%>
 	  	      <button type="button" id="modal_ob" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	    	  관측회 신청하기
	  	      </button>
	  	      <button type="button" id="checkClose" disabled class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	  		  신청이 마감되었습니다.
	  	      </button>
	  	    <% 
			}else{
			%>
			  <button type="button" id="modal_ob" class="btn btn-primary" data-toggle="modal" data-target="#myModal" disabled="disabled">
	    	  로그인이 필요합니다.
	  	      </button>
			<% 
			}
			%> 
		    </div>
		  </div>
		  
		  
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
	
	 <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><%=vo.getOb_num()%> 관측회에 참가를 신청하시겠습니까?</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <h5><%=vo.getOb_num()%> 관측회에 참가를 신청하시겠습니까?</h5>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="ob_app">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

</body>
</html>