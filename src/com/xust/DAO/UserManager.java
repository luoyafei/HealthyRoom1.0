package com.xust.DAO;

import java.util.ArrayList;

import com.xust.bean.PublishHealthyRoom;
import com.xust.bean.ReplyTheme;
import com.xust.bean.Theme;
import com.xust.bean.UserDetailInfo;

public class UserManager {

	private static UserManager manager = null;
	private static UserDAO dao = new UserMysqlDAO();
	
	public static UserManager getInstance() {
		if(manager == null) {
			manager = new UserManager();
		}
		return manager;
	}
	
	public boolean checkUserForAJAX(String username) {
		
		return dao.checkUserForAJAX(username);
	}//在用户注册时，进行ajax验证，查看用户名是否重复
	public boolean checkUsernameFormat(String username) {//在用户进行注册时，进行用户名格式的验证
		
		return dao.checkUsernameFormat(username);
	}
	public boolean checkUserForAJAX(String username, String password) {//在用户登录时，进行ajax验证，查看用户名及密码是否正确
		
		return dao.checkUserForAJAX(username, password);
	}
	public boolean saveRegister(String username, String password, String role) {//当用户进行注册时，成功后，将用户的用户名及密码存入数据库
		
		return dao.saveRegister(username, password, role);
	}
	
	public int checkUserToLogin(String username, String password) {
		return dao.chechUserToLogin(username, password);
	}
	
	public boolean publishThemeInfo(String theme, String content, String userId) {
		return dao.publishThemeInfo(theme, content, userId);
	}
	
	public ArrayList<Theme> getAllTheme() {
		return dao.getAllTheme();
	}
	
	public int getAllHealthyNum() {
		return dao.getAllHealthyNum();
	}
	
	public ArrayList<Theme> getAllTheme(int userId) {
		return dao.getAllTheme(userId);
	}
	
	public ArrayList<Theme> getCurrentTheme(int itemId) {
		return dao.getCurrentTheme(itemId);
	}
	
	public ArrayList<PublishHealthyRoom> getCurrentPubHeaRoom(int itemId) {
		return dao.getCurrentPubHeaRoom(itemId);
	}
	
	
	public ArrayList<Theme> getCurrentTheme(int userId,int itemId) {
		return dao.getCurrentTheme(userId, itemId);
	}
	
	public Theme getThemeItem(int themeId) {
		return dao.getThemeItem(themeId);
	}
	
	public boolean replyTheme(int themeId, int userId, String content) {
		return dao.replyTheme(themeId, userId, content);
	}
	
	public ArrayList<ReplyTheme> getAllReplyTheme(int themeId) {
		return dao.getAllReplyTheme(themeId);
	}
	
	public String getUserName(int userId) {
		return dao.getUserName(userId);
	}
	
	public UserDetailInfo getUserDtailInfo(int userId) {
		return dao.getUserDetailInfo(userId);
	}
	
	public int getTotleThemeReply(int themeId) {
		return dao.getTotleThemeReply(themeId);
	}
	
	public int getAllThemeItems() {
		return dao.getAllThemeItems();
	}

	public boolean deleteTheme(int userIdNum, int themeIdNum) {
		// TODO Auto-generated method stub
		return dao.deleteTheme(userIdNum, themeIdNum);
	}

	public boolean insertUserPhoto(String userId, String photourl) {
		// TODO Auto-generated method stub
		return dao.insertUserPhoto(userId, photourl);
	}

	public boolean saveUserInfo(UserDetailInfo userDetailInfo) {
		// TODO Auto-generated method stub
		return dao.saveUserInfo(userDetailInfo);
	}

	public int getUserRole(int userId) {
		// TODO Auto-generated method stub
		return dao.getUserRole(userId);
	}
	
	public String getUserPhoto(int userId) {
		// TODO Auto-generated method stub
		return dao.getUserPhoto(userId);
	}

	public boolean SaveBusinessPublishHealthyRoomInfo(int businessId, String gymName, String gymAddr, String gymPrice, String gymTel,
			String gymIntroduce, String photoUrl1, String photoUrl2, String photoUrl3) {
		// TODO Auto-generated method stub
		return dao.SaveBusinessPublishHealthyRoomInfo(businessId, gymName, gymAddr, gymPrice, gymTel,
				gymIntroduce, photoUrl1, photoUrl2, photoUrl3);
	}
	public PublishHealthyRoom getPublishInfo(int businessId) {
		return dao.getPublishInfo(businessId);
		
	}
	
	public ArrayList<PublishHealthyRoom> getAllPubHeaRoom() {
		return dao.getAllPubHeaRoom();
	}
	
	public void updateHadReadNum(int themeId,int contAmount) {
		dao.updateHadReadNum(themeId, contAmount);
	}

	public int getUserId(String username) {
		// TODO Auto-generated method stub 
		return dao.getUserId(username);
	}

	public String updateUserPassword(int userId, String repassword, String newpassword) {
		// TODO Auto-generated method stub
		return dao.updateUserPassword(userId, repassword, newpassword);
	}

	public boolean deleteGym(int userId) {
		// TODO Auto-generated method stub
		return dao.deleteGym(userId);
	}
}
