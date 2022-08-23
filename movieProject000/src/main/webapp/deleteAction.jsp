<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	
	if (user.getUserPassword() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
	else {
		int result = dao.delete((String) session.getAttribute("userID"), user.getUserPassword());
		if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 불일치')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == 1) {
			//session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원탈퇴 완료')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			session.invalidate();
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB연동 오류 회원탈퇴 실패1')");
			script.println("history.back()");
			script.println("</script>");
		}

	}
	%>
</body>
</html>