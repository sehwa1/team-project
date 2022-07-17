<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="joinPart">
     
        <form class="J-form" method="post" action="loginAction.jsp">
            <h1 class="joinTxt">Login</h1>
         
            <div class="inputBox">
                <input class="joinForm" type="text" name="userID" placeholder="아이디" required>
            </div>
            <div class="inputBox">
                <input class="joinForm" type="text" name="userPassword" placeholder="비밀번호" required>
            </div>
            <div>
                <input class="btn loginBtn" type="submit" value="Login">
                <input class="btn loginBtn" type="button" value="Join" onclick="location.href='join.jsp'">
            </div>
        </form>
    </div>
</body>

</html>