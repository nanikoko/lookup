
<%@page import="kr.or.ddit.board.vo.FreeComment2VO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.vo.FreeCommentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.FreeboardDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>LOOK UP</title>
<!-- 자유게시판 -->

<script src="http://192.168.34.55/lookupProject/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/gif.js"></script>
<script src="<%=request.getContextPath() %>/js/board.js"></script>

<!-- 모달 -->



<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board(자유게시판).css">


<style>
.mainContent {
	position: fixed;
	overflow: auto;
	border: 1px solid gray;
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

.subbox {
	margin-left: 70px;
	margin-top: 10px;
	padding: 5px;
}

.titleBox {
	width: 80%;
	height: 200px;
	margin: 40px;
	padding: 10px;
}

.titleInline {
	display: flex;
	justify-content: space-between;
	width: 95%;
}

/* 댓글 출력 관련 style*/
.CommentBox .comment_list .comment_nick_box {
	margin-bottom: 4px;
}

.CommentBox ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.comment_list ul {
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

.comment_text_box{
	margin: 20px 0 20px 0;
}

.CommentBox .comment_list .comment_info_box {
	margin-top: 7px;
	font-size: 12px;
	color: var(- -skinText979797);
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

.subbox a {
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
	clip: rect(0, 0, 0, 0);
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
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum,
		sans-serif;
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

.ig {
	width: 170px;
	height: 100px;
	top: 13px;
	right: 12px;
	position: relative;
}

#rd {
	width: 100px;
	height: 50px;
}

/*답글쓰기 버튼*/
.btnReply {
	/* width: 100%; */
	/* height: 21px; */
	border: 1px solid #000;
	border-radius: 8px;
	/* padding: 10px; */
	font-size: 14px;
}

/*모달스타일*/
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
  
  /* 숨기기 */
  z-index: -1;
  opacity: 0;
}
.show {
  opacity: 1;
  z-index: 1000;
  transition: all .5s;
}

.window {
  position: relative;
  width: 100%;
  height: 100%;
}

/* 모달바디 */
.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ffffff;
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
  /* 임시 지정 */
    width: 500px;
    height: 500px;
    border-radius: 20px;
  
  /* 초기에 약간 아래에 배치 */
  transform: translate(-50%, -40%);
}

.show .popup {
  transform: translate(-50%, -50%);
  transition: all .5s;
}
.comment2{
/*      width:200px; */
     height:300px;
}
.comment2 textarea{
   width:80%;
   height:80%;
}

.comment2in{
/*    width:190px; */
   height:290px;
}

p{
	display: inline;
	margin-left: 20px;
}

.com2list{
	margin : 20px;
	margin-left : 100px;
}

</style>




<script type="text/javascript">
	$(function() {
		$('.comment_info_box').on('click', '.rd', function() {
		})

        $('.sb').on('click',function(){
        	
        	
        	 $.ajax({
        		 url:'',
        	     data:'',
        	     type:'',
        	     success:function(res){
        	    	 
        	     },
        	     error:function(xhr){
        	    	 alert("상태 : "+xhr.status);
        	     },
        	     dataType:'json'
        	     
        	 })
        })
	
        $('.comment2sb').on('click',function(){
         
        	parent2=$(this).parent();
          
          $(parent2).submit();
        })
        
        // 답글 쓰기 버튼 클릭 시
        $('.com2in').on('click',function(){
        	$(this).next().show();
        })
        
        // 답글 쓰기 버튼으로 열린 닫기 버튼 클릭 시
        $('.com2Close').on('click', function(){
        	$(this).parent().hide();
        	
        })
        
        
          $('.com2view').on('click',function(){
        	alert("클릭");
        	dd=$(this).prev('.com2list') ;
        	//dd=$('.com2list',dd);
        	//dd=$(this).next('.com2list');
        	alert(dd.length);
        	alert(dd.attr('class'));
            //   dd.show();
        	//$('.com2list',dd).show();
        })
        
        
        
        
        $('.comment2cn').on('click',function(){
        	alert("리셋버튼");
        	parent2=$(this).parent();
        	 alert($(parent2).attr('class'));
        	 $('textarea',parent2).val("");
        	 $(parent2).css('display','none');
        })
        
        
	
	})
	function gogo() {
		$('#coin').submit();
	}
	
	
	
	
	
	
	
	
	
	
	
</script>

</head>
<body>
<%
FreeboardDetailVO vo=(FreeboardDetailVO)request.getAttribute("fvo"); 
int count=(int)request.getAttribute("fc");
List<FreeCommentVO>fclist=(List<FreeCommentVO>)request.getAttribute("fcl");
MemberVO logvo=(MemberVO)session.getAttribute("loginMember");
%>
<input type='hidden' id='id' value='<%=vo.getFree_no() %>'>
<!-- 상단메뉴 -->
	<header>
	<nav>
			<div id="topMenu" class="FF">
				<div class="title">
					<a href="<%=request.getContextPath() %>/main/main.jsp">
						<img class="titleImg" alt="메인배너R.png" src="<%=request.getContextPath() %>/images/메인배너R.png">
					</a>
				</div>

				
<!-- 			<div class="dropdown FF topText"> -->
<!-- 					<a href="#" class="join">JOIN</a> -->
<!-- 				</div> -->

<!-- 				<div class="dropdown FF topText"> -->
<!-- 					<a href="#" class="login">LOGIN</a> -->
<!-- 				</div> -->

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
				<a href="<%=request.getContextPath() %>/membermypage/mypageMenu.jsp" class="login">MYPAGE</a>
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

		<ul style="border-radius: 0px 0px 40px 0px; background-color:black;" class="FR">
		
			<li><a href="<%=request.getContextPath()%>/schedule/Schedule.jsp">소식/일정 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/LOOKUP/board(갤러리게시판).jsp">관측 게시판</a></li>
			<li><a class="home" href="<%=request.getContextPath()%>/board/board2.jsp">자유 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/observersServletGet.do?check=10">관측회 게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/map/Map.jsp">천문대 검색</a></li>
		</ul>


	</aside>
	
	<!-- 상세 내역 출력 공간 -->
	
	<!-- 제목 -->
	<section>
		<div class="mainContent">
		  <div class="subbox">	  
		  
		  
		  	<h2>자유게시판</h2> 
		  	   <h3><%=vo.getTitle()%></h3>
	  	   
	  	    <img src="http://192.168.34.55/middleProject/FileNameImageView.do?filename=<%=vo.getMem_photo() %>" class='ig'>
	  	    <h4 id='name'>이름 : <%=vo.getMem_name() %></h4>
	  	      	
	  	    
	  	    <div class="titleInline">
	  	    <% 
	  	    if(vo.getUpdate_date()!=null){
	  	    %>
	  	       <h4 class="item"><%=vo.getUpdate_date() %></h4>     
	  	    <% 
	  	    }else{
	  	    	%> 	
	  	    	 <h4 class="item"><%=vo.getCreate_date() %></h4>    
	  	    	
	  	  
	  	  <% 
	  	  }
	  	  %>
	  	    <h4 class="item">댓글 수 <%=count %></h4>
	  	    </div>
		  </div>
		  <hr style="width: 92%">
		  
		  <!-- 내용 -->
		  <div class="subbox">
		  
		  <p class="item"><%=vo.getContent() %></p>
		  </div>
		  
		  <hr style="width: 92%">
		  
		  <!-- 댓글 출력 -->
	
		  <div class="subbox">
		  <h3>댓글 내역</h3>
		
		  <div class="comment_box" style="margin-bottom: 25px;">
		    	  <%
		  for(FreeCommentVO v1:fclist){
		  %>
		     <input type='hidden' value='<%=v1.getComment_no()%>' class='Commnet_no'>
		    <div class="comment_nick_box">
		      <div class="comment_nick_info">
		        <a id="cih139368823" href="#" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname">
              <img src="http://192.168.34.55/middleProject/FileNameImageView.do?filename=<%=v1.getMem_photo() %>" class='ig'>
		        <strong><%=v1.getMem_id() %></strong>
                </a>
                
            <!--  <div class="comment_info_box"> -->
            <%if(v1.getUpadte_date()!=null){ 
            %>
              <p><%=v1.getUpadte_date() %></p>
             <% 
            }else{
             %> 
              <p><%=v1.getCreate_date() %></p>
             <% 
            }
             %>
              </div>
              
               <div class="comment_text_box">
                <p><%=v1.getContent() %></p>
            </div>
	
            </div>
            
           
            
            
            
           
			
			<div class='comment2box'>
				<%List<FreeComment2VO>list=(List<FreeComment2VO>)request.getAttribute(v1.getComment_no()+""); %>	   
		
					<button type='button' class='com2in'>답글 쓰기</button>
				<div class='comment2' style="height:auto; display:none;">
					<button type='button' class='com2Close'>닫기</button>
				  <form class='comment2in' action='<%=request.getContextPath() %>/FreeComment2insert.do' method='get' style="height:auto;">
				    <textarea cols='70' rows='10' name='content' class="commentArea"></textarea>
				    <input type='hidden' value='<%=vo.getFree_no() %>' name='id'>
				    <input type='hidden' value='<%=vo.getMem_id() %>' name='mem_id'>
				    <input type='hidden' value='<%=v1.getComment_no() %>' name='comment_no'>
					
  				    <button type='button' class='comment2sb'>작성완료</button>
 				    <button type='button' class='comment2cn'>취소</button>
				  </form>
				</div>
			<%if(true){ 
			   for(FreeComment2VO vo2:list){
			%>
			
			  	<div class='com2list'>
				<div class='id'><%=vo2.getMem_id() %></div>
			<div class='content'><%=vo2.getContent() %></div>
			<%if(vo2.getUpdate_date()!=null){ %>
			<div class='date'><%=vo2.getUpdate_date() %></div>
			<% 
			}else{
			%>
			 <div class='date'><%=vo2.getCreate_date() %></div>  
			<% 
			}
			%>
			</div>
			   
			   
            <%
			 }
			}else{
            %>
             
<%
			}
%>


	<%
	}
	%>  
            
        	<div data-v-5213e8a5="" class="comment_tool">
              <a data-v-5213e8a5="" id="commentItem139368823" href="#" role="button" title="더보기" class="comment_tool_button"></a>
            </div>
          </div>
		  
		  <!-- 댓글 작성 -->
		
		<div class="CommentBox">
         <form  id="coin" action="<%=request.getContextPath()%>/FreeComentInsert.do" method="post">
		  <div class="CommentWriter">
		    <div class="comment_inbox">
		      <strong class="blind">댓글을 입력하세요</strong>
		      <em class="comment_inbox_name">댓글을 입력하세요.</em>
		      <textarea placeholder="댓글을 남겨보세요" rows="1" name='content' id="comentin" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 30px;" > </textarea>
		    </div>
		    <div class="comment_attach">
		      <div class="attach_box">
		        <label  for="attach3" class="button_file">
                   <input type='hidden' name='id' value='<%=vo.getFree_no() %>'>
                  <input id="attach3" type="file" title="사진첨부" accept="image/*, image/heic" class="blind">
                </label>
                <a href="#" role="button" class="button_sticker">
                </a>
              </div>
              <div class="register_box">
                <a href="#" role="button" class="button btn_register" id="cbt" onclick="gogo()">
                  등록
                </a>
              </div>
            </div>
          </div>
         </form>
        </div>
		  
		  
		  </div><!-- subbox div -->
		  
		  
		  
		  
		  
		
        
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