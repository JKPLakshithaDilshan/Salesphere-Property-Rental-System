package com.salesphere.model;

public class Property {
	private int propertyId;
	private int landlordId;
	private String title;
	private String address;
	private String type;
	private double rent;
	private String status;
	private String description;
	private String createdAt;

	private String landlordName;
	private String landlordEmail;
	
	public int getPropertyId() {
		return propertyId;
	}
	public int getLandlordId() {
		return landlordId;
	}
	public String getTitle() {
		return title;
	}
	public String getAddress() {
		return address;
	}
	public String getType() {
		return type;
	}
	public double getRent() {
		return rent;
	}
	public String getStatus() {
		return status;
	}
	public String getDescription() {
		return description;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getLandlordName() {
		return landlordName;
	}
	public String getLandlordEmail() {
		return landlordEmail;
	}
	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}
	public void setLandlordId(int landlordId) {
		this.landlordId = landlordId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setRent(double rent) {
		this.rent = rent;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setLandlordName(String landlordName) {
		this.landlordName = landlordName;
	}
	public void setLandlordEmail(String landlordEmail) {
		this.landlordEmail = landlordEmail;
	}
}