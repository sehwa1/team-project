<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
UserDAO dao = UserDAO.getInstance();

String id = request.getParameter("id");
String password = request.getParameter("password");

UserDTO user = new UserDTO(id, password);

String url="";

if(dao.loginCheck(user)){
	url = "main.jsp";
}
else{
	
	url = "login.jsp";
}
// ㅇ
session.setAttribute("log", user.getId());
%>
</body>
</html>