package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HotelSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//없어도 될 것 같다. 호텔 검색 버튼을 눌렀을 때 사용할 action 은 hotelListAction 이니까?
	}

}
