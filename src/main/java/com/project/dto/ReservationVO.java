package com.project.dto;

import java.sql.Date;

public class ReservationVO {
	
	private int reservationSeq;
	private int hotelSeq;
	private String hotelName;
	private String userId;
	private int personNumber;
	private Date reservationCheckInDate;
	private Date reservationCheckOutDate;
	private String hotelImage;
	private int hotelPrice;
	private int totalPrice;
	private int stayInDay;
	private int roomTypeSeq;
	
	public int getRoomTypeSeq() {
		return roomTypeSeq;
	}
	public void setRoomTypeSeq(int roomTypeSeq) {
		this.roomTypeSeq = roomTypeSeq;
	}
	public int getReservationSeq() {
		return reservationSeq;
	}
	public void setReservationSeq(int reservationSeq) {
		this.reservationSeq = reservationSeq;
	}
	public int getHotelSeq() {
		return hotelSeq;
	}
	public void setHotelSeq(int hotelSeq) {
		this.hotelSeq = hotelSeq;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPersonNumber() {
		return personNumber;
	}
	public void setPersonNumber(int personNumber) {
		this.personNumber = personNumber;
	}
	public Date getReservationCheckInDate() {
		return reservationCheckInDate;
	}
	public void setReservationCheckInDate(Date reservationCheckInDate) {
		this.reservationCheckInDate = reservationCheckInDate;
	}
	public Date getReservationCheckOutDate() {
		return reservationCheckOutDate;
	}
	public void setReservationCheckOutDate(Date reservationCheckOutDate) {
		this.reservationCheckOutDate = reservationCheckOutDate;
	}
	public String getHotelImage() {
		return hotelImage;
	}
	public void setHotelImage(String hotelImage) {
		this.hotelImage = hotelImage;
	}
	public int getHotelPrice() {
		return hotelPrice;
	}
	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getStayInDay() {
		return stayInDay;
	}
	public void setStayInDay(int stayInDay) {
		this.stayInDay = stayInDay;
	}
	


	
}
