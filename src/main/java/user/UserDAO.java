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

	public int login(String ID, String password, String type) {
		String SQL = "SELECT sellerPassword FROM " + type +" WHERE sellerID = ?";
		if (type.equals("user")) {
			SQL = "SELECT memberPassword FROM " + type +" WHERE memberID = ?";
		}
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1,  ID);
			rs = psmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
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
	
	public int join(User user) {
		String SQL = "INSERT INTO seller VALUES (?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, user.getID());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getEmail());
			psmt.setString(4, user.getName());
			return psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int join(Seller seller) {
		String SQL = "INSERT INTO seller VALUES (?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, seller.getID());
			psmt.setString(2, seller.getPassword());
			psmt.setString(3, seller.getEmail());
			psmt.setString(4, seller.getName());
			psmt.setString(5, seller.getPhonenumber());
			psmt.setString(6, seller.getCompany());
			return psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
