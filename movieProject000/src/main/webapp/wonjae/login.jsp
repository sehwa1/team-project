<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/form.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Login</title>
</head>
<body>
<h1>Login</h1>
<!-- ㅇ -->
<form method="post" action="./Service">
		
		<input type="hidden" name="cmd" value="login">
		<input type="text" name="id" placeholder="id" required> 
		<input type="text" name="password" placeholder="password" required>
		<div class="button">
			<input type="submit" value="로그인"> 
			<input type="button" value="회원가입" onclick="location.href='agree.jsp'" >
		</div>
	</form>
</body>
</html>