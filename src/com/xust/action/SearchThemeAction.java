package com.xust.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xust.DAO.UserManager;

/**
 * Servlet implementation class SearchThemeAction
 */
@WebServlet("/SearchThemeAction")
public class SearchThemeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchThemeAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession(true);
		String searchText = request.getParameter("searchTheme");
		Integer isHaveItem = UserManager.getInstance().getSearchThemeListSize(searchText);
		if(isHaveItem == 0) {
			response.sendRedirect("/HealthyRoom1.0/pages/public_visit/searchThemeResultNull.jsp");
			return;
		} else {
			session.removeAttribute("searchText");
			session.setAttribute("searchText", searchText);
			response.sendRedirect("/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp");
			return;
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
