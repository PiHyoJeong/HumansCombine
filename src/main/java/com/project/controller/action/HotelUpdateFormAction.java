package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.HotelDAO;
import com.project.dto.HotelVO;
import com.project.dto.UserVO;

public class HotelUpdateFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "hotel/hotelUpdateForm.jsp";
		
		String seq = request.getParameter("hotelSeq");
		
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
			
			if (loginUser == null) {
				url = "ProjectServlet?command=loginForm";
			} else {
		HotelDAO dao = HotelDAO.getInstance();
		HotelVO detail = dao.hotelDetail(seq);

		request.setAttribute("detail", detail);
		
		System.out.println("--"+detail.getHotelName());
		
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
