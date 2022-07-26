
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
	// 1) 세션에서 유저 정보 받아오기
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	// 보드 리스트
	ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList();
	
	//1.
	int allArticlesCount = BoardDAO.getInstance().getBoardCnt();		// 전체 게시글 수 = 보드리스트사이즈
	int onePageArticlesCount = 5;										// 한 페이지에 보여줄 게시글 수
	if(session.getAttribute("onePageArticlesCount") != null) {			// 페이지에서 입력된 한페이지게시글수 가 없으면(기본값) 세션에서 값을 가져옴
		onePageArticlesCount = ((Integer)session.getAttribute("onePageArticlesCount")).intValue();
	}
	
	//2.
	int allPageCount = allArticlesCount / onePageArticlesCount;					// 전체 페이지 수 = (전체게시글수 / 한페이지게시글수) 의 몫		ex) 7/5 = 1
	if(allArticlesCount % onePageArticlesCount != 0) {
		allPageCount += 1;			// 만약 나머지가 있으면 전체 페이지 수 +1
	}
	
	int currentPageNumber = 1;										// 현재페이지번호
	if(request.getParameter("currentPageNumber") != null) {			// 현재페이지번호가 null이 아니면 현재페이지번호에 파라미터를 가져옴
		currentPageNumber = Integer.parseInt(request.getParameter("currentPageNumber"));
	}
	
	int startRow = (currentPageNumber - 1) * onePageArticlesCount;				// 현재 페이지의 게시글 시작번호 = (현재페이지번호 - 1) X 한페이지당게시글수
	int endRow = startRow + onePageArticlesCount;						// 현재 페이지의 게시글 마지막번호 = 시작번호 + 한페이지당게시글수
	if(endRow > allArticlesCount) {
		endRow = allArticlesCount;	// 만약 마지막번호가 전체게시글수 보다 크면 마지막번호=전체게시글수
	}

	%>
	
	<div class="movieBoard" align="center" style="margin-top: 180px">
		<h1>영화 게시판</h1>
	</div>
	<div class="boardList" align="center" style="margin-top: 70px;">

		<form method="get" action="UpdateBoardSize.jsp">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td colspan="5" align="right" height="35px">
							<select name="onePageArticlesCount">
							<option value="5">5개씩</option>
							<option value="10">10개씩</option>
							<option value="15">15개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
						</select>
					<input class="pageSizeChangeBT" type="submit" value="변경"
						style="width: 60px; margin-right: 15px;"></td>
				</tr>

				<tr>
					<td colspan="5" align="right" height="35px"><input
						class="writeBT" type="button" <%if (userID == null) {%>
						onclick="alert('먼저 로그인을 해주세요.'); location.href ='login.jsp'"
						<%} else {%>
						onclick="location.href = 'BoardWrite.jsp'" <%}%>
						value="글쓰기" style="width: 60px; margin-right: 15px;"></td>
				</tr>
				<tr style="text-align: center" height="35px">
					<td width="40px">번호</td>
					<td width="80px">작성자</td>
					<td width="500px">제목</td>
					<td width="110px">작성일</td>
					<td width="60px">조회수</td>
				</tr>
				<%	
				for(int i=startRow; i<endRow; i++) { 
					BoardDTO board = boardList.get(i);
				%>
				<tr height="40px">
					<td style="text-align: center"><%=board.getNum()%></td>
					<td style="text-align: center"><%=board.getId()%></td>
					<td style="padding-left: 10px"><a href="BoardView.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a></td>
					<td style="text-align: center"><%=board.getRegDate()%></td>
					<td style="text-align: center"><%=board.getReadCount()%></td>
				</tr>
				<%
				System.out.println("보드표기중... 보드넘버 : " + boardList.get(i).getNum());
				}
				%>
			</table>

			<%
			int clickablePageCount = 5;			
			int startPageNum = 1;
			
			// 현재 페이지 번호가 (1~4 일때와 5일때)
			if(currentPageNumber % clickablePageCount != 0){
				startPageNum = (currentPageNumber / clickablePageCount) * clickablePageCount + 1;
			}else{
				startPageNum = (currentPageNumber / clickablePageCount - 1) * clickablePageCount + 1;
			}
			int endPageNum = startPageNum + clickablePageCount  - 1;
			if(endPageNum > allPageCount){
				endPageNum = allPageCount;
			}
			%>
			<%
			if(startPageNum > clickablePageCount) {
			%>
				[<a href="BoardList.jsp?currentPageNumber=<%= startPageNum - clickablePageCount %>">이전</a>]
			<%
			}
			%>
			<%
			for(int i=startPageNum; i<=endPageNum; i++) {
			%>
				[<a href="BoardList.jsp?currentPageNumber=<%= i %>"><%= i %></a>]
			<%
			}
			%>
			<%
			if(allPageCount > endPageNum) {
			%>
				[<a href="BoardList.jsp?currentPageNumber=<%= endPageNum + 1 %>">이후</a>]
			<%
			}
			%>
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