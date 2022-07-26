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
UserDTO user = null;

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String[] password = request.getParameterValues("password");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String country = request.getParameter("country");
String mobile = request.getParameter("mobile");
String address = request.getParameter("address");

//user = new UserDTO(id, password[0], name, nickname, year, month, day, gender, email, country, mobile, address);
user = new UserDTO(id);
String url="";

if(dao.checkDupl(user)){
	// 중복검사
	url ="main.jsp";
}
else{
	// 회원가입 성공
	// 로그인(index) 로 이동~
	url ="login.jsp";
}
session.setAttribute("log", user.getId());

%>
</body>
</html>