<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <a href="main.jsp"><span class="logo">영화마당</span></a>
    <%
	if (userID == null){
	%>    
        <span>
            <input class="login"  id="button" type="button" value=Login onclick="location.href='login.jsp'">
            <input class="join"   id="button"  type="button"  value=Join onclick="location.href='join.jsp'">
            <input class="login"   id="button"  type="button"  value=Board onclick="location.href='bbs.jsp'">
        </span>
    <% 		
	}
	else {
	%>
        <span>
            <input class="login"   id="button"  type="button"  value=Board onclick="location.href='bbs.jsp'">
            <input class="join"   id="button"  type="button"  value="<%=userID%>님" onclick="location.href='myPage.jsp'">
            <input class="login"  id="button" type="button" value=Logout onclick="location.href='logoutAction.jsp'">
        </span>
    <%    	
	}
    %>
    </div>    
         
</body>
</html>