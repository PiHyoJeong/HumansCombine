package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.HotelDAO;
import com.project.dto.HotelVO;

public class HotelAllListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/hotel/hotelList.jsp";
		HotelDAO dao = HotelDAO.getInstance();
		System.out.println(request.getParameter("location"));
		List<HotelVO> list = dao.hotelAllList();
		request.setAttribute("list", list);
		
		
		System.out.println(request.getAttribute("hotel_name"));
		System.out.println(list.size());
		request.getRequestDispatcher(url).forward(request, response);


	}

}
