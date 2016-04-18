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
 * Servlet implementation class DeletePublishGym
 */
@WebServlet("/DeletePublishGym")
public class DeletePublishGym extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePublishGym() {
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
		response.setContentType("text/json;charset=UTF-8");
//System.out.println("0001");
		String status = "0";
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
//System.out.println("0002");
		User u = (User)session.getAttribute("userInfo");
		if(session==null || u==null) {
			out.print("{\"status\":\"" + status + "\"}");
			return;
		}
		
		//out.print("{\"status\":\"" + "你是煞笔吗！" + "\"}");
		
//System.out.println("0003");
		int userId = u.getUserId();
//System.out.println(userId);
		boolean flag = UserManager.getInstance().deleteGym(userId);
		
		if(flag) {
			status = "1";
System.out.println("成功删除健身房信息！");
		} else {
System.out.println("失败删除健身房信息！");
		}
		
//System.out.println(flag);
		out.print("{\"status\":\"" + status + "\"}");
		
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
