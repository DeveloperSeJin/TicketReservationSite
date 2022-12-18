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
			//connection �Ұ� ����
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
					return 1; // �α��� ����
				} else {
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
}
