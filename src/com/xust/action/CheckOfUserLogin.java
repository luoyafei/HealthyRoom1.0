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
 * Servlet implementation class CheckOfUserLogin
 */
@WebServlet("/CheckOfUserLogin")
public class CheckOfUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOfUserLogin() {
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
		
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		int flag = UserManager.getInstance().checkUserToLogin(username, password);
		//System.out.println(flag);
		if(flag != -1) {
			HttpSession session = request.getSession(true);
			User u = new User();
			u.setUserId(flag);
			u.setUsername(username);
			u.setPassword(password);
			session.setAttribute("userInfo", u);
			
			int role = UserManager.getInstance().getUserRole(u.getUserId());
			session.setAttribute("role", role);
			//out.print("true");
			response.sendRedirect("index.jsp");
		}
		
	/*	if(username.hashCode()==0 || password.hashCode()==0) {
			response.sendRedirect("index.html");
			return;
		}
		*/
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
