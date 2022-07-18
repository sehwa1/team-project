<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한페이지에 보여줄 게시글 수정하기</title>
</head>
<body>
	<%
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		session.setAttribute("pageSize", pageSize);
		
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>