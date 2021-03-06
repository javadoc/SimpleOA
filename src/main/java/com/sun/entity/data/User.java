package com.sun.entity.data;

import java.util.Date;

public class User {
	String name;
	Date birthday;
	String tel_phone;
	String mobile_phone;
	String email;
	String status;
	String head;
	int job;
	int department;
	int position_status;
	int gender;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTel_phone() {
		return tel_phone;
	}
	public void setTel_phone(String tel_phone) {
		this.tel_phone = tel_phone;
	}
	public String getMobile_phone() {
		return mobile_phone;
	}
	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getJob() {
		return job;
	}
	public void setJob(int job) {
		this.job = job;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public int getPosition_status() {
		return position_status;
	}
	public void setPosition_status(int position_status) {
		this.position_status = position_status;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", birthday=" + birthday + ", tel_phone=" + tel_phone + ", mobile_phone=" + mobile_phone + ", email=" + email + ", status=" + status + ", head=" + head + ", job=" + job + ", department=" + department + ", position_status=" + position_status + ", gender=" + gender + "]";
	}
	public User(String name, Date birthday, String tel_phone, String mobile_phone, String email, String status, String head, int job, int department, int position_status, int gender) {
		super();
		this.name = name;
		this.birthday = birthday;
		this.tel_phone = tel_phone;
		this.mobile_phone = mobile_phone;
		this.email = email;
		this.status = status;
		this.head = head;
		this.job = job;
		this.department = department;
		this.position_status = position_status;
		this.gender = gender;
	}
	public User() {
		
	}
}
