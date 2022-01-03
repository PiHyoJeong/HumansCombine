package com.project.controller.action;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;
import com.project.dao.ReservationDAO;
import com.project.dao.RoomTypeDAO;
import com.project.dto.CartVO;
import com.project.dto.ReservationVO;
import com.project.dto.UserVO;


public class HotelReservationListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "mypage/reservationList.jsp";
		
		HttpSession session = request.getSession();
		
		UserVO loginUser = null;
		loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			url = "ProjectServlet?command=loginForm";
		}else {
			String userId = loginUser.getUserId()==null ? "" : loginUser.getUserId() ;	
			System.out.println("CartListAction loginUser:: " + userId);
			
			if("".equals(userId)) {
				url = "ProjectServlet?command=loginForm";
			}else {
			ReservationDAO rsvnDAO = ReservationDAO.getInstance();
			ArrayList<ReservationVO> rsvnList = rsvnDAO.ReservationList(loginUser.getUserId());
			
			System.out.println("rsvnList:: " + rsvnList.size());
			
			request.setAttribute("rsvnList", rsvnList);
		
		}
	}
		
		System.out.println("ReservationListAction process : ");
		request.getRequestDispatcher(url).forward(request, response);
	}
}