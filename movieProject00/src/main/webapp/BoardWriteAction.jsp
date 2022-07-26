<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시글 작성하기</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<%
	BoardDTO board = new BoardDTO();

		// id/nickname/title/content
		String userID = (String) session.getAttribute("userID");
		System.out.println("유저아이디: " + userID);
			board.setId(userID);
			
			String nickname = (String) session.getAttribute("nickname");	// NULL
			board.setNickname(nickname);	// NULL
			String title = request.getParameter("title");
			board.setTitle(title);
			String content = request.getParameter("content");
			board.setContent(content);
		
			BoardDAO.getInstance().writeBoard(board);
			response.sendRedirect("BoardList.jsp");
		

	%>
</body>
</html>