package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.ReservationDAO;
import com.project.dao.RoomTypeDAO;

public class HotelReservationDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "ProjectServlet?command=rsvnList";
		
		String rsvnSeq = request.getParameter("rsvnSeq");
		String roomTypeSeq = request.getParameter("roomTypeSeq");
		
		System.out.println("roomTypeSeq : " + roomTypeSeq);
		System.out.println("ReservationDeleteAction seqnum: " + rsvnSeq);
	    ReservationDAO rsvnDAO = ReservationDAO.getInstance();
	    rsvnDAO.deleteRsvn(Integer.parseInt(rsvnSeq));
	    
	    RoomTypeDAO roomTypeDAO = RoomTypeDAO.getInstance();
	    roomTypeDAO.cancelReservation(roomTypeSeq);
	    
	    request.getRequestDispatcher(url).forward(request, response);

	}

}
