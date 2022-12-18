package performance;

public class Qna {
	private int qaID;
	private int performanceID;
	private String title;
	private String content;
	private String answer;
	
	public int getQaID() {
		return qaID;
	}
	public void setQaID(int qaID) {
		this.qaID = qaID;
	}
	public int getPerformanceID() {
		return performanceID;
	}
	public void setPerformanceID(int performanceID) {
		this.performanceID = performanceID;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}