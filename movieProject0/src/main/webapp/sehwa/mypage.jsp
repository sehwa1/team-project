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
		<a class="logo" href="main.jsp">LOGO</a>
		<input type="button" value="로그아웃" onclick="location.href = 'logoutAction.jsp'">
		<input type="button" value="마이페이지" onclick="location.href = 'mypage.jsp'">
	</div>
	<div class="btn">
		<input type="button" value="로그아웃" onclick="location.href = 'logoutAction.jsp'">
		<input type="button" value="마이페이지" onclick="location.href = 'mypage.jsp'">
	</div>
	
	<div>
		<ul>
			<li><a href="modify_profile.jsp">회원정보 수정</a></li>
			<li><a href="bookmark.jsp">북마크</a></li>				
			<li><a href="mypost.jsp">내가 쓴 글 </a></li>				
		</ul>
	</div>
	
		
</body>
</html>