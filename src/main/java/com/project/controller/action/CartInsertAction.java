package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;
import com.project.dto.CartVO;
import com.project.dto.UserVO;


public class CartInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "ProjectServlet?command=cartList";

		 HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		  if (loginUser == null) {
			  url = "ProjectServlet?command=loginForm";
		  } else {
	      CartVO cartVO = new CartVO();
	      
	      System.out.println(" CartInsertAction hotelName : ");
	      System.out.println(" CartInsertAction loginUser : "+loginUser.getUserId());
	      System.out.println(" CartInsertAction hotelSeq : "+request.getParameter("hotelSeq"));
	      
	      cartVO.setUserId(loginUser.getUserId());
	     
	      cartVO.setHotelName(request.getParameter("hotelName"));
	      cartVO.setHotelSeq(Integer.parseInt(request.getParameter("hotelSeq")));
	      // cartVO.setHotelPrice(Integer.parseInt(request.getParameter("hotelPrice")));
	      CartDAO cartDAO = CartDAO.getInstance();
	      cartDAO.insertCart(cartVO);
	  
	    }
	    
	    System.out.println("CartInsertAction :" + url);
	    
	   
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
