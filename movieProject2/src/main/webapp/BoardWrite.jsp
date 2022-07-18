<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시글 작성하기</title>
</head>


	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="writeContainer" align="center" style="margin-top:180px;">
		<form method="post" action="BoardWriteAction.jsp">
			<input type="text" id="writeTitle" name="title" placeholder="title" style="width:50vw; padding: 20px; margin: 5px;" required><br>
            <textarea id="writeArea" name="content" placeholder="contents text" style="width:50vw; height:50vh; padding: 20px; margin: 5px;" required></textarea><br>
            <input type="submit" value="등록">
			<input type="reset" value="리셋">
			<input type="button" value="목록으로" onclick="window.location.href='BoardList.jsp'">		
		</form>
	</div>
</body>

</html>