<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css">
         <link rel="stylesheet" href="css/common.css">
         <link rel="stylesheet" href="css/index.css">
    <title>Document</title>
</head>

<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	%>
    <div class="header">
    	<h1 class="logo"><a href = main.jsp>영카</a></h1>
    <%
	if (userID == null){
	%>    
        <span class="buttons">
            <input class="login" id="button" type="button" value="Login" onclick="location.href='login.jsp'">
            <input class="join" id="button" type="button" value="Join" onclick="location.href='join.jsp'">
            <div class="menuBar">
                <input type="checkbox" id="menuicon">
                <label for="menuicon">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <div class="sideBar">
                     
                    <span class="menuSearch">
                        <input type="text" placeholder="영화 검색" />
                    </span>
                     
                     
                   <ul class="menuList">
                        <li><a href="BoardList.jsp"><span>게시판</span></a></li>
                        <li><a href=""><span>프로젝트 소개</span></a></li>
                    </ul>
                </div>
            </div>
        </span>
    <% 		
	}
	else {
	%>
	<span class="buttons">
            <input class="join" id="button" type="button" value="logout" onclick="location.href='logoutAction.jsp'">
            <div class="menuBar">
                <input type="checkbox" id="menuicon">
                <label for="menuicon">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <div class="sideBar">
                    <span class="menuSearch">
                        <input type="text" placeholder="영화 검색" />
                    </span>
                    <ul class="menuList">
                        <li><a href="myPage.jsp"><span>마이페이지</span></a></li>
                        <li><a href="bookmark.jsp"><span>북마크</span></a></li>
                        <li><a href="BoardList.jsp"><span>게시판</span></a></li>
                        <li><a href=""><span>프로젝트 소개</span></a></li>
                    </ul>
                </div>
            </div>
        </span>
	
	<!-- 
        <span>
            <input class="login"   id="button"  type="button"  value=Board onclick="location.href='BoardList.jsp'">
            <input class="join"   id="button"  type="button"  value="<%=userID%>님" onclick="location.href='myPage.jsp'">
            <input class="login"  id="button" type="button" value=Logout onclick="location.href='logoutAction.jsp'">
        </span>
	 -->
    <%    	
	}
    %>
    </div>    
         
</body>
</html>