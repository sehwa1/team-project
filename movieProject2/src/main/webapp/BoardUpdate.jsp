<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().viewBoard(num);
	%>
	<div class="writeContainer" align="center" style="margin-top:180px;">
		<form method="post" action="BoardUpdateAction.jsp">
			<input type="text" id="writeTitle" name="title" value="<%= board.getTitle() %>" style="width:50vw; padding: 20px; margin: 5px;"><br>			
			<textarea id="writeArea" name="content" style="width:50vw; height:50vh; padding: 20px; margin: 5px;"><%= board.getContent() %></textarea><br>          
            <input type="submit" value="수정">
			<input type="reset" value="리셋">
			<input type="button" value="목록으로" onclick="window.location.href='BoardList.jsp'">
		</form>
	</div>
</body>
</html>