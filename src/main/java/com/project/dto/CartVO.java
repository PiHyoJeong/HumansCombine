package com.project.dto;

import java.sql.Timestamp;
	import lombok.Data;
	import lombok.Getter;
	import lombok.Setter;

	
public class CartVO {

		public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
		private int cartSeq;
		private String userId; 
		private int hotelSeq;
		private String hotelName;
		private String checkInDate;
		private String checkOutDate;
		private int lengthOfStay;
		private int hotelPrice;
		private Timestamp indate;
		private String hotelImage;
		public int getCartSeq() {
			return cartSeq;
		}
		public void setCartSeq(int cartSeq) {
			this.cartSeq = cartSeq;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
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
		public String getCheckInDate() {
			return checkInDate;
		}
		public void setCheckInDate(String checkInDate) {
			this.checkInDate = checkInDate;
		}
		public String getCheckOutDate() {
			return checkOutDate;
		}
		public void setCheckOutDate(String checkOutDate) {
			this.checkOutDate = checkOutDate;
		}
		public int getLengthOfStay() {
			return lengthOfStay;
		}
		public void setLengthOfStay(int lengthOfStay) {
			this.lengthOfStay = lengthOfStay;
		}
		public int getHotelPrice() {
			return hotelPrice;
		}
		public void setHotelPrice(int hotelPrice) {
			this.hotelPrice = hotelPrice;
		}
		public Timestamp getIndate() {
			return indate;
		}
		public void setIndate(Timestamp indate) {
			this.indate = indate;
		}
		public String getHotelImage() {
			return hotelImage;
		}
		public void setHotelImage(String hotelImage) {
			this.hotelImage = hotelImage;
		}
		public CartVO(int cartSeq, String userId, int hotelSeq, String hotelName, String checkInDate,
				String checkOutDate, int lengthOfStay, int hotelPrice, Timestamp indate, String hotelImage) {
			super();
			this.cartSeq = cartSeq;
			this.userId = userId;
			this.hotelSeq = hotelSeq;
			this.hotelName = hotelName;
			this.checkInDate = checkInDate;
			this.checkOutDate = checkOutDate;
			this.lengthOfStay = lengthOfStay;
			this.hotelPrice = hotelPrice;
			this.indate = indate;
			this.hotelImage = hotelImage;
		}
		
	}

