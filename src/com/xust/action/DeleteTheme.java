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
 * Servlet implementation class DeleteTheme
 */
@WebServlet("/DeleteTheme")
public class DeleteTheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTheme() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userInfo")==null) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			return;
		}
		User u = (User) session.getAttribute("userInfo");
		String userId = String.valueOf(u.getUserId());
		String themeId = request.getParameter("themeId");

		if(userId == null || themeId == null) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			return;
		}
		out.println(userId + "," + themeId);
		
		int userIdNum,themeIdNum;
		try {
			userIdNum = Integer.parseInt(userId);
			themeIdNum = Integer.parseInt(themeId);
		} catch(NumberFormatException e) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			return;
		}
		
		boolean deleteflag = UserManager.getInstance().deleteTheme(userIdNum, themeIdNum);
		if(deleteflag) {
			System.out.println("É¾ÌûÊ§°Ü");
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
		} else
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
