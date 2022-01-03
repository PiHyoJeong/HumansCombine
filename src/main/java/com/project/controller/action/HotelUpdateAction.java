package com.project.controller.action;

import java.io.IOException;
import java.util.Enumeration;

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

public class HotelUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url ="ProjectServlet?command=index";
		
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
		hotelVO.setHotelSeq(Integer.parseInt(multi.getParameter("hotelSeq")));  
		hotelVO.setHotelDe1(multi.getParameter("hotelDe1"));
		hotelVO.setHotelDe2(multi.getParameter("hotelDe2"));
		hotelVO.setHotelDe3(multi.getParameter("hotelDe3"));
		
		String hotelName = hotelVO.getHotelName();
		String hotelPhone = hotelVO.getHotelPhone();
		int hotelPrice = hotelVO.getHotelPrice();
		String hotelRoomNum = hotelVO.getHotelRoomNum();
		String hotelDescription =hotelVO.getHotelDescription();
		String hotelLocation = hotelVO.getHotelLocation();
		String hotelRoomType = hotelVO.getHotelRoomType();
		String hotelRank = hotelVO.getHotelRank();
		int hotelSeq = hotelVO.getHotelSeq();
		String de1 = hotelVO.getHotelDe1();
		String de2 = hotelVO.getHotelDe2();
		String de3 = hotelVO.getHotelDe3();
		
		System.out.println("hotelName :" + hotelName);
		System.out.println("hotelPrice : " + hotelPrice);
		System.out.println("hotelLocation : " + hotelLocation);
		System.out.println("hotelRoomType : " + hotelRoomType);
		System.out.println("hotelRoomNum : " + hotelRoomNum);
		System.out.println("hotelPhone : " + hotelPhone);
		System.out.println("hotelRank : " + hotelRank);
		System.out.println("hotelDescription : " + hotelDescription);
		System.out.println("hotelSeq : " + hotelSeq);
		System.out.println("de1 : " + de1);
		System.out.println("de2 : " + de2);
		System.out.println("de3 : " + de3);
		
		HotelDAO dao = HotelDAO.getInstance();
		dao.hotelUpdate(hotelVO);
		
		ImageDAO imageDAO = ImageDAO.getInstance();
		imageVO.setHotelSeq(hotelSeq);
		imageDAO.deleteImage(imageVO);
		
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String file = (String)files.nextElement();
			String file_name = multi.getFilesystemName(file);
			String uploadFile = multi.getOriginalFileName(file);
			System.out.println("파일 이름 : ");
			System.out.println("uploadFile : " + uploadFile);
			
			ImageDAO imgDAO = ImageDAO.getInstance();
			imageVO.setHotel_image(uploadFile);
			imgDAO.insertImage(imageVO);
		
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
