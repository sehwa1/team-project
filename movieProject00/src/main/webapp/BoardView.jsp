
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 확인하기</title>
<head>
<meta charset="UTF-8">

<style>
.littleContainer{
padding-top: 12px;
height: 30px;
width: 50vw;
font-size:13px;
display:flex;
justify-content: space-between;
}
</style>

<title>게시글 확인</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().getBoard(num);
		String userID = (String) session.getAttribute("userID");
	%>
	<div class="viewContainer" align="center" style="margin-top:180px">
	 	<input type="text" id="boardTitle" name="title" value="<%=board.getTitle()%>" style="width:50vw; padding: 20px; text-align:center" required readonly><br>
        <div class="littleContainer">
            <span class="viewCount">조회수:<%=board.getReadCount()%></span><span class="nickDate"><span style="width:70px;">작성자:<%=board.getId()%></span><span style="width:70px; margin-left:70px"><%=board.getRegDate()%></span></span>
        </div>
        <textarea name="contents" style="width:50vw; height:50vh; padding: 20px;" required readonly><%=board.getContent()%></textarea>
        <input type="hidden" name="num" value="<%=board.getNum()%>">
        <br>
		<%
		if(userID.equals(board.getId())){%>
		<input type="button" value="수정"  onclick="window.location.href='BoardUpdate.jsp?num=<%=board.getNum()%>'">
		<input type="button" value="삭제" onclick="window.location.href='BoardDelete.jsp?num=<%=board.getNum()%>'">
		<%
		}
		%>
		<input type="button" value="목록으로" onclick="window.location.href='BoardList.jsp'">

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