package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.project.dto.CartVO;
import util.DBManager;
public class CartDAO {

  private CartDAO() {
  }

  private static CartDAO instance = new CartDAO();

  public static CartDAO getInstance() {
    return instance;
  }

  public void insertCart(CartVO cartVO) {
    String sql = "insert into cart( cart_seq, USER_ID, hotel_seq, hotel_price,"
    		+ "hotel_name, cart_checkin_date, cart_checkout_date,"
    		+ "lengthofstay) values (cart_seq.nextval, ?,?,?,?,?,?,?)";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      
      System.out.println("CartDAO insertCart : " + cartVO.getHotelName());
      
      pstmt.setString(1, cartVO.getUserId());
      pstmt.setInt(2, cartVO.getHotelSeq());
      pstmt.setInt(3, 2);
      pstmt.setString(4, cartVO.getHotelName());
      pstmt.setString(5, "5");
      pstmt.setString(6, "6");
      pstmt.setInt(7, 1);
      
      pstmt.executeUpdate();
      
    } catch (Exception e) {e.printStackTrace();
    } finally {DBManager.close(conn, pstmt);
    }
  }

  public ArrayList<CartVO> listCart(String userId) {
    ArrayList<CartVO> cartList = new ArrayList<CartVO>();    
    String sql = "select a.cart_seq, a.user_id, a.hotel_name, a.hotel_seq, b.hotel_image"
    		+ " from cart a, image b where a.hotel_seq = b.hotel_seq"
    		+ " and a.user_id = ? "
    		+ " and b.hotel_image like '%building%'";
    	
    System.out.println("CartDAO  listCart process : " );
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        CartVO cartVO = new CartVO();
        
        cartVO.setCartSeq(rs.getInt(1));
        cartVO.setUserId(rs.getString(2));
        cartVO.setHotelName(rs.getString(3));
        cartVO.setHotelSeq(rs.getInt(4));
        cartVO.setHotelImage(rs.getString(5));
        
        cartList.add(cartVO);
      }
    } catch (Exception e) {e.printStackTrace();
    }finally {DBManager.close(conn, pstmt, rs);
    }
    return cartList;
  }

  public void deleteCart(int cartSeq) {
  
	  String sql = "delete cart where cart_seq=?";
    
	  System.out.println("CartDAO  delete   Cart process : " );
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, cartSeq);
      pstmt.executeUpdate();
    } catch (Exception e) {e.printStackTrace();
    } finally {DBManager.close(conn, pstmt);
    }
  }
}
	
