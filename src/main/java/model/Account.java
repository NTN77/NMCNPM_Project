package model;

public class Account {
	private String email, pwd;
	private int role;
	private String name, address, phone, photo;

	public Account() {}

	public Account(String email, String pwd, int role, String name, String address, String phone) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	
	public Account(String email, String pwd, int role, String name, String address, String phone, String photo) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public static boolean validate(String email, String pwd) {
		String regrexEmail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
		String regrexPassword = "[a-zA-Z0-9_!@#$%^&*]+";
		return email.matches(regrexEmail) && pwd.matches(regrexPassword);
	}
}