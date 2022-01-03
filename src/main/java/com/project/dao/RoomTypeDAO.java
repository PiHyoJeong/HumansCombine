package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.dto.RoomTypeVO;

import util.DBManager;

public class RoomTypeDAO {

	private RoomTypeDAO() {}
	private static RoomTypeDAO instance = new RoomTypeDAO();
	public static RoomTypeDAO getInstance() {return instance;}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<RoomTypeVO> roomList(String seq) {
		
		ArrayList<RoomTypeVO> list = new ArrayList<>();
		String sql = "select * from roomtype where hotel_seq=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					
					RoomTypeVO vo = new RoomTypeVO();
					vo.setRoomTypeSeq(rs.getInt("roomtype_seq"));
					vo.setRoomType(rs.getString("room_type"));
					vo.setRoomSize(rs.getInt("room_size"));
					vo.setRoomPrice(rs.getInt("room_price"));
					vo.setRoomImage(rs.getString("room_image"));
					vo.setRoomResult(rs.getInt("room_result"));
					list.add(vo);
				}
				System.out.println("roomList 기능 구현");
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	} // roomList end
	
	public RoomTypeVO selectType(String roomTypeSeq) {
		
		StringBuffer selectTypeQuery = new StringBuffer();
		selectTypeQuery.append("select * from roomType ");
		selectTypeQuery.append("where roomType_seq =?");
		
		RoomTypeVO vo = new RoomTypeVO();
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(selectTypeQuery.toString());
			pstmt.setString(1, roomTypeSeq);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setRoomTypeSeq(rs.getInt("roomType_seq"));
				vo.setHotelSeq(rs.getInt("hotel_seq"));
				vo.setRoomImage(rs.getString("room_image"));
				vo.setRoomPrice(rs.getInt("room_price"));
				vo.setRoomResult(rs.getInt("room_result"));
				vo.setRoomSize(rs.getInt("room_size"));
				vo.setRoomType(rs.getString("room_type"));
			}

			System.out.println("selectType 기능 구현");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return vo;
	}//selectType end
	
	public void roomReservation (String roomtypeSeq) {
		
		StringBuffer updateQuery = new StringBuffer();
		updateQuery.append("update roomType set room_result=2 ");
		updateQuery.append("where roomtype_seq =?");

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(updateQuery.toString());
			pstmt.setString(1, roomtypeSeq);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}//roomReservation end
	
	public void cancelReservation (String roomtypeSeq) {
		
		StringBuffer updateQuery = new StringBuffer();
		updateQuery.append("update roomType set room_result=1 ");
		updateQuery.append("where roomtype_seq =?");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(updateQuery.toString());
			pstmt.setString(1, roomtypeSeq);
			pstmt.executeUpdate();
			
			System.out.println("calcelReservation 기능 처리");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
	}//cancelReservation end
	
}
