package com.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.project.dto.ReservationVO;

import util.DBManager;
	
public class ReservationDAO {
	private ReservationDAO() {}	
	private static ReservationDAO instance = new ReservationDAO();	
	public static ReservationDAO getInstance() {return instance;}
	
	public void insertReservation(ReservationVO rsvnVO) {
	    String sql = "insert into reservation(reservation_seq, hotel_seq, hotel_name,"
	    	+ " user_id, person_number, reservation_checkin_date, "
    		+ "reservation_checkout_date, hotel_price, total_price, roomType_Seq)" 
	    	+ "values(reservation_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      
	     // SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		     // Date reservationCheckInDate = null;
		     // Date reservationCheckOutDate = null;
		     // reservationCheckInDate=format.parse(sDate);
	      
	      pstmt.setInt(1, rsvnVO.getHotelSeq()); 
	      pstmt.setString(2, rsvnVO.getHotelName()); //hotel_name
	      pstmt.setString(3, rsvnVO.getUserId()); //user_id
	      pstmt.setInt(4, rsvnVO.getPersonNumber()); //person Number
	      pstmt.setDate(5, (Date) rsvnVO.getReservationCheckInDate()); 
	      pstmt.setDate(6, (Date) rsvnVO.getReservationCheckOutDate()); 
	      pstmt.setInt(7, rsvnVO.getHotelPrice()); 
	      pstmt.setInt(8, rsvnVO.getTotalPrice()); 
	      pstmt.setInt(9, rsvnVO.getRoomTypeSeq());
	      pstmt.executeUpdate();
	     
	      System.out.println("reservationInsert 기능 처리");
	    } catch (Exception e) {e.printStackTrace();
	    } finally {DBManager.close(conn, pstmt);
	    }
	}
	
	
	public ArrayList<ReservationVO> ReservationList(String id) {//호텔이름 ,예약날짜, 인원 필요 
		
		   ArrayList<ReservationVO> rsvnList = new ArrayList<ReservationVO>();    
		    String sql = "select a.reservation_seq, a.hotel_seq, a.hotel_name, a.user_id,"
		    		+ " a.person_number, a.roomtype_seq, "
		    		+ " a.reservation_checkin_date, "
		    		+ " a.reservation_checkout_date, "
		    		+ " a.hotel_price, b.hotel_image,"
		    		+ " a.reservation_checkout_date - a.reservation_checkin_date as stayinday, "
		    		+ " a.total_price "
		    		+ " from reservation a, image b where a.hotel_seq = b.hotel_seq"
		    		+ " and a.user_id = ? "
		    		+ " and b.hotel_image like '%building%'";
		    	//a.reservation_checkin_date,
		    System.out.println("ReservationDAO  RSVNLIST process : " );
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    
		    try {
		      conn = DBManager.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, id);
		      rs = pstmt.executeQuery();
		      while (rs.next()) {
		    	 ReservationVO rsvnVO = new ReservationVO();
		        
		    	 rsvnVO.setReservationSeq(rs.getInt(1));
		    	 rsvnVO.setHotelSeq(rs.getInt(2));
		    	 rsvnVO.setHotelName(rs.getString(3));
		    	 rsvnVO.setUserId(rs.getString(4));
		    	 rsvnVO.setPersonNumber(rs.getInt(5));
		    	 rsvnVO.setRoomTypeSeq(rs.getInt(6));
		    	 rsvnVO.setReservationCheckInDate(rs.getDate(7));
		    	 rsvnVO.setReservationCheckOutDate(rs.getDate(8));
		    	 rsvnVO.setHotelPrice(rs.getInt(9));
		    	 rsvnVO.setHotelImage(rs.getString(10));
		    	 rsvnVO.setStayInDay(Integer.parseInt(rs.getString(11)));
		    	 rsvnVO.setTotalPrice(rs.getInt(12));
		        
		         rsvnList.add(rsvnVO);
		      }
		      System.out.println("ReservationList 기능 처리");

		    } catch (Exception e) {e.printStackTrace();
		    
		    }finally {DBManager.close(conn, pstmt, rs);

		    }
		    return rsvnList;
		  }
	
	 public void deleteRsvn(int rsvnSeq) {
		  
		  String sql = "delete reservation where reservation_seq=?";
	    
		  System.out.println("ReservationDAO delete rsvn seqNum : " + rsvnSeq);
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, rsvnSeq);
	      pstmt.executeUpdate();
	    } catch (Exception e) {e.printStackTrace();
	    } finally {DBManager.close(conn, pstmt);
	    }
	  }
	}

