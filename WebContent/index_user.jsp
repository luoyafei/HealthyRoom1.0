<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xust.bean.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.xust.DAO.*" %>
<%
   	request.setCharacterEncoding("UTF-8");
   	response.setCharacterEncoding("UTF-8");
%>

<%if(session.getAttribute("userInfo") != null) { 
	User u = (User) session.getAttribute("userInfo");
	//System.out.println(u.getUserId());
	List<Theme> themes = UserManager.getInstance().getAllTheme(u.getUserId());
							int notReadNum = 0;
							
							for(Iterator<Theme> items = themes.iterator(); items.hasNext();) {
								Theme item = items.next();
								int hadRead = item.getHadRead();
								//int itemReply = UserManager.getInstance().getAllReplyTheme(item.getThemeId()).size();
								int contAmount = UserManager.getInstance().getTotleThemeReply(item.getThemeId());
								if(hadRead != contAmount) {
									notReadNum += contAmount-hadRead;
								}
							}
%>
					<div class="navbar-form pull-right">
						<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;<%=u.getUsername() %><span class="badge" style="background-color: red;">
							<%=notReadNum %>
						</span></a>
						<a class="dropdown-toggle" data-toggle="dropdown"> 
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">个人中心</a></li>
							<!-- <li><a href="#">我的健身房</a></li> -->
							<li><a href="/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp">我的消息 <span class="badge" style="background-color: red;"><%=notReadNum %></span></a></li>
							<li class="divider"></li>
							<li><a href="#">注销</a></li>
						</ul>
					</div>
<%
}
%>