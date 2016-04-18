package com.xust.ajax;

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
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
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
		String repassword = request.getParameter("repassword").trim();
		String newpassword = request.getParameter("newpassword").trim();
		String renewpassword = request.getParameter("renewpassword").trim();
		PrintWriter out = response.getWriter();
//System.out.println("updatepassword  repassword:" + repassword + "\n");
		
		if(repassword.hashCode()==0 || newpassword.hashCode()==0 || renewpassword.hashCode()==0 || !newpassword.equals(renewpassword)) {
			out.print("-1");
			return;
		}
		
		HttpSession session = request.getSession(false);
		User u = (User)session.getAttribute("userInfo");
//System.out.println("userInfo password:" + u.getPassword());
		if(u==null) {
			response.sendRedirect("/HealthyRoom1.0/index.jsp");
			return;
		}
		
		String getNewPassword = UserManager.getInstance().updateUserPassword(u.getUserId(), repassword, newpassword);
		
		if(getNewPassword==null) {
			out.print("0");
			return;
		} else {
			u.setPassword(newpassword);
			out.print(1);
//System.out.println("updatepassword  newpassword:" + newpassword);
			return;
		}
		
		/*if(repassword == null || newpassword == null || renewpassword == null) {
			out.print("{\"status\":\"" + 0 + "\"}");
			return;
		} else {
			out.print("{\"status\":\"" + 1 + "\"}");
			return;
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
