package com.sun.entity;

public class InMessage {
	int uid;
	String data;
	String date;
	String filed;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFiled() {
		return filed;
	}
	public void setFiled(String filed) {
		this.filed = filed;
	}
	@Override
	public String toString() {
		return "InMessage [uid=" + uid + ", data=" + data + ", date=" + date
				+ ", filed=" + filed + "]";
	}
	public InMessage(int uid, String data, String date, String filed) {
		super();
		this.uid = uid;
		this.data = data;
		this.date = date;
		this.filed = filed;
	}
	public InMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
