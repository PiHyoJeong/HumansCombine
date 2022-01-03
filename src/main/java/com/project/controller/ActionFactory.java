package com.project.controller;

import com.project.controller.action.Action;
import com.project.controller.action.CartDeleteAction;
import com.project.controller.action.CartInsertAction;
import com.project.controller.action.CartListAction;
import com.project.controller.action.ContractAction;
import com.project.controller.action.DonePaymentAction;
import com.project.controller.action.EmailSentAction;
import com.project.controller.action.FindIdAction;
import com.project.controller.action.FindIdFormAction;
import com.project.controller.action.FindPwdAction;
import com.project.controller.action.FindPwdFormAction;
import com.project.controller.action.HotelAllListAction;
import com.project.controller.action.HotelDeleteAction;
import com.project.controller.action.HotelDetailAction;
import com.project.controller.action.HotelListAction;
import com.project.controller.action.HotelRegisterAction;
import com.project.controller.action.HotelRegisterFormAction;
import com.project.controller.action.HotelReservationAction;
import com.project.controller.action.HotelReservationDeleteAction;
import com.project.controller.action.RoomSelectionAction;
import com.project.controller.action.HotelReservationListAction;
import com.project.controller.action.HotelUpdateAction;
import com.project.controller.action.HotelUpdateFormAction;
import com.project.controller.action.IdCheckFormAction;
import com.project.controller.action.IndexAction;
import com.project.controller.action.JoinAction;
import com.project.controller.action.JoinFormAction;
import com.project.controller.action.LoginAction;
import com.project.controller.action.LoginFormAction;
import com.project.controller.action.LogoutAction;
import com.project.controller.action.MakePaymentAction;
import com.project.controller.action.MapAction;
import com.project.controller.action.SpecialPriceHotelListPopUpAction;
import com.project.controller.action.UserPageAction;
import com.project.controller.action.UserPageUpdateAction;
import com.project.controller.action.UserUpdateFormAction;
import com.project.controller.action.goReservationForm;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {}	
	public static ActionFactory getInstance() { return instance;}
	
	public Action getAction(String command) {
		Action action = null;
	    System.out.println("ActionFactory : " + command);
	    
	    if(command.equals("index")) {
	    	action = new IndexAction();
	    }else if(command.equals("hotelList")) {
	    	action = new HotelListAction();
	    }else if(command.equals("hotelDetail")) {
	    	action = new HotelDetailAction();
	    }else if(command.equals("loginForm")) {
	    	action = new LoginFormAction();
	    }else if(command.equals("login")) {
	    	action = new LoginAction();
	    }else if(command.equals("joinForm")) {
	    	action = new JoinFormAction();
	    }else if(command.equals("join")) {
	    	action = new JoinAction();
	    }else if(command.equals("id_check_form")) {
	    	action = new IdCheckFormAction();
	    }else if(command.equals("mypage")) {
	    	action = new UserPageAction();
	    }else if(command.equals("cartList")) {
	    	action = new CartListAction();
	    }else if(command.equals("cartDelete")) {
	    	action = new CartDeleteAction();
	    }else if(command.equals("cartInsert")) {
	    	action = new CartInsertAction();
	    }else if(command.equals("hotelRegister")) {
	    	action = new HotelRegisterAction();
	    }else if(command.equals("logout")) {
	    	action = new LogoutAction();
	    }else if(command.equals("hotelRegisterForm")) {
	    	action = new HotelRegisterFormAction();
	    }else if(command.equals("contract")) {
	    	action = new ContractAction();
	    }else if(command.equals("userUpdateForm")) {
	    	action = new UserUpdateFormAction();
	    }else if(command.equals("userpageUpdate")) {
	    	action = new UserPageUpdateAction();
	    }else if(command.equals("hotelAllList")) {
	    	action = new HotelAllListAction();
	    }else if(command.equals("hotelReservation")) {// 추가
	          action = new HotelReservationAction();
	    }else if(command.equals("roomSelection")) {// 추가
	          action = new RoomSelectionAction();     
	    }else if(command.equals("rsvnList")) {
	    	  action = new HotelReservationListAction();
		}else if(command.equals("deleteRsvn")) {
			  action = new HotelReservationDeleteAction();
		}else if(command.equals("hotelUpdateForm")) {
	    	action = new HotelUpdateFormAction();
	    }else if(command.equals("hotelUpdate")) {
	    	action = new HotelUpdateAction();
	    }else if(command.equals("delete")) {
	    	action = new HotelDeleteAction();
	    }else if(command.equals("findIdForm")) {
	    	action = new FindIdFormAction();
	    }else if(command.equals("findId")) {
	    	action = new FindIdAction();
	    }else if(command.equals("findPwdForm")) {
	    	action = new FindPwdFormAction();
	    }else if(command.equals("findPwd")) {
	    	action = new FindPwdAction();
	    }else if(command.equals("emailSent")) {
	    	action = new EmailSentAction();
	    }else if(command.equals("specialPriceHotelListPopUp")) {
	    	action = new SpecialPriceHotelListPopUpAction();
	    }else if(command.equals("map")) {
	    	action = new MapAction();
	    }else if(command.equals("makePayment")) {
	    	action = new MakePaymentAction();
	    }else if(command.equals("goReservationForm")) {
	    	action = new goReservationForm();
	    }else if(command.equals("donePayment")) {
	    	action = new DonePaymentAction();
	    }
	    
	    return action;
	}
}
