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
                <input class="joinForm" type="password" name="userPassword" required>
                <label for="userPsssword">비밀번호</label>
            </div>
            <div>
                <input class="btn loginBtn" type="submit" value="Login">
                <input class="btn loginBtn" type="button" value="Join" onclick="location.href='join.jsp'">
            </div>
        </form>
    </div>
    <!-- 
    <div class="footer">
    	<span>
            <div>프로젝트 명 : 영카</div>
            <div>Github 주소 : https://github.com/Jang-Wonjae/first_project.git</div>
        </span>
        <span>
            <div>장원재(팀장) 010-8714-0742 | 담당 : API 활용 vfcdsx@naver.com</div>
            <div>김하은 010-8244-4002 | 담당 : 게시판 saeun1114@naver.com</div>
            <div>김세화 010-3496-5179 | 담당 : 유저 관리 kimsehoa@naver.com</div>
            <div>어혜선 010-6659-4430 | 담당 : 전체 디자인 eohaysun95@gmail.com</div>
            <div>Ⓒ 2022 All Right Reserved. Privacy Policy</div>
        </span>
    </div>
     -->
</body>

</html>