<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제하기</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	<div align="center" style="margin-top: 180px;">
		<h2>게시글 삭제하기</h2>
		<form method="post" action="BoardDeleteAction.jsp">
			<table border="1">
				<tr>
					<td colspan="2">
						
						<input type="hidden" name="num" value="<%= num %>">
						
						<input type="submit" value="삭제하기">
						<input type="button" value="목록으로" onclick="window.location.href='BoardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>