package user;

public class UserDTO {
	private String id, password, name, nickname;
	private int year, month, day;
	private String gender, email, country, mobile, address;
	
	public UserDTO(String id, String password, String name, String nickname, int year, int month, int day, String gender, String email, String country, String mobile, String address) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.year = year;
		this.month = month;
		this.day = day;
		this.gender = gender;
		this.email = email;
		this.country = country;
		this.mobile = mobile;
		this.address = address;
	}

	public UserDTO(String id) {
		this.id=id;
	}
	
	public UserDTO(String id, String password) {
		this.id = id;
		this.password = password;
	}
	public String getId() {
		return id;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
//¤·
	public String getName() {
		return name;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getYear() {
		return year;
	}


	public int getMonth() {
		return month;
	}



	public int getDay() {
		return day;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
