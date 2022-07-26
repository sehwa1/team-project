package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {

	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	
	ArrayList<BoardDTO> boardList = getBoardList();	// 보드 전체 데이터 받아서 리스트로 만들기
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private boolean rs2 = false;

	private static int idNum; // 게시글 고유 번호(낮아지지 않음)
	private int boardCnt; // 게시글 개수(보드 삭제시 낮아짐) = boardList.size();
	
	
	// 1)
	public Connection getConnection() {
		String url = "jdbc:mysql://database-1.c2si8hqxaejv.ap-northeast-2.rds.amazonaws.com:3306/movieUser?serverTimezone=UTC";
		String user = "admin";
		String password = "841%8S*2YqTc";
		
		
//		String url = "jdbc:mysql://localhost:3306/movieUser?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
//		String user = "root";
//		String password = "1004";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			  conn = DriverManager.getConnection(url, user, password);
			  System.out.println("DB 연동 완료");
			  return conn;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
			return null;
		}
	}
	
	
	// 2) boardList 제작 및 리턴
		public ArrayList<BoardDTO> getBoardList() {
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			conn=getConnection();
			BoardDTO board = null;
			
			try {
				String sql = "select * from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int num = rs.getInt(1);
					String id = rs.getString(2);
					String nickname = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String regDate = rs.getString(6);
					int readCount = rs.getInt(7);
					
					board = new BoardDTO(num, id, nickname, title, content, regDate, readCount);
					list.add(board);
				}		
				System.out.println("보드 리스트 불러오기 완료");
				System.out.println("보드리스트 사이즈: " + list.size());
				boardCnt = list.size();
				for(int i=0; i<list.size(); i++) {
					System.out.println("제목: " + list.get(i).getTitle() + " / 내용: " + list.get(i).getContent());
				}
				return list;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			} finally {
				try {
					conn.close();
					pstmt.close();
				} catch (Exception e2) {
				}
			}		
		}
	
	public int getBoardCnt() {
		return boardCnt;
	}
	
	// 3) 보드 쓰기
	public void writeBoard(BoardDTO board) {
		int num = idNum + 1;
		String regDate = getDate();
		board.setNum(num);	// 게시판 번호
		board.setRegDate(regDate);	// 날짜
		// 보드 세팅 완료

		conn = getConnection();

		try {
			String sql = "insert into board values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getNickname());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegDate());
			pstmt.setInt(7, board.getReadCount());
			
			pstmt.execute();
			idNum++;
			boardCnt++;
		
			System.out.println("보드 쓰기 성공");
			boardList.add(board);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("보드 쓰기 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
			}
		}
	}

	// 5) 오늘 날짜 제공
	public String getDate() {
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}

	
	
	// 6) num으로 해당 게시글의 인덱스 리턴
	public int getBoardIndex(int num) {
		int index = 0;
		for (int i = 0; i < boardList.size(); i++) {
			if (boardList.get(i).getNum() == num) {
				index = i;
			}
		}
		return index;
	}

	
	// 7) 보드 정보 확인 (BoardView.jsp)
	public BoardDTO getBoard(int num) {
		BoardDTO board = null;
		
		conn=getConnection();

		try {
			String sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1) == num) {
					String id = rs.getString(2);
					String nickname = rs.getString(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					String regDate = rs.getString(6);
					int readCount = rs.getInt(7) + 1;	// 보여주는 조회수 1 증가
					updateReadCount(num);	// 조회수 DB 반영
					
					board = new BoardDTO(num, id, nickname, title, content, regDate, readCount);
					System.out.println("보드 로딩 완료");
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("보드 로딩 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
			}
		}
		return board;
	}

	// 8) DB 게시글의 조회수 1 증가
	public void updateReadCount(int num) {
		BoardDTO board = boardList.get(getBoardIndex(num));
		
		conn=getConnection();
		
		try {
			String sql = "UPDATE board SET readCount = ? where num = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, board.getReadCount()+1);
			pstmt.setInt(2, num);
			
			pstmt.execute();
			
			//리스트의 조회수도 증가
			boardList.get(getBoardIndex(board.getNum())).setReadCount(board.getReadCount()+1);
			System.out.println("조회수 +1 완료");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("조회수 증가 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	// 9) 게시글의 내용(제목&내용만) 수정
	public void updateBoard(BoardDTO board) {
		conn = getConnection();

		try {
			System.out.println(board.getTitle());
			System.out.println(board.getContent());
			System.out.println(board.getNum());
			
			String sql = "update board set title="+ board.getTitle() +", content="+ board.getContent() +" WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setString(1, board.getTitle());
//			pstmt.setString(2, board.getContent());
			pstmt.setInt(1, board.getNum());
			
			int result = pstmt.executeUpdate();
			
			// 보드리스트의 title과 content도 바꾸기
			boardList.get(getBoardIndex(board.getNum())).setTitle(board.getTitle());
			boardList.get(getBoardIndex(board.getNum())).setContent(board.getContent());
			System.out.println("#----------------------------------------");
			System.out.println("보드 수정 완료");
			System.out.println(result);	//수행된 행의 개수
			System.out.println("#----------------------------------------");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("보드 수정 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	// (8) 게시글 삭제 (로그인 상태면 1, 아니면 -1 리턴) / 1차적으로 아이디가 같을때만 삭제 버튼이 뜸
	public boolean boardDelete(int num, String userID) {
		boolean result = false;
		int index = getBoardIndex(num);	// 보드리스트 삭제용

		conn=getConnection();
			//DB에서 num으로 검색했을 때 userID가 같으면 delete문 넣기
		try {
			String sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1) == num) {
					if(rs.getString(2).equals(userID)) {
						String sql2 = "delete from board where num = " + num ;
						pstmt = conn.prepareStatement(sql2);
						rs2 = pstmt.execute();
						System.out.println("#----------------------------------------");
						System.out.println("보드 삭제 성공");
						System.out.println("#----------------------------------------");
						result = true;
						break;
					}
					else {
						System.out.println("보드 아이디 불일치, 삭제 실패");
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("보드 삭제 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
			}
		}
			
			//보드리스트에서도 삭제
			boardList.remove(index);
			boardCnt--;


		return result;
	}

}
