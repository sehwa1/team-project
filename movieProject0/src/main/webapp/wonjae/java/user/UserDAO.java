package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import util.DBManager;

public class UserDAO {
	// ΩÃ≈¨≈Ê
		private UserDAO() {}
		private static UserDAO instance = new UserDAO();
		public static UserDAO getInstance() {
			return instance;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		public void addUser(UserDTO userDto) {
			conn = DBManager.getConnection("movieUser");
			try {
				String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?)";
				
				Date date = new Date(userDto.getYear()-1900, userDto.getMonth()-1, userDto.getDay());
//				Timestamp birthdate = new Timestamp(date.getTime());
				
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userDto.getId());
				pstmt.setString(2, userDto.getPassword());
				pstmt.setString(3, userDto.getName());
				pstmt.setString(4, userDto.getNickname());
				pstmt.setDate(5, date);
				pstmt.setString(6, userDto.getGender());
				pstmt.setString(7, userDto.getEmail());
				pstmt.setString(8, userDto.getCountry());
				pstmt.setString(9, userDto.getMobile());
				pstmt.setString(10, userDto.getAddress());
				pstmt.execute();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					conn.close();
					pstmt = null;
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		

		//§∑
		public boolean loginCheck(UserDTO userDto) {
			conn = DBManager.getConnection("movieUser");
			try {
				String sql = "select id from users where id=? and pw=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userDto.getId());
				pstmt.setString(2, userDto.getPassword());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;
		}
		
		// !
		public boolean checkDupl(UserDTO userDto) {
			conn = DBManager.getConnection("movieUser");
			try {
				String sql = "select id from users where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userDto.getId());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return false;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return true;
		}
}
