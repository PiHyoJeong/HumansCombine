package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.dto.ImageVO;

import util.DBManager;

public class ImageDAO {
	private ImageDAO() {}
	private static ImageDAO instance = new ImageDAO();
	public static ImageDAO getInstance() {return instance;}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<ImageVO> hotelImage(String seq){
		ArrayList<ImageVO> image = new ArrayList<>();
		String sql = "select hotel_image from image where hotel_seq=? and (hotel_image like '%building%' or hotel_image like '%room%' or hotel_image like '%restaurant%')";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					ImageVO vo = new ImageVO();
					vo.setHotel_image(rs.getString(1));
					image.add(vo);
				}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return image;
	}
	
	public ImageVO hotelImageDetail(String seq){
		ImageVO image = null;
		String sql = "select hotel_image from image where hotel_seq=? and (hotel_image like '%detail%')";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					image = new ImageVO();
					image.setHotel_image(rs.getString(1));
				}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return image;
	}
	
	public void insertImage(ImageVO vo) {
		System.out.println("insertImage 실행");
		
		StringBuffer insertQuery = new StringBuffer();
		insertQuery.append("insert into image ");
		insertQuery.append("values (?,(select max(hotel_seq) from hotel))");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(insertQuery.toString());
			pstmt.setString(1, vo.getHotel_image());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	} //insertImage end
	
	public List<ImageVO> imageList(int seq) {
		
		ArrayList<ImageVO> list = new ArrayList<ImageVO>();
		String sql = "select hotel_image from image where hotel_seq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
				while(rs.next()) {
				ImageVO vo = new ImageVO();
				vo.setHotel_image(rs.getString("hotel_image"));
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}//imageList end
	
	public void deleteImage(ImageVO vo) {
		StringBuffer deleteQuery = new StringBuffer();
		deleteQuery.append("delete from image ");
		deleteQuery.append("where hotel_seq=?");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(deleteQuery.toString());
			pstmt.setInt(1, vo.getHotelSeq());
			pstmt.executeUpdate();
			
			System.out.println("image delete 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}//deleteImage end
	
}
