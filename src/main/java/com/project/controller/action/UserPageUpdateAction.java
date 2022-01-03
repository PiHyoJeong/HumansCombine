package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UserDAO;
import com.project.dto.UserVO;

public class UserPageUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "ProjectServlet?command=loginForm";

		String name = request.getParameter("userName");
		String id = request.getParameter("userid");
		String password = request.getParameter("userPwd");
		String email = request.getParameter("userEmail");
		String phone = request.getParameter("userPhone");
		String userGrade = request.getParameter("userGrade");
		
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		System.out.println("userGrade : " + userGrade);
		
		UserVO userVO = new UserVO();
		userVO.setUserName(name);
		userVO.setUserId(id);
		userVO.setUserPwd(password);
		userVO.setUserEmail(email);
		userVO.setUserPhone(phone);

		UserDAO userDAO = UserDAO.getInstance();
		userDAO.updateUser(userVO);
		
		HttpSession session=request.getSession();
		session.invalidate();
		//여기 수정 했음
		response.sendRedirect(url);
		
	}

}
