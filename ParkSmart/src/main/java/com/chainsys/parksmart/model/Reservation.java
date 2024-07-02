package com.chainsys.parksmart.model;

public class Reservation {
	int userId;
	int reservationId;
	String numberPlate;
	String startDateTime;
	String endDateTime;
	String reservationStatus;
	boolean isActive = true;

	public Reservation(int userId, int reservationId, String numberPlate, String startDateTime, String endDateTime,
			String reservationStatus, boolean isActive) {
		super();
		this.userId = userId;
		this.reservationId = reservationId;
		this.numberPlate = numberPlate;
		this.startDateTime = startDateTime;
		this.endDateTime = endDateTime;
		this.reservationStatus = reservationStatus;
		this.isActive = isActive;
	}

	public Reservation() {
	}

	@Override
	public String toString() {
		return "Reservation [userId=" + userId + ", reservationId=" + reservationId + ", numberPlate=" + numberPlate
				+ ", startDateTime=" + startDateTime + ", endDateTime=" + endDateTime + ", reservationStatus="
				+ reservationStatus + ", isActive=" + isActive + ", getUserId()=" + getUserId()
				+ ", getReservationId()=" + getReservationId() + ", getNumberPlate()=" + getNumberPlate()
				+ ", getStartDateTime()=" + getStartDateTime() + ", getEndDateTime()=" + getEndDateTime()
				+ ", getReservationStatus()=" + getReservationStatus() + ", isActive()=" + getIsActive() + "]";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public String getNumberPlate() {
		return numberPlate;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	public String getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}

	public String getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public boolean getIsActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
