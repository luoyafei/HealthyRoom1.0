package com.xust.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CheckBusiness
 */
@WebFilter(filterName="mustIsBusiness",urlPatterns="/HealthyRoom1.0/pages/business_authority/business_pulish_healthyroom_page.jsp")
public class CheckBusiness implements Filter {

    /**
     * Default constructor. 
     */
    public CheckBusiness() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		
		String roleId = (String) session.getAttribute("roleId");
//System.out.println(roleId);
		if(roleId == null) {
			resp.sendRedirect("/HealthyRoom1.0/index.jsp");
			return;
		}
System.out.println(roleId);
		if(roleId.equals("2")) {
			chain.doFilter(request, response);
			return;
		} else {
			resp.sendRedirect("/HealthyRoom1.0/index.jsp");
			return;
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
