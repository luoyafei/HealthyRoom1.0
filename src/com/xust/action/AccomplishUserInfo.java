package com.xust.action;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xust.DAO.UserManager;
import com.xust.bean.User;
import com.xust.bean.UserDetailInfo;

/**
 * Servlet implementation class AccomplishUserInfo
 */
@WebServlet("/AccomplishUserInfo")
public class AccomplishUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccomplishUserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		/*PrintWriter out = response.getWriter();*/
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userInfo")==null) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			return;
		}
		User u = (User) session.getAttribute("userInfo");
		
		String userIntroduce = request.getParameter("userIntroduce");
		String userGender = request.getParameter("usergender");
		String userHeight = request.getParameter("userheight");
		String userWeight = request.getParameter("userweight");
		String userBWH = request.getParameter("userBWH");
		String userAge = request.getParameter("userage");
		String userBirthday = request.getParameter("userbirthday");
		String userTel = request.getParameter("usertel");
		String userAddress = request.getParameter("useraddress");
		
		UserDetailInfo userDetailInfo = new UserDetailInfo();
		userDetailInfo.setUserId(u.getUserId());
		userDetailInfo.setUserIntroduce(userIntroduce);
		userDetailInfo.setUserGender(userGender);
		userDetailInfo.setUserHeight(Integer.parseInt(userHeight));
		userDetailInfo.setUserWeight(Integer.parseInt(userWeight));
		userDetailInfo.setUserBWH(userBWH);
		userDetailInfo.setUserAge(Integer.parseInt(userAge));
		String time[] = userBirthday.split("/");
		//Calendar c = Calendar.getInstance();
		//c.set(Integer.parseInt(time[0]), Integer.parseInt(time[1]), Integer.parseInt(time[2]));
		@SuppressWarnings("deprecation")
		Date d = new Date(Integer.parseInt(time[0]), Integer.parseInt(time[1]), Integer.parseInt(time[2]));
		userDetailInfo.setUserBirthday(d);
		userDetailInfo.setUserTel(Integer.parseInt(userTel));
		userDetailInfo.setUserAddress(userAddress);
		
		boolean accomplishResult = UserManager.getInstance().saveUserInfo(userDetailInfo);
		if(accomplishResult) {
			System.out.println("用户数据完成保存成功");
			session.setAttribute("userDetailInfo", userDetailInfo);
		}
			
		else
			System.out.println("用户数据保存失败");
		
		response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
		//return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
