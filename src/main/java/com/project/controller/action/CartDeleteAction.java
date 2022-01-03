package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "ProjectServlet?command=cartList";
		
		String cartSeq = request.getParameter("cartSeq");
	     
		System.out.println("CartDeleteAction : " + cartSeq);
	    CartDAO cartDAO = CartDAO.getInstance();
	    cartDAO.deleteCart(Integer.parseInt(cartSeq));
	      
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
