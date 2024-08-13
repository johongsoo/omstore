package com.web.spring.vo;

import java.util.Date;

public class Users {
    private String userid;
	private String name;
	private String pwd;
	private String email;
	private Date birthdate;
	private String phone;
	private String rating;
	private int point;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String userid, String name, String pwd, String email, Date birthdate, String phone, String rating,
			int point) {
		super();
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.birthdate = birthdate;
		this.phone = phone;
		this.rating = rating;
		this.point = point;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
