package com.project.controller.action;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UserDAO;


public class FindPwdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "ProjectServlet?command=emailSent";
		
		String userId = request.getParameter("userId"); 
		String userEmail = request.getParameter("userEmail");

		UserDAO userDAO = UserDAO.getInstance();
		String tmpPwd = userDAO.getRandomPwd(8);
		
		System.out.println("tmpPwd : " + tmpPwd);
		
		Cookie cookie = new Cookie(userId, tmpPwd);
		cookie.setMaxAge(60 * 5);
		response.addCookie(cookie);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<!DOCTYPE html>");
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<meta charset=\"UTF-8\">");
		sb.append("<title>임시 비밀번호</title>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("<div style='width:700px;height:150px;background-image:url(../upload/humanLogo.jpg) no-repeat scroll left top;'>\r\n"
				+ "</div>");
		sb.append("<h1 style='font:bold;'>鍮꾨�踰덊샇 �엫�떆肄붾뱶 諛쒖넚 �븞�궡�엯�땲�떎.</h1>");
		sb.append("<h4>" + userId + "�떂! �븞�뀞�븯�꽭�슂.</h4><br>");
		sb.append("<h4>�쑕硫섏뒪�샇�뀛�쓣 �씠�슜�빐 二쇱뀛�꽌 吏꾩떖�쑝濡� 媛먯궗�뱶由쎈땲�떎.</h4><br>");
		sb.append("<h4>�븘�옒 '�엫�떆 鍮꾨�踰덊샇'瑜� �궗�슜�빐�꽌 濡쒓렇�씤�쓣 �빐二쇱꽭�슂.</h4><br><br>");
		sb.append("<h2>");
		sb.append(tmpPwd);
		sb.append("</h2>");
		sb.append("<hr>");
		sb.append("<h3>�엫�떆 鍮꾨�踰덊샇�뒗 '5遺꾧컙' �쑀吏��맗�땲�떎.</h3>");
		sb.append("</body>");
		sb.append("</html>");
		
		
		Properties p = new Properties(); 
		p.put("mail.smtp.host","smtp.naver.com"); // 이메일 발송을 처리해줄 STMP 서버
		
		p.put("mail.smtp.port", 587); //메일 서버 포트번호
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true"); 
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try{
		    Authenticator auth = new SMTPAuthenticator(); //simple mail transfer protocol
		    Session ses = Session.getInstance(p, auth);
		    
		    ses.setDebug(true);
		    
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject("�쑕癒쇱뒪�샇�뀛"); // 제목
		    
		    Address fromAddr = new InternetAddress("shson4007@gmail.com");
		    msg.setFrom(fromAddr); // 발신자 이메일 주소 설정
		    
		    Address toAddr = new InternetAddress(userEmail);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 수신자 이메일 주소 설정
		    
		    msg.setContent(sb.toString(), "text/html;charset=UTF-8"); // 메일 내용 저장. 소스코드를 utf-8로 작성하여 charset을 utf-8 로 설정함
		    
		    Transport.send(msg); //메일 전송
		} catch(Exception e){
		    e.printStackTrace();
		    System.out.println("error");
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}
 
	
	

}
