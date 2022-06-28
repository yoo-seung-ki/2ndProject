package common;

public class AdminVO {
	private int adminseq;
	private String id;
	private String pw;
	private String name;
	private String mobile;
	
	public int getAdminseq() {
		return adminseq;
	}
	public void setAdminseq(int adminseq) {
		this.adminseq = adminseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}
