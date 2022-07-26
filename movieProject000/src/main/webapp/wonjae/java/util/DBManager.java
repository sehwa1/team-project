package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	public static Connection getConnection(String database) {
		Connection conn = null;
		
		String url = String.format("jdbc:mysql://database-1.c2si8hqxaejv.ap-northeast-2.rds.amazonaws.com:3306/%s?serverTimezone=UTC", database);
		String user = "admin";
		String password = "841%8S*2YqTc";
		
		try {
		  Class.forName("com.mysql.cj.jdbc.Driver"); // �н��� ��Ƽ� driver �������
		  conn = DriverManager.getConnection(url+database, user, password);
		  System.out.println("DB ���� ����");
		  return conn;
		  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("DB ���� ����");
			return null;			
		}
	}//��
}
