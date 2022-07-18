<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAction</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userGender = request.getParameter("userGender");
	String userEmail = request.getParameter("userEmail");
	String country = request.getParameter("country");
	String mobile = request.getParameter("mobile");
	String nickname = request.getParameter("nickname");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	
	UserDAO dao = UserDAO.getInstance();
	User user = new User(userID, userPassword, userName, userGender, userEmail, nickname, country, mobile, year, month, day );
	request.setAttribute("userID", userID);
	request.setAttribute("userPassword", userPassword);
	request.setAttribute("userName", userName);
	request.setAttribute("userGender", userGender);
	request.setAttribute("userEmail", userEmail);
	request.setAttribute("country", country);
	request.setAttribute("mobile", nickname);
	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("day", day);
	/*
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
	*/
	
	/*
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null 
			|| user.getUserEmail() == null || user.getNickname() == null || user.getCountry() == null || user.getMobile() == null
			|| user.getYear() == 0 || user.getMonth() == 0 || user.getDay() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	*/
		
			UserDAO userDAO = new UserDAO();
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
		
	%>
</body>
</html>