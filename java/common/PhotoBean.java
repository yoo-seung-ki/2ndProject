package common;

public class PhotoBean {
	
	//private int num;
	private String companySeq;		// ¤·
	private String photoUrl;		// ¤·
	private String subject;      	// x
	private String content;         // x
	private int count;				// x
	
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

	public String getCompanySeq() {
		return companySeq;
	}

	public void setCompanySeq(String companySeq) {
		this.companySeq = companySeq;
	}
	

}
