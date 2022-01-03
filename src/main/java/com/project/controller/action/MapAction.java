package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.HotelDAO;
import com.project.dto.HotelVO;

public class MapAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/hotelMap.jsp";
		
		HotelDAO hotelDAO = HotelDAO.getInstance();
		List<HotelVO> hotelList = hotelDAO.hotelAllList();
		
		request.setAttribute("hotelList", hotelList);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
