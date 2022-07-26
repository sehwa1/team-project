package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Vector;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// !!!
	// 회원가입&로그인 실패 사유 : DB 연동이 실패해서 conn이 자꾸 null값으로 뜸
	// mysql-connector-jar 이미 apply 되어있음
	// c##root/root로 로그인 확인 & database movieUser 생성해둠(확인완료) (show databases;)
	// table user와 board 새로 생성해둠(확인완료) (desc user; desc board;)
	// !!!
	
	//#-------------------------------------------------------
	// 연동 로그인 회원가입 성공
	// finally로 conn을 닫아서 문제<
	// 유저네임이 c##root가 아니라 그냥 root
	//#-------------------------------------------------------
	
	
	
	public UserDAO() {
		try {
		
			String url = "jdbc:mysql://database-1.c2si8hqxaejv.ap-northeast-2.rds.amazonaws.com:3306/movieUser?serverTimezone=UTC";
			String user = "admin";
			String password = "841%8S*2YqTc";
			
			
			
//			String user="root";
//			String password = "1004";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("db연동 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("db연동 실패");
		}
	}
	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					System.out.println("로그인 성공");
//					String nickname = rs.getString(2);
					return 1; // 로그인 성공
				}
				else
					System.out.println("비밀번호가 일치하지 않습니다");
					return 0; // 비밀번호 불일치
			}
			System.out.println("아이디가 존재하지 않습니다");
			return -1; // 존재하지 않는 아이디
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB연동 오류 로그인 실패");
		return -2; // 데이터베이스 오류
	}
	
	
	

	public int join(User user) {
		String SQL = "UPDATE user SET userID=?, userPassword=?, userName=?, userGender=?, userEmail=?, birthdate=?, nickname=?, country=?, mobile=?";
		Date date = new Date(user.getYear()-1900, user.getMonth()-1, user.getDay());
//		Timestamp birthdate = new Timestamp(date.getTime());
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setDate(6, date);
			pstmt.setString(7, user.getNickname());
			pstmt.setString(8, user.getCountry());
			pstmt.setString(9, user.getMobile());
			System.out.println("회원정보 수정 완료");
			return pstmt.executeUpdate();	// 리턴값 9
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류");
			return -1; // 데이터베이스 오류
		}
	}

	
	public String getNickname(String userID) {
		String SQL = "SELECT nickname FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			String nickname = rs.getString(2);

			return nickname;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Vector<User> checkUser(String userID) {	
		Vector<User> v = new Vector<>();
		try {

			String sql = "select * from user where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {		
				User user = new User(); 
		
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setDate(rs.getString(6));
//				//user.setMonth(Integer.parseInt(rs.getString(6).substring(6, 8)));
				//user.setDay(Integer.parseInt(rs.getString(6).substring(10, 12)));	
			
			//	System.out.println(Integer.parseInt(rs.getString(6).substring(6, 8)));
			//	System.out.println(Integer.parseInt(rs.getString(6).substring(10, 12)));
				user.setNickname(rs.getString(7));
				user.setCountry(rs.getString(8));
				user.setMobile(rs.getString(9));
				
				v.add(user);
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	
	public int modify(User user) {
		String SQL = "UPDATE user SET userId=?, userPassword=?, userName=?, userGender=?, userEmail=?, birthdate=?, nickname=?, country=?, mobile=? where userID=?";
		Date date = new Date(user.getYear()-1900, user.getMonth()-1, user.getDay());
//		Timestamp birthdate = new Timestamp(date.getTime());
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setDate(6, date);
			pstmt.setString(7, user.getNickname());
			pstmt.setString(8, user.getCountry());
			pstmt.setString(9, user.getMobile());
			pstmt.setString(10, user.getUserID());
			System.out.println("회원정보수정 완료");
			return pstmt.executeUpdate();	// 리턴값 9
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("입력오류");
			return -1; // 데이터베이스 오류
		}
	}
	
	
}
