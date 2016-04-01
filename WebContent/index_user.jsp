<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xust.bean.*" %>    
<%
   	request.setCharacterEncoding("UTF-8");
   	response.setCharacterEncoding("UTF-8");
%>

<%if(session.getAttribute("userInfo") != null) { 
	User u = (User) session.getAttribute("userInfo");
	//System.out.println(u.getUserId());
%>
<div class="navbar-form pull-right">
						<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;<%=u.getUsername() %></a>
						<a class="dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">个人中心</a></li>
							<li><a href="#">我的健身房</a></li>
							<li><a href="#">我的消息</a></li>
							<li class="divider"></li>
							<li><a href="#">注销</a></li>
						</ul>
					</div>
<%
}
%>