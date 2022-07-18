<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제하기</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String userID = (String) session.getAttribute("userID");
		
		int result = BoardDAO.getInstance().boardDelete(num, userID);
		if(result == 1) {
	%>
			<script>
				alert("삭제되었습니다.");
				window.location.href="BoardList.jsp";
			</script>
	<%
		}else if(result == -1) {
	%>
			<script>
				alert("먼저 로그인 해주세요.");
				history.go(-1);	// 이전 페이지로 되돌아가기
			</script>
	<%
		}
	%>
	
</body>
</html>