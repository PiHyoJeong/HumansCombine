package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UserDAO;


public class IdCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "./user/idcheck.jsp";
		
		String userId = request.getParameter("userId");
		System.out.println("idCheckformAction : " + userId); 
		
		
		UserDAO userDAO = UserDAO.getInstance();
		int message = userDAO.confirmID(userId);
		
		System.out.println("idCheckformAction message : " + message);
		
		request.setAttribute("message", message);
		request.setAttribute("userId", userId);
		
		System.out.println("idCheckformAction message : " + message);

		request.getRequestDispatcher("./user/idcheck.jsp").forward(request, response);
		
		//response.sendRedirect("./user/idcheck.jsp");
		
		//System.out.println(url);
		
		//System.out.println("idCheckformAction message : " + message);
		
	}

}
