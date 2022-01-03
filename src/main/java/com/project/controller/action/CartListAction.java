package com.project.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;
import com.project.dto.CartVO;
import com.project.dto.UserVO;


public class CartListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "mypage/cart.jsp";
		
		HttpSession session = request.getSession();
		
		UserVO loginUser = null;
		loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			System.out.println("loginUser is null:: ");
			url = "ProjectServlet?command=loginForm";
		} else {
			String userId = loginUser.getUserId()==null ? "" : loginUser.getUserId() ;	
			System.out.println("CartListAction loginUser:: " + userId);
			
			if("".equals(userId)) {
				url = "ProjectServlet?command=loginForm";
			}else {
				CartDAO cartDAO = CartDAO.getInstance();
				ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getUserId());
				
				System.out.println("cartList:: " + cartList.size());
				
				request.setAttribute("cartList", cartList);
			}
		}
		//UserVO loginUser = (UserVO)session.getAttribute("loginUser");	
		
		System.out.println("CartListAction process : ");
		request.getRequestDispatcher(url).forward(request, response);
	}
}
