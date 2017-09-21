package model.user;

public class UserVO {
	private String id;
	private String pw;
	private String u_name;
	private String email;
	private String u_infop;
	private String u_grade ;
	
	public UserVO() {
		super();
	}
	public UserVO(String id, String pw, String u_name, String email, String u_infop, String u_grade) {
		super();
		this.id = id;
		this.pw = pw;
		this.u_name = u_name;
		this.email = email;
		this.u_infop = u_infop;
		this.u_grade = u_grade;
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
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getU_infop() {
		return u_infop;
	}
	public void setU_infop(String u_infop) {
		this.u_infop = u_infop;
	}
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", u_name=" + u_name + ", email=" + email + ", u_infop=" + u_infop
				+ ", u_grade=" + u_grade + "]";
	}
	
}
