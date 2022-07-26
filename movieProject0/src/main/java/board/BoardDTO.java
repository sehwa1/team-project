package board;

public class BoardDTO {
	private int num;					// 寃뚯떆湲� 踰덊샇
	private String id;					// 寃뚯떆湲� �옉�꽦�옄
	private String nickname;			// 寃뚯떆湲� �옉�꽦�옄 �땳�꽕�엫
	private String title;				// 寃뚯떆湲� �젣紐�
	private String content;				// 寃뚯떆湲� �궡�슜
	private String regDate;				// 寃뚯떆湲� �옉�꽦�씪
	private int readCount;				// 寃뚯떆湲� 議고쉶 �닔

	public BoardDTO() {}
	
	public BoardDTO(int num, String id, String nickname, String title, String content, String regDate, int readCount) {
		this.num = num;
		this.id = id;
		this.nickname = nickname;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "[" + num + "] " + id + "(" + nickname + ")\t" + title + "\t(" + readCount + ")";
	}
	
}
