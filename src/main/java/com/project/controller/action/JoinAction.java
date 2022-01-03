package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UserDAO;
import com.project.dto.UserVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String url = "ProjectServlet?command=loginForm";

		HttpSession session = request.getSession();
		    
		UserVO userVO = new UserVO();
		    
		userVO.setUserId(request.getParameter("userId"));
		userVO.setUserName(request.getParameter("userName"));
		userVO.setUserPwd(request.getParameter("userPwd"));
		userVO.setUserEmail(request.getParameter("userEmail"));
		userVO.setUserPhone(request.getParameter("userPhone"));
		userVO.setUserGrade(Integer.parseInt(request.getParameter("userGrade")));
		   
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.insertUser(userVO);
		
		System.out.println("JoinAction" + userVO);
		session.invalidate();
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
