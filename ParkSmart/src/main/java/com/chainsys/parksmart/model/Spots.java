package com.chainsys.parksmart.model;

import org.springframework.stereotype.Repository;

@Repository
public class Spots {
	int userId;
	int spotId;
	String locationName;
	String address;
	String vehicleType;
	String spotNumber;
	int countSpotNumber;
	boolean spotStatus = true;

	public Spots(int userId, int spotId, String locationName, String address, String vehicleType, String spotNumber,
			boolean spotStatus) {
		super();
		this.userId = userId;
		this.spotId = spotId;
		this.locationName = locationName;
		this.address = address;
		this.vehicleType = vehicleType;
		this.spotNumber = spotNumber;
		this.spotStatus = spotStatus;
	}

	public Spots() {
	}

	@Override
	public String toString() {
		return "Spots [userId=" + userId + ", spotId=" + spotId + ", locationName=" + locationName + ", address="
				+ address + ", vehicleType=" + vehicleType + ", spotNumber=" + spotNumber + ", countSpotNumber="
				+ countSpotNumber + ", spotStatus=" + spotStatus + ", getUserId()=" + getUserId() + ", getSpotId()="
				+ getSpotId() + ", getLocationName()=" + getLocationName() + ", getAddress()=" + getAddress()
				+ ", getVehicleType()=" + getVehicleType() + ", getSpotNumber()=" + getSpotNumber()
				+ ", getCountSpotNumber()=" + getCountSpotNumber() + ", isSpotStatus()=" + getSpotStatus() + "]";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSpotId() {
		return spotId;
	}

	public void setSpotId(int spotId) {
		this.spotId = spotId;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getSpotNumber() {
		return spotNumber;
	}

	public void setSpotNumber(String spotNumber) {
		this.spotNumber = spotNumber;
	}

	public int getCountSpotNumber() {
		return countSpotNumber;
	}

	public void setCountSpotNumber(int countSpotNumber) {
		this.countSpotNumber = countSpotNumber;
	}

	public boolean getSpotStatus() {
		return spotStatus;
	}

	public void setSpotStatus(boolean spotStatus) {
		this.spotStatus = spotStatus;
	}

}
