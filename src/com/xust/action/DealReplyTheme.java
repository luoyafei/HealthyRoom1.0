package com.xust.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xust.DAO.UserManager;
import com.xust.bean.User;

/**
 * Servlet implementation class DealReplyTheme
 */
@WebServlet("/DealReplyTheme")
public class DealReplyTheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealReplyTheme() {
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
		
		//PrintWriter out = response.getWriter();
		
		String themeId = request.getParameter("themeId");
		String content = request.getParameter("content");
		
		PrintWriter out = response.getWriter();
		if(themeId == null || content == null) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			//return;
		}
		
		HttpSession session = request.getSession(false);
		int userId = -1;
		if(session != null && session.getAttribute("userInfo") != null) {
			User u = (User) session.getAttribute("userInfo");
			userId = u.getUserId();
		}
		boolean flag = UserManager.getInstance().replyTheme(Integer.parseInt(themeId), userId, content);
		
//System.out.println(flag);
		if(!flag) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/replyThemePage.jsp?themeId="+themeId);
System.out.println("回帖失败！");
			//return;
		} else {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/replyThemePage.jsp?themeId="+themeId);
System.out.println("回帖成功！");
			//return;
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
