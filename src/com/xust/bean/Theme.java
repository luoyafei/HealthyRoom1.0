package com.xust.bean;

import java.util.Date;

public class Theme {
	
	private int themeId;
	private int userId;
	private String title;
	private String cont;
	private String picture;
	private Date publishtime;
	private int contAmount;
	private int hadRead = 0;
	
	public int getHadRead() {
		return hadRead;
	}
	public void setHadRead(int hadRead) {
		this.hadRead = hadRead;
	}
	public int getThemeId() {
		return themeId;
	}
	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Date getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Date publishtime) {
		this.publishtime = publishtime;
	}
	public int getContAmount() {
		return contAmount;
	}
	public void setContAmount(int contAmount) {
		this.contAmount = contAmount;
	}

}
