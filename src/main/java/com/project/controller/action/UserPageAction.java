package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "ProjectServlet?command=loginForm";
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect(url);
		}else {
			url = "/mypage/mypage.jsp"; 
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

}
