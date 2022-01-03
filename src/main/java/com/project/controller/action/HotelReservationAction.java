package com.project.controller.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.ReservationDAO;
import com.project.dto.ReservationVO;
import com.project.dto.UserVO;

public class HotelReservationAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "ProjectServlet?command=rsvnList";

	    HttpSession session = request.getSession();
	    UserVO loginUser = (UserVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	      url = "ProjectServlet?command=loginForm";
	    } else {
	    	
	      //호텔 정보	
		  
		  String hotelId = request.getParameter("hotelId");
		  String hotelSeq = request.getParameter("hotelSeq");
		  String hotelName = request.getParameter("hotelName");
		  String hotelPrice = request.getParameter("hotelPrice");
		  String totalPrice = request.getParameter("totalPrice");
		  String personNumber = request.getParameter("personNumber");
		  String reservationCheckInDate = request.getParameter("reservationCheckInDate");
		  String reservationCheckOutDate = request.getParameter("reservationCheckOutDate");
		  
		  System.out.println("loginUser : " + loginUser.getUserId());
	      System.out.println("hotelSeq : " + request.getParameter("hotelSeq"));  
	      
	      System.out.println(reservationCheckInDate);	// 2021-09-14
	      
	      Date date1 = null;
          Date date2 = null;
	      
	      try {
	            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	            date1 = new Date(format.parse(reservationCheckInDate).getTime());
	            date2 = new Date(format.parse(reservationCheckOutDate).getTime());
	        } catch(ParseException e) {
	            e.printStackTrace();
	        }
	     
	      long diff = date1.getTime() - date2.getTime();
	      System.out.println("일수 차이 구하기 : " +  diff);
	      
         // Date date1 = format.parse(reservationCheckInDate);
         // Date date2 = format.parse(reservationCheckOutDate);
	     // Date reservationCheckInDate = null;
	     // Date reservationCheckOutDate = null;
	     // reservationCheckInDate=format.parse(sDate);
	      
	      ReservationVO reserVO = new ReservationVO();
	      
	      reserVO.setUserId(loginUser.getUserId());
	      reserVO.setHotelSeq(Integer.parseInt(request.getParameter("hotelSeq")));
	      reserVO.setHotelName(request.getParameter("hotelName"));
	      reserVO.setPersonNumber(Integer.parseInt(request.getParameter("personNumber")));
	      reserVO.setReservationCheckInDate(date1);
	      reserVO.setReservationCheckOutDate(date2);
	      reserVO.setHotelPrice(Integer.parseInt(request.getParameter("hotelPrice")));
	      reserVO.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
	      
	      ReservationDAO reserDAO = ReservationDAO.getInstance();
	      reserDAO.insertReservation(reserVO);	  
	      
	  		//찜삭제
	      
//	      String cartSeq = request.getParameter("cartSeq");
//		     
//	      	System.out.println("CartDeleteAction : " + cartSeq);
//		
//		  CartDAO cartDAO = CartDAO.getInstance();
//		  cartDAO.deleteCart(Integer.parseInt(cartSeq));	
//	      
	    }	    
	    System.out.println("HotelReservationAction :" + url);
	    	   		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
