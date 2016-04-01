package com.xust.DAO;

import java.util.ArrayList;

import com.xust.bean.*;

public interface UserDAO {
	public boolean checkUserForAJAX(String username);//在用户注册时，进行ajax验证，查看用户名是否重复
	public boolean checkUsernameFormat(String username);//在用户进行注册时，进行用户名格式的验证
	public boolean checkUserForAJAX(String username, String password);//在用户登录时，进行ajax验证，查看用户名及密码是否正确
	public boolean saveRegister(String username, String password, String role);//当用户进行注册时，成功后，将用户的用户名及密码存入数据库
	public int chechUserToLogin(String username, String password);//当用户进行登录时，进行用户名以及密码的验证！
	public boolean publishThemeInfo(String theme, String content, String userId);//发布主题
	public ArrayList<Theme> getAllTheme();//获取所有的主题
	public Theme getThemeItem(int themeId);//通过主题Id获取主题实例
	public boolean replyTheme(int themeId,int userId, String content);//回复主题
	public ArrayList<ReplyTheme> getAllReplyTheme(int themeId);//获取所有的回复
	public String getUserName(int userId);//通过用户Id获得用户名
	public int getTotleThemeReply(int themeId);//获取主题回复总数！
	public int getAllThemeItems();//获取发表主题的所有个数！；
	public boolean deleteTheme(int userIdNum, int themeIdNum);//删除主题
	public boolean insertUserPhoto(String userId, String photourl);//进行头像的上传
	public boolean saveUserInfo(UserDetailInfo userDetailInfo);//进行用户信息的保存！
	public ArrayList<Theme> getCurrentTheme(int itemId);
	public int getUserRole(int userId);
	public boolean SaveBusinessPublishHealthyRoomInfo(int businessId, String gymName, String gymAddr, String gymPrice,
			String gymTel, String gymIntroduce, String photoUrl1, String photoUrl2, String photoUrl3);
	public PublishHealthyRoom getPublishInfo(int businessId);
	

}
