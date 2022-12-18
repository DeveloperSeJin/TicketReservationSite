package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {

	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement psmt = null;

	public UserDAO() {
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/community";
			String dbUser = "root";
			String dbPass = "1010";
			//connection 불가 상태
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1,  userID);
			rs = psmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
}
