<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/reset.css">
            <link rel="stylesheet" href="css/common.css">
    <!-- <link rel="stylesheet" href="css/common.css"> -->
    <title>Document</title>
    
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <!-- 
    <div class="header">
        <a href="main.jsp"><span class="logo">LOGO</span></a>
        <span>
            <input class="login" id="button" type="button" value="Login" onclick="location.href='login.jsp'">
            <input class="join" id="button" type="button" value="Join" onclick="location.href='join.jsp'">
        </span>
    </div>
     -->
    <div class="joinPart">
        <!-- ㅇ -->
        <form class="J-form" method="post" action="loginAction.jsp">
            <h1 class="joinTxt">Login</h1>
         
            <div class="inputBox">
                <input class="joinForm" type="text" name="userID" required>
                <label for="userID">아이디</label>
            </div>
            <div class="inputBox">
                <input class="joinForm" type="text" name="userPassword" required>
                <label for="userPsssword">비밀번호</label>
            </div>
            <div>
                <input class="btn loginBtn" type="submit" value="Login">
                <input class="btn loginBtn" type="button" value="Join" onclick="location.href='join.jsp'">
            </div>
        </form>
    </div>
</body>

</html>