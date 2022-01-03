package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.dto.HotelVO;
import com.project.dto.ImageVO;

import util.DBManager;

public class HotelDAO {
	private HotelDAO() {}	
	private static HotelDAO instance = new HotelDAO();	
	public static HotelDAO getInstance() {return instance;}
	
	
	
	public ArrayList<HotelVO> hotelList(String location){
		String sql = "select * from search_view where hotel_location like '%'||?||'%' and hotel_seq = hotel_seq and hotel_image like '%building%'";
		ArrayList<HotelVO> hotelList = new ArrayList<HotelVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,location);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				HotelVO vo = new HotelVO();
				
				vo.setHotelSeq(rs.getInt("hotel_seq"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelRank(rs.getString("hotel_rank"));
				vo.setHotelDescription(rs.getString("hotel_description"));
				vo.setHotelRoomType(rs.getString("hotel_roomtype"));
				vo.setHotelLocation(rs.getString("hotel_location"));
				vo.setHotelImage(rs.getString("hotel_image"));
				vo.setHotelDe1(rs.getString("hotel_de1"));
				vo.setHotelDe2(rs.getString("hotel_de2"));
				vo.setHotelDe3(rs.getString("hotel_de3"));
				 
				hotelList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	public ArrayList<HotelVO> hotelAllList(){
		String sql = "select hotel_seq,hotel_name,hotel_image,hotel_de1,hotel_de2,hotel_de3 from search_view where hotel_image like '%building%' group by hotel_seq,hotel_name,hotel_image,hotel_de1,hotel_de2,hotel_de3";
		/*
		 * String sql = "select * from search_view where hotel_image like '%building%'";
		 */
		ArrayList<HotelVO> hotelList = new ArrayList<HotelVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				HotelVO vo = new HotelVO();
				vo.setHotelSeq(rs.getInt("hotel_seq"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelImage(rs.getString("hotel_image"));
				vo.setHotelDe1(rs.getString("hotel_de1"));
				vo.setHotelDe2(rs.getString("hotel_de2"));
				vo.setHotelDe3(rs.getString("hotel_de3"));
				 
				hotelList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	
	
	public void hotelRegister(HotelVO vo) {
		System.out.println("register ");
		String sql = "insert into hotel values(hotel_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getHotelName());
			pstmt.setInt(2, vo.getHotelPrice());
			pstmt.setString(3, vo.getHotelRank());
			pstmt.setString(4, vo.getHotelDescription());
			pstmt.setString(5, vo.getHotelRoomType());
			pstmt.setString(6, vo.getHotelLocation());
			pstmt.setString(7, vo.getHotelRoomNum());
			pstmt.setString(8, vo.getHotelPhone());
			pstmt.setString(9, vo.getHotelDe1());
			pstmt.setString(10, vo.getHotelDe2());
			pstmt.setString(11, vo.getHotelDe3());
			
			 
			pstmt.executeQuery();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public HotelVO hotelDetail(String hotelSeq) {
		HotelVO vo = null;
		String sql = "select * from hotel where hotel_seq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelSeq );
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new HotelVO();
				vo.setHotelSeq(rs.getInt("hotel_seq"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelPrice(rs.getInt("hotel_price"));
				vo.setHotelRank(rs.getString("hotel_rank"));
				vo.setHotelDescription(rs.getString("hotel_description"));
				vo.setHotelRoomType(rs.getString("hotel_roomtype"));
				vo.setHotelLocation(rs.getString("hotel_location"));
				vo.setHotelRoomNum(rs.getString("hotel_room_number"));
				vo.setHotelPhone(rs.getString("hotel_phone"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}
	

	public List<HotelVO> hotelImage(String seq) {
		ArrayList<HotelVO> hotelList = new ArrayList<HotelVO>();
		String sql = "select hotel_image from image_view where hotel_seq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
				while(rs.next()) {
				HotelVO vo = new HotelVO();
				vo.setHotelImage(rs.getString("hotel_image"));
				hotelList.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	public void hotelUpdate (HotelVO vo) {
		
		String sql = "update hotel set hotel_name=?, hotel_price=?, hotel_rank=?, hotel_description=?, "
				+ "hotel_roomtype=?, hotel_location=?, hotel_room_number=?, hotel_phone=?, "
				+ "hotel_de1=?, hotel_de2=?, hotel_de3=? where hotel_seq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHotelName());
			pstmt.setInt(2, vo.getHotelPrice());
			pstmt.setString(3, vo.getHotelRank());
			pstmt.setString(4, vo.getHotelDescription());
			pstmt.setString(5, vo.getHotelRoomType());
			pstmt.setString(6, vo.getHotelLocation());
			pstmt.setString(7, vo.getHotelRoomNum());
			pstmt.setString(8, vo.getHotelPhone());
			pstmt.setString(9, vo.getHotelDe1());
			pstmt.setString(10, vo.getHotelDe2());
			pstmt.setString(11, vo.getHotelDe3());
			pstmt.setInt(12, vo.getHotelSeq());
			
			pstmt.executeUpdate();
			
			System.out.println("호텔 업데이트 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
	}//hotelUpdate end

	public void deleteHotel(ImageVO vo) {
		StringBuffer deleteQuery = new StringBuffer();
		deleteQuery.append("delete from hotel ");
		deleteQuery.append("where hotel_seq=?");
			
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(deleteQuery.toString());
			pstmt.setInt(1, vo.getHotelSeq());
			pstmt.executeUpdate();
				
			System.out.println("hotel delete 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}//deleteImage end
	
	
		
}