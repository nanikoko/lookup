<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(function(){
	   $('#bu').on('click',function(){
		   location.href='memberUpdate.jsp';
	   })
	   $('#bs').on('click',function(){
		   memid=$('#mem_id').val();
		   location.href='<%=request.getContextPath()%>/MemberSecession.do?id='+memid;
	   })
	   
   })
   

</script>

</head>
<body>
<% MemberVO memVo =(MemberVO)request.getAttribute("other"); %>
<h2>회원 정보 상세보기</h2>
<form name="memberForm" id="memberForm" >
	<input type="hidden" id="mem_id" name="mem_id" value="<%=memVo.getMem_id()%>">
<table border="1">
<tbody>
    
	<tr>
		<td colspan="2" style="text-align:center;"><img src="<%=request.getContextPath() %>/ImageServiceView.do?memID=<%=memVo.getMem_id() %>"></td>
	</tr>
	<tr>
		<td>회원ID</td><td><%=memVo.getMem_id()%></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><%=memVo.getMem_pass()%></td>
	</tr>
	<tr>
		<td>회원이름</td><td><%=memVo.getMem_name()%></td>
	</tr>
	<tr>
		<td>회원생일</td><td><%=memVo.getMem_birth()%></td>
	</tr>
	<tr>
		<td>닉네임</td><td><%=memVo.getMem_nickname()%></td>
	</tr>
	<tr>
		<td>성별</td><td><%=memVo.getMem_gender()%></td>
	</tr>
	
	<tr>
		<td>전화번호</td><td><%=memVo.getMem_tel()%></td>
	</tr>
	<tr>
		<td>우편주소</td><td><%=memVo.getMem_addr1()%></td>
	</tr>
	<tr>
		<td>회원주소</td><td><%=memVo.getMem_addr2()%></td>
	</tr>
	<tr>
		<td>상세주소</td><td><%=memVo.getMem_addr3()%></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input id="bu" type="button" value="수정"> 
			<input id="bs" type="button" value="탈퇴"> 
			
	</tr>
</tbody>
</table>
</form></body></html>