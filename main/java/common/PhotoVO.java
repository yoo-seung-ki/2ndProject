package common;

public class PhotoVO {
	
	//private int num;
	private String photoSeq;
	private String photoUrl;
	private String subject;      
	private String content;         
	private int count;
	
	public String getPhotoSeq() {
		return photoSeq;
	}

	public void setPhotoSeq(String photoSeq) {
		this.photoSeq = photoSeq;
	}
	
	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	

}
