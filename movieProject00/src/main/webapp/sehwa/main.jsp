<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>main</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	%>
	<div>	
		<a class="logo" href="main.jsp">LOGO</a>
	</div>
	<%
	if (userID == null){
	%>
		<div class="btn">		
			<input type="button" value="로그인" onclick="location.href = 'login.jsp'">
			<input type="button" value="회원가입" onclick="location.href = 'join.jsp'">															
		</div>
	<% 		
	} 
	else {
	%>
		<div class="btn">
		<input type="button" value="로그아웃" onclick="location.href = 'logoutAction.jsp'">
		<input type="button" value="마이페이지" onclick="location.href = 'mypage.jsp'">
		</div>
	<% 	
	}
	%>
			
	
	

	 
</body>
</html>