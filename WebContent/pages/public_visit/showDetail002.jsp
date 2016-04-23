<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.xust.bean.*,com.xust.DAO.*"%>
<%!
	int userId;
	String userName;
	
%>    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String base = request.getContextPath();
	
%>

<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../../favicon.ico">

		<title>展示健身房信息</title>

		<!-- Bootstrap core CSS -->
		<link href="../../assets/bootstrap-3.3.5/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

		<!-- Custom styles for this template -->
		<link href="../dashboard.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style>
		
			 #all {
	            margin-top: 40px;
	            width: 70%;
	            height: 80.665%;
	            margin-right: auto;
	            margin-left: auto;
	        }
			#all p{
				font-family:"宋体", "黑体";
				font-size:28px;
				color:#000000;
				}
	
			.col-md-4,
			.col-md-8,
			.col-md-10 {
				text-align: center;
				margin-bottom: 5%;
			}
		</style>
		
	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=base %>/index.jsp" style="font-size: 24px;font-family: '微软雅黑';">西科梦想减肥健身行</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="<%=base %>/index.jsp">首页</a></li>
						<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/about_our.jsp">关于我们</a></li>
						<li><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
						<li class="active"><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">快速搜索</button>
						</form>

					</ul>
					<div class="navbar-form pull-right">

						<%
						if (session.getAttribute("userInfo") != null) {
							User u = (User) session.getAttribute("userInfo");
							userId = u.getUserId();
							userName = u.getUsername();//已经登陆的用户名
//System.out.println(u.getUsername());
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
						<span class="caret"></span> <span class="sr-only">Toggle
							Dropdown</span> </a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/HealthyRoom1.0/pages/action.jsp">个人中心</a></li>
							<li><a href="/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp">我的消息 <span class="badge" style="background-color: red;"><%=notReadNum %></span></a></li>
							<li class="divider"></li>
							<li><a href="/HealthyRoom1.0/RemoveUserSession">注销</a></li>
						</ul>
					</div>
					<%
						} else {
					%>
					<div id="login-register-bar">
						<button class="btn btn-primary" onclick="func()">登陆</button>
						<a class="btn btn-default" href="<%=base %>/pages/register.jsp">注册</a>
					</div>
					<%
						}
					%>
						<script src="../js/checklogin.js"></script>
					</div>
				</div>
			</div>
		</nav>

			<!-- Modal -->
			<div>
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header"><p align="center" >
			        <h4 class="modal-title" id="myModalLabel">【实用马甲线训练】&nbsp;&nbsp;&nbsp;&nbsp;七组虐腹动作，每个动作15-20次，每天做一遍，只要一个月！
			        	<span><button class="btn btn-default" onclick="window.history.go(-1)" style="float: right;">点此返回</button></span>
			        </h4>
			        
			      </div>
			      <div class="modal-body">
			        
			        <div style="width: 100%;height: 100%;">
						<div id="all">
							<img src="../../assets/img/jianshen/a14e5abegw1exqgot5pnog208c05kwjq.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						    <img src="../../assets/img/jianshen/a14e5abegw1exqgotyagjg208c05ktfa.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						    <img src="../../assets/img/jianshen/a14e5abegw1exqgouxomeg208c05k79k.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						    <img src="../../assets/img/jianshen/a14e5abegw1exqgovuhn3g208c05kgri.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
							<img src="../../assets/img/jianshen/a14e5abegw1exqgows4iig208c05kdln.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						    <img src="../../assets/img/jianshen/a14e5abegw1exqgozd76ag208c05kn3j.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						    <img src="../../assets/img/jianshen/a14e5abegw1exqgp2lfffg208c05kq8u.gif" style="width:100%; height: 100%;" class="img-thumbnail"/>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" onclick="enterForum()" data-dismiss="modal">努力一定就有收获！进入论坛与小伙伴们一起分享交流吧！</button>
			      </div>
			    </div>
			  </div>
			</div>
			<script>
				function enterForum() {
					<%
						if (session.getAttribute("userInfo") != null) {
					%>
						window.loaction.href = "";
					<%} else {%>
						func();
					<%
					}
					%>
				}
			</script>

				<!-- FOOTER -->
			<div style="width:100%; background-color: #333333;">
				<div class="container">
					<footer>
						<p class="pull-right">
							<a href="#">Back to top</a>
						</p>
						<p>
							<span style="color:white;">&copy; 2015 cuiluozhou &middot;</span> <a href="#">XIKEDA</a> &middot;
						</p>
					</footer>
				</div>
			</div>


		<!-- Bootstrap core JavaScript
	    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="../../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
		<script src="../../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
		<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
		<div id="logindialogspan002">
			<jsp:include page="../action_include/logindialog.jsp" flush="true"></jsp:include>
		</div>
		<div id="uploadPicture"></div>
		<script>
		function changePhoto() {
			$("#changeModal").modal('show');
		}
		
		
		function checkcontent() {

			var theme = $("#theme").val().trim();
			var content= $("#content2").val().trim();
			if(theme === "" || content === "")
				return false;
			else
				return true;
		}
		
		</script>
	</body>
</html>