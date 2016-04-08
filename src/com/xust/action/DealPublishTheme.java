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
 * Servlet implementation class DealPublishTheme
 */
@WebServlet("/DealPublishTheme")
public class DealPublishTheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealPublishTheme() {
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
		
		String theme = request.getParameter("theme");
		String content = request.getParameter("content");
		
		if(theme == null || content == null) {
			response.sendRedirect("/HealthyRoom1.0/index.jsp");
			//return;
		}
		
		HttpSession session = request.getSession(false);
		int userId = -1;
		if(session != null && session.getAttribute("userInfo") != null) {
			User u = (User) session.getAttribute("userInfo");
			userId = u.getUserId();
		}
		boolean flag = UserManager.getInstance().publishThemeInfo(theme, content, String.valueOf(userId));
		if(!flag) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
System.out.println("发帖失败！");
			//return;
		} else {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
System.out.println("发帖成功！");
			//return;
		}
		
		//out.flush();
		//out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
