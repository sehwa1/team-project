<!-- 
<%@page import="jdk.internal.misc.FileSystemOption"%>
 -->
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>loginAction</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	
		String userID = null;
	if (session.getAttribute("userID") != null){	// 세션값이 null이 아닐때 userID를 가져옴
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null){	// userID가 null이 아닐때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
		int result = dao.login(user.getUserID(), user.getUserPassword());
		if (result == 1){
			
	
	session.setAttribute("userID", user.getUserID());
	session.setAttribute("userPassword", user.getUserPassword());
	session.setAttribute("userName", user.getUserName());
	session.setAttribute("userGender", user.getUserGender());
	session.setAttribute("userEmail", user.getUserEmail());
	session.setAttribute("nickname", user.getNickname());
	session.setAttribute("country", user.getCountry());
	session.setAttribute("mobile", user.getMobile());
	session.setAttribute("year", user.getYear());
	session.setAttribute("month", user.getMonth());
	session.setAttribute("day", user.getDay());
	System.out.println(session.getAttribute("userName"));
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>