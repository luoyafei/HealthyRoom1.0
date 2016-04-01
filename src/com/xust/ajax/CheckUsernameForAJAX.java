package com.xust.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xust.DAO.UserManager;

/**
 * Servlet implementation class CheckUsernameForAJAX
 */
@WebServlet("/CheckUsernameForAJAX")
public class CheckUsernameForAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckUsernameForAJAX() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username").trim();
		boolean result = UserManager.getInstance().checkUserForAJAX(username);
		if(result) {
			out.print("此邮箱已经被注册过");
		} else {
			out.print("此邮箱可用");
		}
		//System.out.println(result);
		out.flush();
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
