package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;
import com.project.dao.HotelDAO;
import com.project.dao.ImageDAO;
import com.project.dao.ReservationDAO;
import com.project.dao.RoomTypeDAO;
import com.project.dto.HotelVO;
import com.project.dto.ImageVO;
import com.project.dto.ReservationVO;
import com.project.dto.RoomTypeVO;
import com.project.dto.UserVO;

public class RoomSelectionAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String url = "hotel/roomSelection.jsp";

	    HttpSession session = request.getSession();
	    UserVO loginUser = (UserVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	      url = "ProjectServlet?command=loginForm";
	    } else {
	    	
	      //호텔 정보	
		  HotelDAO hotelDAO = HotelDAO.getInstance();
		  HotelVO hotelVO = null;
		  
		  String hotelSeq = request.getParameter("hotelSeq");
		  System.out.println("hotelSeq : " + request.getParameter("hotelSeq"));
		  			
			HotelVO hotelDetail = hotelDAO.hotelDetail(hotelSeq);
			
			int priceDouble=0;
			int priceLuxury=0;
			
		
			priceDouble =  (int) (Math.floor(hotelDetail.getHotelPrice()*1.5));
			priceLuxury =  (int) (Math.floor(hotelDetail.getHotelPrice()*2));	
			
			request.setAttribute("priceDouble", priceDouble);
			request.setAttribute("priceLuxury", priceLuxury);
			request.setAttribute("hotelDetail", hotelDetail);
			
			System.out.println("HotelReservationFormAction :"+hotelDetail.getHotelName());
			System.out.println("HotelReservationFormAction :"+hotelDetail.getHotelPrice());
		  
			//객실 정보
			RoomTypeDAO roomTypeDAO = RoomTypeDAO.getInstance();
			List<RoomTypeVO> roomTypeList = roomTypeDAO.roomList(hotelSeq);
			
			request.setAttribute("roomTypeList", roomTypeList);
			
			
	  		//찜삭제
	      
//	      String cartSeq = request.getParameter("cartSeq");
//		     
//	      	System.out.println("CartDeleteAction : " + cartSeq);
//		
//		  CartDAO cartDAO = CartDAO.getInstance();
//		  cartDAO.deleteCart(Integer.parseInt(cartSeq));	
	      
	    }	    
	    request.getRequestDispatcher(url).forward(request, response);
	    	   		
	}
		
		
		

}
