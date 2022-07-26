<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().getBoard(num);
	%>
	<div class="writeContainer" align="center" style="margin-top:180px;">
		<form method="post" action="BoardUpdateAction.jsp?num=<%=num%>">
			<input type="text" id="writeTitle" name="title" value="<%= board.getTitle() %>" style="width:50vw; padding: 20px; margin: 5px;"><br>			
			<textarea id="writeArea" name="content" style="width:50vw; height:50vh; padding: 20px; margin: 5px;"><%= board.getContent() %></textarea><br>          
            <input type="submit" value="수정">
			<input type="reset" value="리셋">
			<input type="button" value="목록으로" onclick="window.location.href='BoardList.jsp'">
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