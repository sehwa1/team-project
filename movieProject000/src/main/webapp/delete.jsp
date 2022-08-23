<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="joinPart">
	<form class="J-form" method="post" action="deleteAction.jsp">
		<div class="inputBox">
        	<input type="password" class="joinForm" name="userPassword" maxlength="20">
            <label for="userName">회원탈퇴를 원하시면 비밀번호를 입력해 주세요</label>
    	</div>
    	<input class="btn subBtn" type="submit" value="탈퇴">
    </form>
    </div>
            
</body>
</html>