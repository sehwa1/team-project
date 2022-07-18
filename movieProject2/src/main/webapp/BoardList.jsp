<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
      
<title>게시판</title>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList(); // ArrayList로 보드 데이터 저장중 (데이터베이스와 연결)
	int allBoardCnt = BoardDAO.getInstance().getAllCount(); // 전체 게시글 수
	int pageSize = 10; // 한 페이지에 보여줄 게시글 수
	if (session.getAttribute("pageSize") != null) {
		pageSize = ((Integer) session.getAttribute("pageSize")).intValue();
	}
	int allPageCnt = allBoardCnt / pageSize; // 전체 페이지 수
	if (allBoardCnt % pageSize != 0) {
		pageSize++;
	}
	int curPageNum = 1; // 현재 페이지 번호
	if (request.getParameter("curPageNum") != null) {
		curPageNum = Integer.parseInt(request.getParameter("curPageNum"));
	}
	int startRow = (curPageNum - 1) * pageSize; // 현재 페이지의 게시글 시작번호
	int endRow = startRow + pageSize; // 현재 페이지의 게시글 마지막번호
	if (endRow > allBoardCnt)
		endRow = allBoardCnt;
	%>
	<div class="movieBoard" align="center" style="margin-top: 180px">
	<h1>영화 게시판</h1>
	</div>
	<div class="boardList" align="center" style="margin-top: 70px;">

		<form method="get" action="UpdateBoardSize.jsp">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td colspan="5" align="right" height="35px">
					<select name="pageSize" class="pageSizeOption">
							<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
					</select> <input class="pageSizeChangeBT" type="submit" value="변경" style="width: 60px; margin-right: 15px;"></td>
				</tr>

				<tr>
					<td colspan="5" align="right" height="35px"><input class="writeBT" type="button"
					<%if (userID == null){
					%> 
						onclick="location.href = 'login.jsp'"
					<% 
					}
					else {
					%>
						onclick="location.href = 'BoardWrite.jsp'"
					<%
					}
					%>
					 value="글쓰기" style="width: 60px; margin-right: 15px;"></td>
				</tr>
				<tr style="text-align:center" height="35px">
					<td width="40px">번호</td>
					<td width="80px">작성자</td>
					<td width="500px">제목</td>
					<td width="110px">작성일</td>
					<td width="60px">조회수</td>
				</tr>
				<%
				for (int i = startRow; i < endRow; i++) {
					BoardDTO board = boardList.get(i);
				%>
				<tr height="40px">
					<td style="text-align:center"><%=board.getNum()%></td>
					<td style="text-align:center"><%=board.getNickname()%></td>
					<td><a href="BoardView.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a></td>
					<td style="text-align:center"><%=board.getRegDate()%></td>
					<td style="text-align:center"><%=board.getReadCount()%></td>
				</tr>
				<%
				}
				%>
			</table>

			<%
			int clickablePageCount = 5;
			int startPageNum = 1;
			// 현재 페이지 번호가 (1~4 일때와 5일때)
			if (curPageNum % clickablePageCount != 0) {
				startPageNum = (curPageNum / clickablePageCount) * clickablePageCount + 1;
			} else {
				startPageNum = (curPageNum / clickablePageCount - 1) * clickablePageCount + 1;
			}
			int endPageNum = startPageNum + clickablePageCount - 1;
			if (endPageNum > allPageCnt) {
				endPageNum = allPageCnt;
			}
			%>
			<%
			if (startPageNum > clickablePageCount) {
			%>
			[<a
				href="BoardList.jsp?curPageNum=<%=startPageNum - clickablePageCount%>">이전</a>]
			<%
			}
			%>
			<%
			for (int i = startPageNum; i <= endPageNum; i++) {
			%>
			[<a href="BoardList.jsp?curPageNum=<%=i%>"><%=i%></a>]
			<%
			}
			%>
			<%
			if (allPageCnt > endPageNum) {
			%>
			[<a href="BoardList.jsp?curPageNum=<%=endPageNum + 1%>">이후</a>]
			<%
			}
			%>
		</form>
	</div>
</body>
</html>