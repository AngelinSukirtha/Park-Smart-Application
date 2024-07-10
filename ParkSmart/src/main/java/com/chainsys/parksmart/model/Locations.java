package com.chainsys.parksmart.model;

import java.util.Arrays;

public class Locations {
	int locationId;
	String location;
	byte[] locationImage;
	String addressName;

	public Locations(int locationId, String location, byte[] locationImage, String addressName) {
		super();
		this.locationId = locationId;
		this.location = location;
		this.locationImage = locationImage;
		this.addressName = addressName;
	}

	public Locations() {
	}

	@Override
	public String toString() {
		return "Locations [locationId=" + locationId + ", location=" + location + ", locationImage="
				+ Arrays.toString(locationImage) + ", addressName=" + addressName + ", getLocationId()="
				+ getLocationId() + ", getLocation()=" + getLocation() + ", getLocationImage()="
				+ Arrays.toString(getLocationImage()) + ", getAddressName()=" + getAddressName() + "]";
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public byte[] getLocationImage() {
		return locationImage;
	}

	public void setLocationImage(byte[] locationImage) {
		this.locationImage = locationImage;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
}
