package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.project.dto.UserVO;

import util.DBManager;

public class UserDAO {
	
	private UserDAO() {}	
	private static UserDAO instance = new UserDAO();	
	public static UserDAO getInstance() {return instance;}

		
	//관리자 처리 어떻게..?
	  public int confirmID(String userId) {
		int result = -1;
	    String sql = "select * from users where user_id=?";
	       
	    Connection connn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	      connn = DBManager.getConnection();
	      pstmt = connn.prepareStatement(sql);
	      pstmt.setString(1, userId);
	      rs = pstmt.executeQuery();
	      
	      if (rs.next()) {	
	    	    result = 1; // 1을 리턴
			}else {	
				return -1;	
			}
	    } catch (Exception e) {e.printStackTrace();
	    } finally {DBManager.close(connn, pstmt, rs);
	    }
	    System.out.println("UserDAO confirmID :" + result);
	    
	    return result;
	  }	//confirmID end

	  
	  public UserVO getUser(String id) {       
	    UserVO userVO= null;
	    String sql = "select * from users where user_id=?";
	     
	    Connection connn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	      connn = DBManager.getConnection();
	      pstmt = connn.prepareStatement(sql);
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();
	      if(rs.next()){
	        userVO = new UserVO();
	        userVO.setUserId(rs.getString("USER_ID"));
	        userVO.setUserName(rs.getString("USER_NAME"));
	        userVO.setUserPwd(rs.getString("USER_PWD"));
	        userVO.setUserEmail(rs.getString("USER_EMAIL"));
	        userVO.setUserPhone(rs.getString("USER_PHONE"));
	        userVO.setUserGrade(Integer.parseInt(rs.getString("USER_GRADE")));
	        System.out.println("getUser 불러오기 성공");
	      } 
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(connn, pstmt, rs);
	    }
	    return userVO;
	  }

	  public int insertUser(UserVO userVO) {
	    int result = 0;
	    String sql = "insert into users( USER_ID, USER_NAME, USER_PWD, USER_EMAIL,";
	    sql += "USER_PHONE, USER_GRADE) values(?, ?, ?, ?, ?, ?)";

	    System.out.println("insertUser : " + "UserId");
	   
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, userVO.getUserId());
	      pstmt.setString(2, userVO.getUserName());
	      pstmt.setString(3, userVO.getUserPwd());
	      pstmt.setString(4, userVO.getUserEmail());
	      pstmt.setString(5, userVO.getUserPhone());
	      pstmt.setInt(6, userVO.getUserGrade());
	      result = pstmt.executeUpdate();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt);
	    }
	    return result;
	  }
	  
		/* *
		 * 관리자 모드에서 사용되는 메소드 * *
		 */
		public ArrayList<UserVO> listuser(String user_name) {
			ArrayList<UserVO> userList = new ArrayList<UserVO>();
			String sql = "select * from users where name like '%'||?||'%' " +
					"order by indate desc";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				if (user_name == "") {
					pstmt.setString(1, "%");
				} else {
					pstmt.setString(1, user_name);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					UserVO userVO = new UserVO();
					userVO.setUserId(rs.getString("USER_ID"));
			        userVO.setUserName(rs.getString("USER_NAME"));
			        userVO.setUserPwd(rs.getString("USER_PWD"));
			        userVO.setUserEmail(rs.getString("USER_EMAIL"));
			        userVO.setUserPhone(rs.getString("USER_PHONE"));
			        userVO.setUserGrade(Integer.parseInt(rs.getString("USER_GRADE")));
			        userList.add(userVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return userList;
		}	
		
		//updateUser 메소드 시작
		public void updateUser (UserVO vo) {
			
			String sql = "update users set USER_PWD=?, USER_EMAIL=?, USER_PHONE=? where USER_ID=?";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getUserPwd());
				pstmt.setString(2, vo.getUserEmail());
				pstmt.setString(3, vo.getUserPhone());
				pstmt.setString(4, vo.getUserId());
				pstmt.executeUpdate();
				System.out.println("user 업데이트 성공");
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}	//updateUser end
		
		public String findUserId(String name, String email, String phone) {
			
			String userId = null;
			
			StringBuffer findUserId = new StringBuffer();
			findUserId.append("select * from users ");
			findUserId.append("where user_name=? ");
			findUserId.append("and user_email=? ");
			findUserId.append("and user_phone=?");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(findUserId.toString());
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					userId = rs.getString("user_id");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			
			return userId;
			
		}//findUserId end
		
		public String getRandomPwd(int num) {
			
			char charSet[] = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
										'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
										'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
										'W', 'X', 'Y', 'Z',
										};
			int idx = 0;

			StringBuffer randomBuffer = new StringBuffer();
			
			for (int i = 0; i < num; i++) {
				idx = (int)(charSet.length * Math.random());
				System.out.println("idx = " + idx);
				randomBuffer.append(charSet[idx]);
				
			}
			return randomBuffer.toString();
			
		}//getRandomPwd end 
		
		
}
