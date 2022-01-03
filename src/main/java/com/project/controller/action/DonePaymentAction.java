package com.project.controller.action;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.CartDAO;
import com.project.dao.ReservationDAO;
import com.project.dao.RoomTypeDAO;
import com.project.dto.CartVO;
import com.project.dto.HotelVO;
import com.project.dto.ReservationVO;
import com.project.dto.UserVO;

public class DonePaymentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "ProjectServlet?command=index";
		
		HttpSession session = request.getSession();
	    UserVO loginUser = (UserVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	      url = "ProjectServlet?command=loginForm";
	    } else {
	    	
	    	ReservationVO rsvnVO = new ReservationVO();
	    	
	    	String userEmail = request.getParameter("userEmail");
	    	String hotelSeq = request.getParameter("hotelSeq");
	    	String hotelName = request.getParameter("hotelName");
	    	String hotelPrice = request.getParameter("hotelPrice");
	    	String userId = request.getParameter("userId");
	    	String personNumber = request.getParameter("personNumber");
	    	String reservationCheckInDate = request.getParameter("reservationCheckInDate");
	    	String reservationCheckOutDate = request.getParameter("reservationCheckOutDate");
	    	String totalPrice = request.getParameter("totalPrice");
	    	String roomTypeSeq = request.getParameter("roomTypeSeq");
	    	
	    	System.out.println("userEmail : " + userEmail);
	    	System.out.println("hotelSeq : " + hotelSeq);
	    	System.out.println("hotelName : " + hotelName);
	    	System.out.println("hotelPrice : " + hotelPrice);
	    	System.out.println("userId : " + userId);
	    	System.out.println("personNumber : " + personNumber);
	    	System.out.println("reservationCheckInDate : " + reservationCheckInDate);
	    	System.out.println("reservationCheckOutDate : " + reservationCheckOutDate);
	    	System.out.println("totalPrice : " + totalPrice);
	    	System.out.println("roomTypeSeq : " + roomTypeSeq);

	    	RoomTypeDAO roomTypeDAO = RoomTypeDAO.getInstance();
	    	roomTypeDAO.roomReservation(roomTypeSeq);
	    	
	    	request.setAttribute("roomTypeSeq", roomTypeSeq);
	    	
	    	Date checkInDate = null;
	    	Date checkOutDate = null;
	    	
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				checkInDate = new Date(format.parse(reservationCheckInDate).getTime());
				checkOutDate = new Date(format.parse(reservationCheckOutDate).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
	    	
	    	rsvnVO.setHotelSeq(Integer.parseInt(hotelSeq));
	    	rsvnVO.setHotelName(hotelName);
	    	rsvnVO.setUserId(userId);
	    	rsvnVO.setRoomTypeSeq(Integer.parseInt(roomTypeSeq));
	    	rsvnVO.setPersonNumber(Integer.parseInt(personNumber));
	    	rsvnVO.setReservationCheckInDate(checkInDate);
	    	rsvnVO.setReservationCheckOutDate(checkOutDate);
	    	rsvnVO.setHotelPrice(Integer.parseInt(hotelPrice));
	    	rsvnVO.setTotalPrice(Integer.parseInt(totalPrice));
	    	
	    	ReservationDAO reservationDAO = ReservationDAO.getInstance();
	    	reservationDAO.insertReservation(rsvnVO);
	    	
	    	StringBuffer sb = new StringBuffer();
			sb.append("<!DOCTYPE html>");
			sb.append("<html>");
			sb.append("<head>");
			sb.append("<meta charset=\"UTF-8\">");
			sb.append("<title>고객센터</title>");
			sb.append("</head>");
			sb.append("<body>");
			sb.append("<h1 style='font:bold;'>예약 정보안내.</h1>");
			sb.append("<h4>" + userId + "님! 안녕하세요.</h4><br>");
			sb.append("<h4>휴멘스호텔을 이용해 주셔서 진심으로 감사드립니다.</h4><br>");
			sb.append("<h4>예약 정보를 확인하세요.</h4><br><br>");
			sb.append("<hr>");
			sb.append("<table style='background-color:rgb(204,255,255)'>");
			sb.append("<tr>");
			sb.append("<td> 호텔명 : " + hotelName + "</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td> 결제금액 : " + totalPrice + "</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td> 인원 : " + personNumber + "</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td> 체크인 : " + checkInDate + "</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td> 체크아웃 : " + checkOutDate + "</td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</body>");
			sb.append("</html>");
			
			Properties p = new Properties(); // 정보를 담을 객체
			p.put("mail.smtp.host","gmail-smtp.l.google.com"); // 네이버 SMTP
			
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들
			
			//사용자가 관리자에게 문의를 하는 구조 - 결국 나에게 내가 이메일을 보낸다
			try{
			    Authenticator auth = new SMTPAuthenticator();
			    Session ses = Session.getInstance(p, auth);
			    
			    ses.setDebug(true);
			    
			    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			    msg.setSubject("휴먼스호텔"); // 제목
			    
			    Address fromAddr = new InternetAddress("jamesseo4707@gmail.com");
			    msg.setFrom(fromAddr); // 보내는 사람
			    
			    Address toAddr = new InternetAddress(userEmail);
			    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			    
			    msg.setContent(sb.toString(), "text/html;charset=UTF-8"); // 내용과 인코딩
			    
			    Transport.send(msg); 
			} catch(Exception e){
			    e.printStackTrace();
			    System.out.println("error");
			}
	    	request.getRequestDispatcher(url).forward(request, response);
	    }
	}

}
