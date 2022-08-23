<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<jsp:include page="header.jsp"></jsp:include>
</div>
	<div class="mypage" style="margin-top: 150px">
	<h1>MyPage</h1><br>
	<a href = modify.jsp>회원정보수정</a>
	<a href = delete.jsp>회원탈퇴</a>
	</div>
</body>
</html>