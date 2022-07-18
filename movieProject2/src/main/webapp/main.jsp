<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css">
         <link rel="stylesheet" href="css/common.css">
         <link rel="stylesheet" href="css/movie.css">
            
    <title>Document</title>
     <!--  <script src="script/movie.js"></script>-->
</head>

<body class="mainBody">
<jsp:include page="header.jsp"></jsp:include>
    
    
    <div class="nav">
        <div id="video" class="video"></div>
    </div>
    
   <form id="form">
            <input type="text" placeholder="search" id="search"
            class="search">
        </form>
    
    <main id= "main">  
    </main>
    <div class="boxoffice">
    </div>
    <div class="content"></div>
    <div class="footer"></div>
    <span id="star1"></span>
    <span id="star2"></span>
    <span id="star3"></span>
    <script src="script/video.js"></script>
   <script src="script/movie.js"></script>
</body>
</html>