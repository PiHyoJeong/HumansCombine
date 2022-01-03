package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.HotelDAO;
import com.project.dao.ImageDAO;
import com.project.dto.HotelVO;
import com.project.dto.ImageVO;

public class HotelDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/hotel/hotelDetail.jsp";
		
		String seq = request.getParameter("seq");
		
		ImageDAO imageDAO = ImageDAO.getInstance();
		HotelDAO hotelDAO = HotelDAO.getInstance();
		
		HotelVO detail = hotelDAO.hotelDetail(seq);
		ImageVO imageDetail = imageDAO.hotelImageDetail(seq);
		List<ImageVO> image = imageDAO.hotelImage(seq);
		
		request.setAttribute("detail", detail);
		request.setAttribute("imageList", image);
		request.setAttribute("imageDetail", imageDetail);
		
		System.out.println("--"+detail.getHotelName());
		request.getRequestDispatcher(url).forward(request, response);

	}

}
