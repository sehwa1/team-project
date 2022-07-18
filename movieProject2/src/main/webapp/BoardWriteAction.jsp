<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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

			board.setId(userID);
			
			String nickname = (String) session.getAttribute("nickname");
			board.setNickname(nickname);
			String title = (String) session.getAttribute("title");
			board.setTitle(title);
			String content = (String) session.getAttribute("content");
			board.setContent(content);
		
			BoardDAO.getInstance().boardWrite(board);
			response.sendRedirect("BoardList.jsp");
		

	%>
</body>
</html>