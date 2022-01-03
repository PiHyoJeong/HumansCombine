package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.dao.HotelDAO;
import com.project.dao.ImageDAO;
import com.project.dto.ImageVO;


public class HotelDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url ="ProjectServlet?command=index";
		ImageVO imageVO = new ImageVO();
		
		String uploadPath = request.getRealPath("upload");
		int size = 5*1024*1024;
		String encType = "UTF-8";
		
		MultipartRequest multi =new MultipartRequest(request,uploadPath,size,encType,new DefaultFileRenamePolicy());
		 System.out.println("HotelDeleteAction 실행");
		imageVO.setHotelSeq(Integer.parseInt(multi.getParameter("hotelSeq")));
		
		System.out.println("hotelSeq : " + imageVO.getHotelSeq());

		ImageDAO imageDAO = ImageDAO.getInstance();
		imageDAO.deleteImage(imageVO);
		 
		HotelDAO hotelDAO = HotelDAO.getInstance();
		hotelDAO.deleteHotel(imageVO);
				 
		request.getRequestDispatcher(url).forward(request, response);		 
	}

}
