package kr.co.sist.user.member;

public class LoginDTO {
	private String id,password;

	public LoginDTO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public LoginDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
