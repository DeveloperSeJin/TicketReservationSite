package performance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class QNADAO {
	private Connection conn = null;
	private ResultSet rs = null;

	public QNADAO() {
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
	
	public int getNext(int performanceID) { // 다음 글 가지고 오기.
	  	String SQL = "SELECT reviewID FROM qna WHERE performanceID = " + performanceID + " ORDER BY qnaID DESC";
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

	  public int write(String star, String coment, int performanceID) {
	  	String SQL = "INSERT INTO review VALUES (?, ?, ?, ?)";
	  	try {
	  		PreparedStatement pstmt = conn.prepareStatement(SQL);
	  		pstmt.setInt(1, getNext(performanceID));
	  		pstmt.setInt(2, performanceID);
	  		pstmt.setString(3, coment);
	  		pstmt.setString(4, star);

	  		return pstmt.executeUpdate();
	  	} catch(Exception e) {
	  		e.printStackTrace();
	  	}
	  	return -1; // 데이터베이스 오류
	  }
	  
	  public ArrayList<Qna> getList(int pageNumber, int performanceID) {
			String SQL = "SELECT * FROM qna WHERE qnaID < ?  && performanceID == " + performanceID + " ORDER BY qnaID DESC LIMIT 10";
			ArrayList<Qna> list = new ArrayList<Qna>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext(performanceID) - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Qna qna = new Qna();
					qna.setQaID(rs.getInt(1));
					qna.setPerformanceID(performanceID);
					qna.setTitle(rs.getString(3));
					qna.setContent(rs.getString(4));
					qna.setAnswer(rs.getString(5));
					list.add(qna);
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}

		public boolean nextPage(int pageNumber, int performanceID) {
			String SQL = "SELECT * FROM qna WHERE qnaID < ? && performanceID == " + performanceID;

			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext(performanceID) - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return true;
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		public Qna getQna(int qnaID, int performanceID) {
			String SQL = "SELECT * FROM qna WHERE QnaID = ? && performanceID == " + performanceID;

			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, performanceID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Qna qna = new Qna();
					qna.getQaID();
					qna.getPerformanceID();
					qna.getContent();
					qna.getTitle();
					qna.getAnswer();
					return qna;
				}			
			} catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
