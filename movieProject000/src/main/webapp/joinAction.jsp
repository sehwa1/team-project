<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="nickname" />
<jsp:setProperty name="user" property="country" />
<jsp:setProperty name="user" property="mobile" />
<jsp:setProperty name="user" property="year" />
<jsp:setProperty name="user" property="month" />
<jsp:setProperty name="user" property="day" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta name="viewport" content="wodth=device-width", initial-scale="1">
 -->

<title>joinAction</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null 
			|| user.getUserEmail() == null || user.getNickname() == null || user.getCountry() == null || user.getMobile() == null
			|| user.getYear() == 0 || user.getMonth() == 0 || user.getDay() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			int result = dao.join(user);
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				//session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 완료')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}	
		}
		
		
	%>
</body>
</html>