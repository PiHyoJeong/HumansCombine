package com.project.controller.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.dao.HotelDAO;
import com.project.dao.ImageDAO;
import com.project.dto.HotelVO;
import com.project.dto.ImageVO;

public class HotelRegisterAction implements Action {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "ProjectServlet?command=index";

	    HotelVO hotelVO = new HotelVO();
	    ImageVO imageVO = new ImageVO();
		String uploadPath = request.getRealPath("upload");
		int size = 5*1024*1024;
		String encType = "UTF-8";

		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,encType,new DefaultFileRenamePolicy());
		    
		hotelVO.setHotelName(multi.getParameter("hotelName"));
		hotelVO.setHotelPhone(multi.getParameter("hotelPhone"));
		hotelVO.setHotelPrice(Integer.parseInt(multi.getParameter("hotelPrice")));
		hotelVO.setHotelRoomNum(multi.getParameter("hotelRoomNum"));
		hotelVO.setHotelDescription(multi.getParameter("hotelDescription"));
		hotelVO.setHotelLocation(multi.getParameter("hotelLocation"));
		hotelVO.setHotelRoomType(multi.getParameter("hotelRoomType"));
		hotelVO.setHotelRank(multi.getParameter("hotelRank"));
		hotelVO.setHotelDe1(multi.getParameter("hotelDe1"));
		hotelVO.setHotelDe2(multi.getParameter("hotelDe2"));
		hotelVO.setHotelDe3(multi.getParameter("hotelDe3"));
		
		HotelDAO dao = HotelDAO.getInstance();
		dao.hotelRegister(hotelVO);
	    
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String file = (String)files.nextElement();
			String file_name = multi.getFilesystemName(file);
			String uploadFile = multi.getOriginalFileName(file);
		
			imageVO.setHotel_image(uploadFile);
			ImageDAO imageDAO = ImageDAO.getInstance();
			
			imageDAO.insertImage(imageVO);
			
			
			
			
		}
		String hotelName = hotelVO.getHotelName();
	      String hotelPhone = hotelVO.getHotelPhone();
	      int hotelPrice = hotelVO.getHotelPrice();
	      String hotelRoomNum = hotelVO.getHotelRoomNum();
	      String hotelDescription = hotelVO.getHotelDescription();
	      String hotelLocation = hotelVO.getHotelLocation();
	      String hotelRoomType = hotelVO.getHotelRoomType();
	      String HotelRank = hotelVO.getHotelRank();
	      
	      
	      System.out.println("hotelName : " + hotelName);
	      System.out.println("hotelPhone : " + hotelPhone);
	      System.out.println("hotelPrice : " + hotelPrice);
	      System.out.println("hotelRoomNum : " + hotelRoomNum);
	      System.out.println("hotelDescription : " + hotelDescription);
	      System.out.println("hotelLocation : " + hotelLocation);
	      System.out.println("hotelRoomType : " + hotelRoomType);
	      System.out.println("HotelRank : " + HotelRank);
		request.getRequestDispatcher(url).forward(request, response);
	
		}
	

	 }
