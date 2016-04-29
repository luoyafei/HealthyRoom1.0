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
	public ArrayList<PublishHealthyRoom> getAllPubHeaRoom();//获取所有发布过的健身房信息
	public void updateHadReadNum(int themeId, int contAmount);//将用户的已读回复进行更新！
	public ArrayList<Theme> getAllTheme(int userId);//通过用户Id获取其发布过的所有主题帖
	public ArrayList<Theme> getCurrentTheme(int userId, int itemId);//通过userId，获取每页需要展示的主题
	public String getUserPhoto(int userId);//通过userId获取用户的头像！
	public int getAllHealthyNum();//获取所有的健身房数目
	public ArrayList<PublishHealthyRoom> getCurrentPubHeaRoom(int itemId);//获取分页健身房
	public int getUserId(String username);
	public UserDetailInfo getUserDetailInfo(int userId);
	public String updateUserPassword(int userId, String repassword, String newpassword);//更改用户的密码！
	public boolean deleteGym(int userId);
	public Integer getSearchThemeListSize(String searchText);//获取通过导航栏上面的提交的模糊查询到的主题帖的个数
}
