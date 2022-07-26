<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<%
if (session.getAttribute("id") == null) {
%>
<script src="script/validation.js">
	checkLoginval();
</script>
<%
} else {
%>
<body>
	<table>
		<tr>
			<td><a href="updateUser.jsp">회원 정보 수정</a></td>
		</tr>
		<tr>
			<td><a href="deleteUser.jsp">회원탈퇴</a></td>
		</tr>
		<tr>
			<td><a href="main.jsp">홈</a></td>
		</tr>
		<tr>
		    <td><a href="bmk.jsp">북마크</a></td>
		</tr>
	</table>
	<%
	} //
	%>
</body>
</html>