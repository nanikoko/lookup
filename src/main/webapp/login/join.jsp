<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/font.css">
  <link href="../css/btn.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/logout.js"></script>


<script>

$(function(){
	

$("#idCheck").on("click", function(){
	
	var memId = $("#mem_id").val();
	if(memId==""){
		alert("ID를 입력하세요");
		return;
	}
	$.ajax({
    	 url : '<%=request.getContextPath()%>/MemberIdCheck.do',
    		
		 data :{"mem_id":memId},
    	 dataType : 'json',
    	 success : function(result){
    		 if(result=="ok"){
    			 $("#idChkResult").html("사용가능");	
    		 }else{
    			 $("#idChkResult").html("ID 중복 - 사용불가");
    		 }
    	 },
    	 error : function(xhr){
    		 alert("status :" + xhr.status);
    	 }
     })
});


$("#memberForm").on("submit", function(){
    

	
	var idchk = $("#idChkResult").html();
	if(idchk!="사용가능"){
		alert("ID 중복되거나 중복체크를 하지 않았습니다.");
		return false;  // 전송 중단.
	}
	if($("#mem_pass").val()!= $("#mem_pass2").val()){
		alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.");
		return false;
	}
   if($("#name").val().trim()==""||$("#addr1").val().trim()==""||$("#addr2").val().trim()==""||$("#addr3").val().trim()==""||
		   $("#mem_nickname").val().trim()==""||$("#mem_birth").val().trim()==""){
	   alert("필수 입력사항중 입력되지않은 항목 존재!!")
	   return false;
   }
	
	 
	     return true;
	   })
	   
$('#sb').on('click',function(){
	
})
	
      
	
       




  $('#aSearch').on('click',function(){
	  
	  window.open("우편번호.html","우편번호","width=500 height=400");
	  
  })	

 
  
  
});

function proc(){
	flag="ture";
	var idchk = $("#idChkResult").html();
	if(idchk!="사용가능"){
		alert("ID 중복되거나 중복체크를 하지 않았습니다.");
		flag="false";  // 전송 중단.
	}
	if($("#mem_pass").val()!= $("#mem_pass2").val()){
		alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.");
		flag="false";  
	}
   if($("#name").val().trim()==""||$("#addr1").val().trim()==""||$("#addr2").val().trim()==""||$("#addr3").val().trim()==""||
		   $("#mem_nickname").val().trim()==""||$("#mem_birth").val().trim()==""){
	   alert("필수 입력사항중 입력되지않은 항목 존재!!")
	   flag="false";  
   }
     if(flag=="ture"){
    	 $("#memberForm").submit();
     }	
	
}  
function proc2(){
	  window.open("우편번호.html","우편번호","width=500 height=400");
}
function proc3(){
	document.memberForm.reset();
}
</script>

<style>

@import url('https://fonts.googleapis.com/css?family=Raleway:200');


html, body {
  height: 100%;
}
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../images/게시판워터마크.png");
}
#box {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 500px;
  height: 550px;
  color: white;
  font-family: 'Raleway';
  font-size: 1.5em;
  font-weight: bold;
}
.gradient-border {
  --borderWidth: 8px;
/*   background: #1D1F20; */
background : white;
  position: relative;
  border-radius: var(--borderWidth);
}
.gradient-border:after {
  content: '';
  position: absolute;
  top: calc(-1 * var(--borderWidth));
  left: calc(-1 * var(--borderWidth));
  height: calc(100% + var(--borderWidth) * 2);
  width: calc(100% + var(--borderWidth) * 2);
  background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
  border-radius: calc(2 * var(--borderWidth));
  z-index: -1;
  -webkit-animation: animatedgradient 3s ease alternate infinite;
          animation: animatedgradient 3s ease alternate infinite;
  background-size: 300% 300%;
}


@-webkit-keyframes animatedgradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}


@keyframes animatedgradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

/* 버튼 */
/* 3 */


.gradient-btn {
     display: revert;
    height: 7px;
    top: 10px;
    padding: 6px;
    padding-top: 12px;
    border-radius: 0;
    color: black;
    font-size: 0.7em;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    background: linear-gradient(to right, rgba(178, 135, 111, 0) 25%, rgba(0, 0, 0, 0.8) 75%);
    background-position: 1% 50%;
    background-size: 350% 300%;
    border: 1px solid black;
    transition: 700ms cubic-bezier(0.165, 0.84, 0.44, 1);
    border-radius: 5px;
}
.gradient-btn:hover {
  transition: 400ms cubic-bezier(0.165, 0.84, 0.44, 1);
}
.gradient-btn:hover {
  color: white;
  color: #fff;
  background-position: 99% 50%;
}


</style>

</head>

<body>
	<div class="gradient-border" id="box">

		<div class="loginMain FK" style="color: black">
		<form id="memberForm" name='memberForm' class="loginMainForm" method="post" action="<%=request.getContextPath()%>/insertMember.do" enctype="multipart/form-data">
				
				<table>
<tbody>
	<tr>
		<td>회원ID</td>
		<td>
			<input type="text" name="mem_id" id="mem_id" >
				<a class="gradient-btn" href="#" id='idCheck'>중복확인</a><br>
			<span id="idChkResult"></span>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="mem_pass" id="mem_pass" ></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="mem_pass2" id="mem_pass2"></td>
	</tr>	
	<tr>
		<td>회원이름</td>
		<td><input type="text" name="mem_name" id="name"></td>
	</tr>
	
	<tr>
		<td>닉네임</td>
		<td><input type="text" name="mem_nickname" id="mem_nickname"></td>
	</tr>
	<tr>
	
	<td>성별</td>
	<td>
	<select name="mem_gender" id='mem_gender'>

<option value='남자' class='gender'>남자</option>
<option value='여자'  class='gender'>여자</option>
</select>
	</td>
	</tr>
	<tr>
		<td>생일</td>
		<td><input type='date' name="mem_birth" id='mem_birth'></td>
	</tr>	
	
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="mem_tel" placeholder="ex)01012345678"></td>
	</tr>
	<tr>
		<td>우편주소</td>
		<td><input type="text" name="mem_addr1" id='addr1' readonly="readonly"><a class="gradient-btn" href="#" style="margin:5px;" onclick='proc2()'>우편번호 찾기</a></td>
		
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="mem_addr2" id='addr2'readonly="readonly"></td>
	</tr>
		<tr>
		<td>상세주소</td>
		<td><input type="text" name="mem_addr3" id='addr3'></td>
	</tr>
	<tr>
		<td>프로필 사진</td>
		<td><input type="file" name="mem_photo"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center; margin: 50px; padding: 30px 0px 0px 0px;">
		<a class="gradient-btn" href="#" onclick='proc()'>가입</a>
<!-- 			<input type="submit" value="가입">  -->
		<a class="gradient-btn" href="#" id='re' onclick='proc3()'>취소</a>
<!-- 			<input type="reset" value="취소"> -->
		<a class="gradient-btn" href="../main/main.jsp">뒤로가기</a>
	</tr>
</tbody>
</table>
			</form>

		</div>
	</div>

</body>
</html>