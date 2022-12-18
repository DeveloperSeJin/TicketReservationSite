package performance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PerformanceDAO {
	private Connection conn = null;
	private ResultSet rs = null;

	public PerformanceDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement psmt = conn.prepareStatement(SQL);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() { // 다음 글 가지고 오기.
	  	String SQL = "SELECT performanceID FROM performance ORDER BY performanceID DESC";
	  	try {
	  		PreparedStatement pstmt = conn.prepareStatement(SQL);
	  		rs = pstmt.executeQuery();
	  		if (rs.next()) {
	  			return rs.getInt(1) + 1;
	  		}
	  		return 1; // 첫 번째 게시물인 경우
	  	} catch(Exception e) {
	  		e.printStackTrace();
	  	}
	  	return -1; // 데이터베이스 오류
	  }

	  public int write(String location, String mainImg, String posterImg,
			  				String contentImg, String performanceDate, String company) {
	  	String SQL = "INSERT INTO performance VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	  	try {
	  		PreparedStatement pstmt = conn.prepareStatement(SQL);
	  		pstmt.setInt(1, getNext());
	  		pstmt.setString(2, location);
	  		pstmt.setString(3, mainImg);
	  		pstmt.setString(4, posterImg);
	  		pstmt.setString(5, contentImg);
	  		pstmt.setInt(6, 1);
	  		pstmt.setString(7, performanceDate);
	  		pstmt.setString(8, company);

	  		return pstmt.executeUpdate();
	  	} catch(Exception e) {
	  		e.printStackTrace();
	  	}
	  	return -1; // 데이터베이스 오류
	  }
	  
	  public ArrayList<Performance> getList(int pageNumber) {
			String SQL = "SELECT * FROM Performance WHERE PerformanceID < ? AND Available = 1 ORDER BY PerformanceID DESC LIMIT 10";
			ArrayList<Performance> list = new ArrayList<Performance>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Performance performance = new Performance();
					performance.setPerformanceID(rs.getInt(1));
					performance.setLocation(rs.getString(2));
					performance.setMainImg(rs.getString(3));
					performance.setPosterImg(rs.getString(4));
					performance.setContentImg(rs.getString(5));
					performance.setAvilable(rs.getInt(6));
					String date = rs.getString(7).split(" ")[0];
					String time = rs.getString(7).split(" ")[1];
					performance.setYear(date.split("-")[0]);
					performance.setMonth(date.split("-")[1]);
					performance.setDay(date.split("-")[2]);
					performance.setHour(time.split(":")[0]);
					performance.setMinute(time.split(":")[1]);
					performance.setCompany(rs.getString(8));
					performance.setContent(rs.getString(9));
					performance.setTitle(rs.getString(10));
					list.add(performance);
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}

		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM performance WHERE performanceID < ? AND Available = 1";

			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		public Performance getPerformance(int performanceID) {
			String SQL = "SELECT * FROM Performance WHERE PerformanceID = ?";

			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, performanceID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Performance performance = new Performance();
					performance.setPerformanceID(rs.getInt(1));
					performance.setLocation(rs.getString(2));
					performance.setMainImg(rs.getString(3));
					performance.setPosterImg(rs.getString(4));
					performance.setContentImg(rs.getString(5));
					performance.setAvilable(rs.getInt(6));
					String date = rs.getString(7).split(" ")[0];
					String time = rs.getString(7).split(" ")[1];
					performance.setYear(date.split("-")[0]);
					performance.setMonth(date.split("-")[1]);
					performance.setDay(date.split("-")[2]);
					performance.setHour(time.split(":")[0]);
					performance.setMinute(time.split(":")[1]);
					performance.setCompany(rs.getString(8));
					performance.setContent(rs.getString(9));
					performance.setTitle(rs.getString(10));
					return performance;
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
