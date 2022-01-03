package com.project.controller.action;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.HotelDAO;
import com.project.dao.RoomTypeDAO;
import com.project.dto.HotelVO;
import com.project.dto.RoomTypeVO;
import com.project.dto.UserVO;

public class goReservationForm implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/hotel/reservationInformation.jsp";
		
		String roomTypeSeqNum = request.getParameter("roomTypeSeqNum");
		String hotelSeq = request.getParameter("hotelSeq");
		String reservationCheckInDate = request.getParameter("reservationCheckInDate");
		String reservationCheckOutDate = request.getParameter("reservationCheckOutDate");
		String personNumber = request.getParameter("personNumber");
		
		System.out.println("reservationCheckInDate : " + reservationCheckInDate);
		System.out.println("reservationCheckOutDate : " + reservationCheckOutDate);
		
		Date beginDate = null;
        Date endDate = null;
	      
	      try {
	            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	            beginDate = new Date(format.parse(reservationCheckInDate).getTime());
	            endDate = new Date(format.parse(reservationCheckOutDate).getTime());
	        } catch(ParseException e) {
	            e.printStackTrace();
	        }
	     
	      long diff = endDate.getTime() - beginDate.getTime();
	      long diffDay = diff / (24 * 60 * 60 * 1000);
	      
	      System.out.println("일수 차이 : " +  diffDay);
	      
	      request.setAttribute("diffDay", diffDay);
		
		System.out.println("roomTypeSeqNum : " + roomTypeSeqNum);
		System.out.println("hotelSeq : " + hotelSeq);
		System.out.println("personNumber : " + personNumber);
		
		RoomTypeDAO roomTypeDAO = RoomTypeDAO.getInstance();
		RoomTypeVO room =  roomTypeDAO.selectType(roomTypeSeqNum);
		
		HotelDAO hotelDAO = HotelDAO.getInstance();
		HotelVO hotelVO = hotelDAO.hotelDetail(hotelSeq);
		
		HttpSession session = request.getSession();
		
		request.setAttribute("reservationCheckInDate", reservationCheckInDate);
		request.setAttribute("reservationCheckOutDate", reservationCheckOutDate);
		request.setAttribute("personNumber", personNumber);
		
		session.getAttribute("loginUser");
		UserVO userVO = (UserVO) session.getAttribute("loginUser");
		System.out.println(userVO.getUserId());
		request.setAttribute("room", room);
		request.setAttribute("hotelVO", hotelVO);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}
