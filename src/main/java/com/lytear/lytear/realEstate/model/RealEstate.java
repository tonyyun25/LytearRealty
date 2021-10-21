package com.lytear.lytear.realEstate.model;

import java.util.Date;

public class RealEstate {
	
	private int id;
	private int userId;
	private String userName;
	private String imagePath;
	private String memberType;
	private String Type;
	private String address;
	private double space;
	private int price;
	private int downPayment;
	private int rent;
	private int complexNumber;
	private int housingUnitNumber;
	private String residence;
	private Date moveInDate;
	private String option;
	private String others;
	private Date startDate;
	private Date endDate;
	private Date createdAt;
	private Date updatedAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getSpace() {
		return space;
	}
	public void setSpace(double space) {
		this.space = space;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDownPayment() {
		return downPayment;
	}
	public void setDownPayment(int downPayment) {
		this.downPayment = downPayment;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public int getComplexNumber() {
		return complexNumber;
	}
	public void setComplexNumber(int complexNumber) {
		this.complexNumber = complexNumber;
	}
	public int getHousingUnitNumber() {
		return housingUnitNumber;
	}
	public void setHousingUnitNumber(int housingUnitNumber) {
		this.housingUnitNumber = housingUnitNumber;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public Date getMoveInDate() {
		return moveInDate;
	}
	public void setMoveInDate(Date moveInDate) {
		this.moveInDate = moveInDate;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
