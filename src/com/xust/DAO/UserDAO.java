package com.xust.DAO;

import java.util.ArrayList;

import com.xust.bean.*;

public interface UserDAO {
	public boolean checkUserForAJAX(String username);//���û�ע��ʱ������ajax��֤���鿴�û����Ƿ��ظ�
	public boolean checkUsernameFormat(String username);//���û�����ע��ʱ�������û�����ʽ����֤
	public boolean checkUserForAJAX(String username, String password);//���û���¼ʱ������ajax��֤���鿴�û����������Ƿ���ȷ
	public boolean saveRegister(String username, String password, String role);//���û�����ע��ʱ���ɹ��󣬽��û����û���������������ݿ�
	public int chechUserToLogin(String username, String password);//���û����е�¼ʱ�������û����Լ��������֤��
	public boolean publishThemeInfo(String theme, String content, String userId);//��������
	public ArrayList<Theme> getAllTheme();//��ȡ���е�����
	public Theme getThemeItem(int themeId);//ͨ������Id��ȡ����ʵ��
	public boolean replyTheme(int themeId,int userId, String content);//�ظ�����
	public ArrayList<ReplyTheme> getAllReplyTheme(int themeId);//��ȡ���еĻظ�
	public String getUserName(int userId);//ͨ���û�Id����û���
	public int getTotleThemeReply(int themeId);//��ȡ����ظ�������
	public int getAllThemeItems();//��ȡ������������и�������
	public boolean deleteTheme(int userIdNum, int themeIdNum);//ɾ������
	public boolean insertUserPhoto(String userId, String photourl);//����ͷ����ϴ�
	public boolean saveUserInfo(UserDetailInfo userDetailInfo);//�����û���Ϣ�ı��棡
	public ArrayList<Theme> getCurrentTheme(int itemId);
	public int getUserRole(int userId);
	public boolean SaveBusinessPublishHealthyRoomInfo(int businessId, String gymName, String gymAddr, String gymPrice,
			String gymTel, String gymIntroduce, String photoUrl1, String photoUrl2, String photoUrl3);
	public PublishHealthyRoom getPublishInfo(int businessId);
	public ArrayList<PublishHealthyRoom> getAllPubHeaRoom();//��ȡ���з������Ľ�����Ϣ
	public void updateHadReadNum(int themeId, int contAmount);//���û����Ѷ��ظ����и��£�
	public ArrayList<Theme> getAllTheme(int userId);//ͨ���û�Id��ȡ�䷢����������������
	public ArrayList<Theme> getCurrentTheme(int userId, int itemId);//ͨ��userId����ȡÿҳ��Ҫչʾ������
	public String getUserPhoto(int userId);//ͨ��userId��ȡ�û���ͷ��
	public int getAllHealthyNum();//��ȡ���еĽ�����Ŀ
	public ArrayList<PublishHealthyRoom> getCurrentPubHeaRoom(int itemId);//��ȡ��ҳ����
	public int getUserId(String username);
	public UserDetailInfo getUserDetailInfo(int userId);
	public String updateUserPassword(int userId, String repassword, String newpassword);//�����û������룡
	public boolean deleteGym(int userId);
	public Integer getSearchThemeListSize(String searchText);//��ȡͨ��������������ύ��ģ����ѯ�����������ĸ���
}
