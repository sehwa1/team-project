
<!-- 
<%@page import="jdk.internal.misc.FileSystemOption"%>
 -->
<%@page import="java.util.Vector"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User"%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<%
	UserDAO userdao = new UserDAO();
	Vector<User> vec = userdao.checkUser((String) session.getAttribute("userID"));
	System.out.println((String) session.getAttribute("userID"));
%>
<div style="margin-top: 100px">
	<div style="font-size:30px">회원정보</div>
	<table width="800" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="250">비밀번호</td>
			<td align="center" width="200">이름</td>
			<td align="center" width="200">성별</td>
			<td align="center" width="200">이메일</td>
			<td align="center" width="200">닉네임</td>
			<td align="center" width="200">국적</td>
			<td align="center" width="300">휴대폰번호</td>
		</tr>
	<%
		
		for(int i = 0; i < vec.size(); i++){
			User user = vec.get(0); 
			System.out.println(user.getNickname());
			System.out.println(user.getCountry());
			System.out.println(user.getMobile());
	%>
		<tr height="50">
			<td align="center" width="150"><%=user.getUserID() %></td>
			<td align="center" width="250"><%=user.getUserPassword() %></td>
			<td align="center" width="250"><%=user.getUserName() %></td>
			<td align="center" width="200"><%=user.getUserGender() %></td>
			<td align="center" width="200"><%=user.getUserEmail() %></td>
			<td align="center" width="200"><%=user.getNickname() %></td>
			<td align="center" width="200"><%=user.getCountry() %></td>
			<td align="center" width="300"><%=user.getMobile() %></td>
		</tr>
	<%
		}
	
	%>
	</table>
	
</div>
</body>
</html>