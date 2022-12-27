package performance;

public class Performance {
	private int performanceID;
	private String location;
	private String mainImg;
	private String posterImg;
	private String contentImg;
	private int available;
	private String performanceDate;
	private String title;
	private String content;
	
	public int getPerformanceID() {
		return performanceID;
	}
	public void setPerformanceID(int performanceID) {
		this.performanceID = performanceID;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	public String getContentImg() {
		return contentImg;
	}
	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public String getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(String performanceDate) {
		this.performanceDate = performanceDate;
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
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	private String sellerID;
}