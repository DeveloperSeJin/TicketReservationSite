package performance;

public class Review {
	private int reviewID;
	private int performanceID;
	private String coment;
	private String star;
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public int getPerformanceID() {
		return performanceID;
	}
	public void setPerformanceID(int performanceID) {
		this.performanceID = performanceID;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	
}