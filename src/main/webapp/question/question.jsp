<%@page import="kr.or.ddit.member.vo.MemberVO"%>
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

#insertbutton{
	margin-right: 120px;
	margin-top : 10px;
	overflow: hidden;
	height: auto;
}
#insertbutton input {
	width: 80px;
	height: 40px;
	float: right;
	margin-right: 20px;
	cursor:pointer;
}
#btnDelete, #btnAnswer, #insert, #cancel{
	width: 80px;
	height: 40px;
	margin-right: 20px;
	cursor:pointer;
}
button, textarea {
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}

/******************************************************************/
table {
  border-collapse: collapse;
  width: 100%;
}
td {
  text-align: left;
}
.question {
	position: relative; 
	margin: 50px; 
	margin-top: 10px;
	padding: 20px; 
	width: 30%; 
	height: auto; 
	color: #000; 
	border-radius: 10px; 
	background-color: #eee;
}
.question:after {
	content: ""; 
	position: absolute; 
	top: 21px; 
	left: -30px; 
	border-right: 30px solid #eee; 
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
}
.answer{
	position: relative; 
	left: 600px;
	margin: 50px; 
	padding: 20px; 
	width: 30%; 
	height: auto; 
	color: #000; 
	border-radius: 10px; 
	background-color: #eee;
}
.answer:after{
	content: ""; 
	position: absolute;
	 
	top: 21px; 
	right: -30px; 
	border-left: 30px solid #eee; 
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
}
</style>

<script type="text/javascript">
	$(function(){
		status=$('#status').val().trim();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectQuesList.do",
			type : "post",
			data : {"room_no" : <%=request.getParameter("roomNo")%>},
			success : function(res){
				str = "";
				$.each(res,function(i,v){
					if(typeof v.question_a!="undefined"){ //답변이 있을때
						str += '<div class="question" id=' + v.question_no + '>';
						str += '<table class="table table-hover" id="myTable">';
						str += '<tr>';
						str += '<td>작성자</td>';
						str += '<td>' + v.mem_id + '</td>';
						str += '<td>작성일</td>';
						str += '<td>' + v.question_date + '</td>';
						str += '</tr>';
						str += '</table>';
						str += '<hr>';
						str += '<pre class="test">' + v.question_q + '</pre>';
						str += '<input type="button" id="btnDelete" value="삭제" onclick="location.href=\'<%=request.getContextPath()%>/quesDetele.do?quesNo=' + v.question_no + '\'">';
						//str += '<input type="button" id="btnAnswer" value="답변하기">';
						str += '</div>';
						
						str += '<div class="answer">';
						str += '<textarea rows="5" cols="80" disabled>' + v.question_a + '</textarea>';
						str += '</div>';
					}else{ //답변이 없을떄
						str += '<div class="question" id=' + v.question_no + '>';
						str += '<table class="table table-hover" id="myTable">';
						str += '<tr>';
						str += '<td>작성자</td>';
						str += '<td>' + v.mem_id + '</td>';
						str += '<td>작성일</td>';
						str += '<td>' + v.question_date + '</td>';
						str += '</tr>';
						str += '</table>';
						str += '<hr>';
 						//str += '<textarea rows="5" cols="80" disabled class="test">' + $(v.question_q).html() + '</textarea>';
						str += '<pre class="test">' + v.question_q + '</pre>';
						str += '<input type="button" id="btnDelete" value="삭제" onclick="location.href=\'<%=request.getContextPath()%>/quesDetele.do?quesNo=' + v.question_no + '\'">';
						if(status=="M"){
							str += '<input type="button" id="btnAnswer" value="답변하기">';
						}
						str += '</div>';
					}
				})
				$(".questionbox").html(str);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : "json"
		})
		
		$('.questionbox').on('click','#btnAnswer',function(){
			//alert("답변하기");
			Astr="";
			Astr += '<div class="answer">';
			Astr += '<textarea rows="5" cols="80" id="answer" name="answer" placeholder="답변을 입력해주세요"></textarea>';
			Astr += '<input id="insert" type="button" value="등록">';
			Astr += '<input id="cancel" type="button" value="취소">';
			Astr += '</div>';
			
			$(this).closest("div").after(Astr);
			QNum = $(this).parent("div").attr('id');
			//alert(QNum);
		})
		
		$('.questionbox').on('click','#cancel',function(){
			//alert("취소하기");
			$(".answer").remove();
		})
		$('.questionbox').on('click','#insert',function(){
			//alert("등록하기");
			cont = $(this).prev().val();
			location.href='<%=request.getContextPath()%>/quesAnswer.do?question_no=' + QNum+ "&answer=" + cont;
		})
		
	})
</script>
</head>
<body>
<%
	MemberVO ml=(MemberVO)session.getAttribute("loginMember");
%>
<input type='hidden' value='<%=ml.getStatus()%>' id='status'>

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
		<div class="subTitle">
			<h2> 내대화방 </h2> <!-- 소 제목 -->
		</div>
		<div class="questionbox"></div>
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