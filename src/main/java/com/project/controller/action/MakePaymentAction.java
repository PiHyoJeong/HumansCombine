package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.HotelDAO;
import com.project.dao.RoomTypeDAO;
import com.project.dto.HotelVO;
import com.project.dto.RoomTypeVO;

public class MakePaymentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "./hotel/makePayment.jsp";
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String roomTypeSeq = request.getParameter("roomTypeSeq");
		String hotelName = request.getParameter("HotelName");
		String roomType = request.getParameter("RoomType");
		String lengthOfStay = request.getParameter("lengthOfStay");
		String reservationCheckInDate = request.getParameter("reservationCheckInDate");
    	String reservationCheckOutDate = request.getParameter("reservationCheckOutDate");
		String personNum = request.getParameter("personNum");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String hotelSeq = request.getParameter("hotelSeq");
		
		//유저
		System.out.println("userId : " + userId);
		System.out.println("userName : " + userName);
		//유저 이메일은 다른거 작성 가능
		System.out.println("userEmail : " + userEmail);
		//호텔
		System.out.println("hotelSeq : " + hotelSeq);
		System.out.println("hotelName : " + hotelName);
		//객실
		System.out.println("roomTypeSeq : " + roomTypeSeq);
		System.out.println("roomType : " + roomType);
		//에약
		System.out.println("lengthOfStay : " + lengthOfStay);
		System.out.println("personNum : " + personNum);
		System.out.println("totalPrice : " + totalPrice);
		
		HotelDAO hotelDAO = HotelDAO.getInstance();
		HotelVO hotelDetail = hotelDAO.hotelDetail(hotelSeq);
		
		RoomTypeDAO roomTypeDAO = RoomTypeDAO.getInstance();
		RoomTypeVO roomTypeVO = roomTypeDAO.selectType(roomTypeSeq);
		
		request.setAttribute("lengthOfStay", lengthOfStay);
		request.setAttribute("personNum", personNum);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("hotelDetail", hotelDetail);
		request.setAttribute("roomTypeVO", roomTypeVO);
		request.setAttribute("reservationCheckInDate", reservationCheckInDate);
		request.setAttribute("reservationCheckOutDate", reservationCheckOutDate);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
