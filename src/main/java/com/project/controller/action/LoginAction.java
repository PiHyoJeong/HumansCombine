package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UserDAO;
import com.project.dto.UserVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String url = "ProjectServlet?command=loginForm"; 

		if(id!=null) {
			UserDAO userDAO = UserDAO.getInstance();
			UserVO userVO = userDAO.getUser(id);
			if(userVO!=null) {
				session.removeAttribute("userId");
				 session.setAttribute("loginUser",userVO);
				 
				 System.out.println("please"+request.getParameter("code"));
				 url="ProjectServlet?command=index";
			}else {
				session.setAttribute("id",id); 
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				  session.setAttribute("email",email);
				  session.setAttribute("name",name);
				  session.setAttribute("id",id);
				 
				url="ProjectServlet?command=joinForm";
			}
		}else { 
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			    
			UserDAO userDAO=UserDAO.getInstance();
			UserVO userVO = userDAO.getUser(userId);
			
			Cookie[] cookie = request.getCookies();
			for(Cookie c : cookie) {
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				System.out.println("cookieName : " + cookieName);
				System.out.println("cookieValue : " + cookieValue);
	
				if(userVO != null) {
					if (userVO.getUserId().equals(cookieName) && userPwd.equals(cookieValue)) {
						session.removeAttribute("userId");
						session.setAttribute("loginUser",userVO);
						url="ProjectServlet?command=index";
					}
				}
			}
			
			if (userVO != null) {	
				 if(userVO.getUserPwd().equals(userPwd)) {
					 session.removeAttribute("userId");
					 session.setAttribute("loginUser",userVO);
					 url="ProjectServlet?command=index";
				 }
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
