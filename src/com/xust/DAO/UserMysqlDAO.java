package com.xust.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.xust.DBPool.JDBCUtil;
import com.xust.DBPool.MyDataSource;
import com.xust.bean.PublishHealthyRoom;
import com.xust.bean.ReplyTheme;
import com.xust.bean.Theme;
import com.xust.bean.UserDetailInfo;

public class UserMysqlDAO implements UserDAO {

	@Override
	public boolean checkUserForAJAX(String username) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select username from user";
		
		try {
			conn = new MyDataSource().getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = JDBCUtil.executeQuery(stmt, sql);
			
			while(rs.next()) {
				if(username.equals(rs.getString(1)))
					flag = true;
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			flag = false;
		} finally {
			if(conn != null) {
				JDBCUtil.closedConn(conn);
			}
			if(rs != null) {
				JDBCUtil.closedRs(rs);
			}
			if(stmt != null) {
				JDBCUtil.closedStmt(stmt);
			}
		}
		
		return flag;
	}

	@Override
	public boolean insertUserPhoto(String userId, String photourl) {
		// TODO Auto-generated method stub
		boolean flag = true;
		
		Connection conn = JDBCUtil.getConnection();
		String sql = "update userdetailinfo set userPhoto = ? where userId = ?";
		
		PreparedStatement pstmt = JDBCUtil.preparedStatement(conn, sql);
		try {
			pstmt.setString(1, photourl);
			pstmt.setInt(2, Integer.parseInt(userId));
			pstmt.executeUpdate();
//System.out.println(photourl);			
		} catch (NumberFormatException | SQLException e) {
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
		}
		return flag;
	}




	@Override
	public boolean SaveBusinessPublishHealthyRoomInfo(int businessId, String gymName, String gymAddr, String gymPrice,
			String gymTel, String gymIntroduce, String photoUrl1, String photoUrl2, String photoUrl3) {
		// TODO Auto-generated method stub
		boolean flag = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into publishhealthyroom values(null, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, businessId);
			pstmt.setString(2, gymName);
			pstmt.setString(3, gymIntroduce);
			pstmt.setString(4, photoUrl1);
			pstmt.setString(5, photoUrl2);
			pstmt.setString(6, photoUrl3);
			pstmt.setString(7, gymPrice);
			pstmt.setString(8, gymTel);
			pstmt.setString(9, gymAddr);
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
		}
		return flag;
	}
	
	
	@Override
	public PublishHealthyRoom getPublishInfo(int businessId) {
		
		PublishHealthyRoom publish = new PublishHealthyRoom();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from publishhealthyroom where businessId = ?";
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, businessId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				publish.setGymId(rs.getInt(1));
				publish.setBusinessId(rs.getInt(2));
				publish.setGymName(rs.getString(3));
				publish.setGymIntroduce(rs.getString(4));
				publish.setGymPicture1(rs.getString(5));
				publish.setGymPicture2(rs.getString(6));
				publish.setGymPicture3(rs.getString(7));
				publish.setGymPrice(rs.getString(8));
				publish.setGymTel(rs.getString(9));
				publish.setGymAddress(rs.getString(10));
				publish.setGymPublishDate(rs.getDate(11));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return publish;
	} 
	
	@Override
	public boolean saveUserInfo(UserDetailInfo userDetailInfo) {
		// TODO Auto-generated method stub
		boolean flag = true;
		Connection conn = JDBCUtil.getConnection();
		String sql = "update userdetailinfo set userIntroduce=?, userGender=?, userHeight=?, userWeight=?, userBWH=?, userAge=?, userBirthday=?, userTel=?, userAddress=?  where userId = ?";
		PreparedStatement pstmt = JDBCUtil.preparedStatement(conn, sql);
		try {
			pstmt.setString(1, userDetailInfo.getUserIntroduce());
			pstmt.setString(2, userDetailInfo.getUserGender());
			pstmt.setInt(3, userDetailInfo.getUserHeight());
			pstmt.setInt(4, userDetailInfo.getUserWeight());
			pstmt.setString(5, userDetailInfo.getUserBWH());
			pstmt.setInt(6, userDetailInfo.getUserAge());
			pstmt.setDate(7, userDetailInfo.getUserBirthday());
			pstmt.setInt(8, userDetailInfo.getUserTel());
			pstmt.setString(9, userDetailInfo.getUserAddress());
			pstmt.setInt(10, userDetailInfo.getUserId());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
		}
		
		return flag;
	}

	@Override
	public boolean deleteTheme(int userIdNum, int themeIdNum) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection conn = JDBCUtil.getConnection();
		String sql = "select userId from theme where themeId = ?";
		PreparedStatement pstmt = JDBCUtil.preparedStatement(conn, sql);
		ResultSet rs = null;
		try {
			pstmt.setInt(1, themeIdNum);
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getInt(1) == userIdNum) {
				if(deleteThemeFunc(themeIdNum))
					flag = true; 
			} else {
				flag = false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return flag;
	}

	//进行删除主题
	private boolean deleteThemeFunc(int themeIdNum) {
		
		boolean flag = true;
		Connection conn = JDBCUtil.getConnection();
		String sql = "delete from theme where themeId = ?";
		PreparedStatement pstmt = JDBCUtil.preparedStatement(conn, sql);
		try {
			pstmt.setInt(1, themeIdNum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
		}
		return flag;
	}
	
	@Override
	public boolean checkUsernameFormat(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkUserForAJAX(String username, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveRegister(String username, String password, String role) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmtInsertRole = null;
		boolean flag = true;
		
		String sql = "insert into user values(null, ?, ?)";
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = JDBCUtil.preparedStatement(conn, sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			rs.next();
			int userId = rs.getInt(1);
			rs.close();
			
			String sqlInsertRole = "insert into userdetailinfo (userBodyId, userId, roleId) values(null, ?, ?)";
			pstmtInsertRole = JDBCUtil.preparedStatement(conn, sqlInsertRole);
			pstmtInsertRole.setInt(1, userId);
			pstmtInsertRole.setInt(2, Integer.parseInt(role));
			pstmtInsertRole.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch(SQLException e) {
			try {
				conn.rollback();
				conn.setAutoCommit(true);
				flag = false;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			flag = false;
			e.printStackTrace();
		} finally {
			if(conn != null) {
				JDBCUtil.closedConn(conn);
			}
			if(pstmt != null) {
				JDBCUtil.closedStmt(pstmt);
			}
			if(pstmtInsertRole != null) {
				JDBCUtil.closedPstmt(pstmtInsertRole);
			}
		}
		return flag;
	}

	public int chechUserToLogin(String username, String password) {
		
		int flag = -1;
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			String sql = "select * from user";
			rs = JDBCUtil.executeQuery(stmt, sql);
			while(rs.next()) {
				if(rs.getString("username").equals(username)) {
					if(rs.getString("password").equals(password)) {
						flag = rs.getInt("userId");
					}
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closedConn(conn);
			JDBCUtil.closedStmt(stmt);
			JDBCUtil.closedRs(rs);
		}
		return flag;
	}
	
	//进行发布主题信息，信息的插入
	public boolean publishThemeInfo(String theme, String content, String userId) {
		boolean flag = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into theme (themeId, userId, title, cont, publishtime,contAmount) values(null, ?, ?, ?, now(), 0)";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(userId));
			pstmt.setString(2, theme);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			flag = false;
			e.printStackTrace();
		} finally {
			
			if(conn != null) {
				JDBCUtil.closedConn(conn);
			}
			if(pstmt != null) {
				JDBCUtil.closedPstmt(pstmt);
			}
		}
		return flag;
	}

	@Override
	public ArrayList<Theme> getAllTheme() {
		// TODO Auto-generated method stub
		ArrayList<Theme> themes = new ArrayList<Theme>();
		Connection conn = null;
		Statement stmt = null;
		String sql = "select * from theme order by themeId desc";
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Theme theme = new Theme();
				theme.setThemeId(rs.getInt(1));
				theme.setUserId(rs.getInt(2));
				theme.setTitle(rs.getString(3));
				theme.setCont(rs.getString(4));
				theme.setPicture(rs.getString(5));
				theme.setPublishtime(rs.getDate(6));
				theme.setContAmount(rs.getInt(7));
				
				themes.add(theme);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(stmt != null)
				JDBCUtil.closedStmt(stmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return themes; 
	}

	
	@Override
	public ArrayList<Theme> getCurrentTheme(int itemId) {
		// TODO Auto-generated method stub
		ArrayList<Theme> themes = new ArrayList<Theme>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int startNum = itemId * 5; 
		String sql = "select * from theme order by themeId desc limit ?,5";
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, startNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Theme theme = new Theme();
				theme.setThemeId(rs.getInt(1));
				theme.setUserId(rs.getInt(2));
				theme.setTitle(rs.getString(3));
				theme.setCont(rs.getString(4));
				theme.setPicture(rs.getString(5));
				theme.setPublishtime(rs.getDate(6));
				theme.setContAmount(rs.getInt(7));
				
				themes.add(theme);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedStmt(pstmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return themes; 
	}

	
	
	@Override
	public int getUserRole(int userId) {
		// TODO Auto-generated method stub
		int roleId = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select roleId from userdetailinfo where userId = ?";
		try {
			
			conn = JDBCUtil.getConnection();
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next())
				roleId = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return roleId;
	}

	@Override
	public Theme getThemeItem(int themeId) {
		// TODO Auto-generated method stub
		Theme theme = null;
		Connection conn = null;
		Statement stmt = null;
		String sql = "select * from theme where themeId = "+themeId;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = stmt.executeQuery(sql);
			rs.next();
			
			theme = new Theme();
			theme.setThemeId(rs.getInt(1));
			theme.setUserId(rs.getInt(2));
			theme.setTitle(rs.getString(3));
			theme.setCont(rs.getString(4));
			theme.setPicture(rs.getString(5));
			theme.setPublishtime(rs.getDate(6));
			theme.setContAmount(rs.getInt(7));
				
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(stmt != null)
				JDBCUtil.closedStmt(stmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return theme; 
	}

	@Override
	public boolean replyTheme(int themeId, int userId, String content) {//回复主题！
		// TODO Auto-generated method stub
		boolean flag = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into replytheme (themeId, floorId, userId, replytime, cont) values(?, ?, ?, now(), ?)";
		
		PreparedStatement pstmt1 = null;//计算当前回复是多少楼层。
		ResultSet rs = null;
		String sql1 = "select count(*) from replytheme where themeId = ?";
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			
			pstmt1 = JDBCUtil.preparedStatement(conn, sql1);
			pstmt1.setInt(1, themeId);
			rs = pstmt1.executeQuery();
			rs.next();
			int floorId = rs.getInt(1) + 2;//通过获取当前主题的所有回复+2，得出，该回复的楼层数
			
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, themeId);
			pstmt.setInt(2, floorId);
			pstmt.setInt(3, userId);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch(SQLException e) {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			flag = false;
			e.printStackTrace();
			
		} finally {
			
			if(conn != null) {
				JDBCUtil.closedConn(conn);
			}
			if(pstmt != null) {
				JDBCUtil.closedPstmt(pstmt);
			}
		}
		return flag;
	}

	@Override
	public ArrayList<ReplyTheme> getAllReplyTheme(int themeId) {//获取所有的回复！
		// TODO Auto-generated method stub
		ArrayList<ReplyTheme> replyThemes = new ArrayList<ReplyTheme>();
		Connection conn = null;
		Statement stmt = null;
		String sql = "select * from replytheme where themeId = "+themeId;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ReplyTheme replyTheme = new ReplyTheme();
				replyTheme.setThemeId(rs.getInt(1));
				replyTheme.setFloorId(rs.getInt(2));
				replyTheme.setUserId(rs.getInt(3));
				replyTheme.setReplytime(rs.getDate(4));
				replyTheme.setCont(rs.getString(5));
				replyTheme.setPicture(rs.getString(6));
				
				replyThemes.add(replyTheme);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(stmt != null)
				JDBCUtil.closedStmt(stmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return replyThemes; 
	}

	/*public static void main(String[] args) {
		System.out.println(new UserMysqlDAO().getUserName(29));
	}*/
	
	@Override
	public String getUserName(int userId) {
		// TODO Auto-generated method stub
		String username = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select username from user where userId = ?";
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = JDBCUtil.preparedStatement(conn, sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			username = rs.getString(1);

		} catch(SQLException e) {
			e.printStackTrace();
			
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(pstmt != null)
				JDBCUtil.closedPstmt(pstmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return username;
		
	}

	@Override
	public int getTotleThemeReply(int themeId) {
		// TODO Auto-generated method stub
		int contAmount = 0;
		Connection conn = null;
		Statement stmt = null;
		String sql = "select count(*) from replytheme where themeId = "+themeId;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = JDBCUtil.executeQuery(stmt, sql);
			rs.next();
			contAmount = rs.getInt(1);
		} catch (SQLException e) {
			contAmount = -1;
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(stmt != null)
				JDBCUtil.closedStmt(stmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}
		return contAmount;
	}

	@Override
	public int getAllThemeItems() {
		// TODO Auto-generated method stub
		int allThemeItems = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from theme";
		try {
			conn = JDBCUtil.getConnection();
			stmt = JDBCUtil.createStatement(conn);
			rs = JDBCUtil.executeQuery(stmt, sql);
			rs.next();
			allThemeItems = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				JDBCUtil.closedConn(conn);
			if(stmt != null)
				JDBCUtil.closedStmt(stmt);
			if(rs != null)
				JDBCUtil.closedRs(rs);
		}

		return allThemeItems;
	}
}
