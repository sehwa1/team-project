package board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
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
	
	private static int idNum; // 게시글 고유 번호
	private ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();

	public String realPath;
	public String fileName = "board.txt";

	// (1) board 입력
	public void boardWrite(BoardDTO board) {
		int num = BoardDAO.idNum + 1;
		String regDate = getDate();

		board.setNum(num);
		board.setRegDate(regDate);

		BoardDAO.idNum++;
		boardList.add(board);

		fileSave(); // 데이터베이스 연동 필요
	}

	// (2) 전제 게시글 수 리턴
	public int getAllCount() {
		return boardList.size();
	}

	// (3) 오늘 날짜 리턴
	public String getDate() {
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}

	// (4) boardList 리턴
	public ArrayList<BoardDTO> getBoardList() {
		return boardList;
	}

	// (5) num으로 해당 게시글의 인덱스 리턴
	public int getBoardIndex(int num) {
		int index = 0;
		for (int i = 0; i < boardList.size(); i++) {
			if (boardList.get(i).getNum() == num) {
				index = i;
			}
		}

		return index;
	}

	// (6) num으로 해당 게시글 정보 리턴 (BoardView.jsp)
	public BoardDTO viewBoard(int num) {

		int index = getBoardIndex(num);

		boardList.get(index).setReadCount(boardList.get(index).getReadCount() + 1); // 조회수 1증가

		fileSave();

		return boardList.get(index);
	}

	// (7) 게시글의 내용(제목,내용) 수정
	public void boardUpdate(BoardDTO board) {

		int index = getBoardIndex(board.getNum());

		boardList.get(index).setTitle(board.getTitle());
		boardList.get(index).setContent(board.getContent());

		fileSave();
	}

	// (8) 게시글 삭제 (로그인 상태면 1, 아니면 -1 리턴)
	public int boardDelete(int num, String userID) {
		int result = -1;

		int index = getBoardIndex(num);
		
		if (userID != null) {
			result = 1;
			boardList.remove(index);
		}

		fileSave();

		return result;
	}

	// (9) 현재 데이터를 한개의 문자열로 연결해 저장데이터 제작
	public String makeFileData() {
		// 게시글의 마지막 번호
		// num/id/nickname/title/content/regDate/readCount
		String data = idNum + "\n";
		for (int i = 0; i < boardList.size(); i++) {
			data += boardList.get(i).getNum() + "/";
			data += boardList.get(i).getId() + "/";
			data += boardList.get(i).getNickname() + "/";
			data += boardList.get(i).getTitle() + "/";
			data += boardList.get(i).getContent() + "/";
			data += boardList.get(i).getRegDate() + "/";
			data += boardList.get(i).getReadCount();

			if (i != boardList.size() - 1) {
				data += "\n";
			}
		}
		System.out.println(data);

		return data;
	}

	// (10) 파일 저장
	public void fileSave() {
		String data = makeFileData();

		FileWriter fw = null;
		try {
			fw = new FileWriter(realPath + fileName);
			fw.write(data);
			System.out.println("파일이 저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
				}
			}
		}

		fileLoad();
	}

	// (11) 파일 로드	// DB 연동 방식으로 바꾸기
	public void fileLoad() {
		File file = new File(realPath + fileName);
		System.out.println("파일 위치 = " + realPath);

		if (file.exists()) {
			boardList.clear();

			FileReader fr = null;
			BufferedReader br = null;

			try {
				fr = new FileReader(file);
				br = new BufferedReader(fr);

				BoardDAO.idNum = Integer.parseInt(br.readLine());

				while (true) {
					String line = br.readLine();
					if (line == null)
						break;

					String[] data = line.split("/");

					BoardDTO board = new BoardDTO();
					board.setNum(Integer.parseInt(data[0]));
					board.setId(data[1]);
					board.setNickname(data[2]);
					board.setTitle(data[3]);
					board.setContent(data[4]);
					board.setRegDate(data[5]);
					board.setReadCount(Integer.parseInt(data[6]));

					boardList.add(board);
				}

				if (boardList.size() <= 0) {
					return;
				}

				System.out.println("파일이 로드되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (fr != null) {
					try {
						fr.close();
					} catch (IOException e) {
					}
				}
				if (br != null) {
					try {
						br.close();
					} catch (IOException e) {
					}
				}
			}
		}
	}


}
