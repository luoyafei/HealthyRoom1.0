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
 * Servlet implementation class RegisterResult
 */
@WebServlet("/RegisterResult")
public class RegisterResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterResult() {
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
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession(true);
		
		String action = request.getParameter("action").trim();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String identifyCode = request.getParameter("InputIdentifyCode");
		String realCode = (String) session.getAttribute("code");	
		String role = request.getParameter("role");
//System.out.println("role" + role);
		if(!role.equals("1") && !role.equals("2")) {
			response.sendRedirect("/HealthyRoom1.0/pages/register.jsp");
			//return;
		}
		
		if(action.equals("register") && username.hashCode()!=0 && password.hashCode()!=0 && identifyCode.equals(realCode)) {
			
			boolean resultOfCheckUsername = UserManager.getInstance().checkUserForAJAX(username);
//System.out.println(resultOfCheckUsername);
			if(resultOfCheckUsername) {
				response.sendRedirect("/HealthyRoom1.0/pages/register.jsp");
				//return;
			}
			boolean result = UserManager.getInstance().saveRegister(username, password, role);
//System.out.println(result);			
			if(result) {
				User u = new User();
				u.setUsername(username);
				u.setPassword(password);
				session.setAttribute("userInfo", u);
				session.setAttribute("role", Integer.parseInt(role));
				response.sendRedirect("/HealthyRoom1.0/pages/action.jsp");
				//return;
			} else {
				response.sendRedirect("/HealthyRoom1.0/pages/register.jsp");
			}
		} else {
			response.sendRedirect("/HealthyRoom1.0/pages/register.jsp");
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
