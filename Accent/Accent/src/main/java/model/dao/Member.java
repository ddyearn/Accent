package accent;

public class Member {
	private int member_id;
	private String name; 
	private String pwd; 
	private String residentNum;
	private String email; 
	private String addr; 
	private String tel; 
	
	public Member() { }
	
	public Member(int member_id, String name, String pwd, String residentNum, String email, String addr, String tel) {
		super();
		this.member_id = member_id;
		this.name = name;
		this.pwd = pwd;
		this.residentNum = residentNum;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
	}
	
	public Member(String name, String pwd, String email, String addr, String tel) {//update¿ë
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
	}
	
	public int getMember_id() {
		return member_id;
	}
	
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getResidentNum() {
		return residentNum;
	}

	public void setResidentNum(String residentNum) {
		this.residentNum = residentNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
  
}
