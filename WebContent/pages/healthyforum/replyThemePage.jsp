<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.xust.bean.*,com.xust.DAO.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String base = request.getContextPath();
	String themeIdString = request.getParameter("themeId");
	int themeId = Integer.parseInt(themeIdString);
//System.out.println(themeId);
%>

<%!
	int userId;
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

		<title>荟萃论坛</title>

		<!-- Bootstrap core CSS -->
		<link href="../../assets/bootstrap-3.3.5/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

		<!-- Custom styles for this template -->
		<link href="../dashboard.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>
		<script charset="utf-8" src="../../assets/ke/kindeditor.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style>
			.col-md-4,
			.col-md-8,
			.col-md-10 {
				text-align: center;
				margin-bottom: 5%;
			}
		</style>
		<script>
			KE.show({
			id : 'content2',
			resizeMode : 1,
			allowPreviewEmoticons : false,
			allowUpload : false,
			items : [
			'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});
		</script>
	</head>

	<body>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#" style="font-size: 24px;font-family: '微软雅黑';">西科梦想减肥健身行</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">首页</a></li>
						<li><a class="text-primary" href="#">关于我们</a></li>
						<li><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
						<li><a class="text-primary" href="#">活动中心</a></li>
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
							//System.out.println(u.getUserId());
					%>
					<div class="navbar-form pull-right">
						<a href="#"><span class="glyphicon glyphicon-user"
							aria-hidden="true"></span>&nbsp;&nbsp;<%=u.getUsername()%> </a> <a
							class="dropdown-toggle" data-toggle="dropdown"> <span
							class="caret"></span> <span class="sr-only">Toggle
								Dropdown</span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<%=base %>/pages/action.jsp">个人中心</a></li>
							<li><a href="#">我的健身房</a></li>
							<li><a href="#">我的消息</a></li>
							<li class="divider"></li>
							<li><a
								href="<%=base %>/RemoveUserSession">注销</a></li>
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

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<div style="width: 80%;height: 30%;margin: 0 auto;margin-bottom: 20%;">

						<div style="width: 75%; height: 75%;margin: 0 auto; margin-bottom: 10px;">
							<img class="img-circle" style="width: 100%; height: 100%;" src="../111.jpg" />
						</div>
						<div class="form-group" style="width: 100%;height: 40%;">
							<div style="width: 100%;height: 100%;text-align: center;">
								<button type="button" class="btn btn-primary" id="changePicture" onclick="changePhoto()">更换头像</button>
								
							</div>
						</div>
					</div>

					<div style="width: 100%;height: 50%;margin: 0 auto;text-align: center;">

						<div class="btn-group-vertical" role="group" aria-label="...">
								<ul class="nav" role="tablist">
								  <li role="presentation" class="active"><a href="#forum" role="tab" data-toggle="tab">荟萃论坛</a></li>
								  <li role="presentation"><a href="#addInfo" role="tab" data-toggle="tab">完善信息</a></li>
								  <li role="presentation"><a href="#myHealth" role="tab" data-toggle="tab">我的健身</a></li>
								  <li role="presentation"><a href="#myFocus" role="tab" data-toggle="tab">我的关注</a></li>
								  <li role="presentation"><a href="#myReply" role="tab" data-toggle="tab">我的帖子</a></li>
							      <li role="presentation"><a href="#alterSource" role="tab" data-toggle="tab">修改资料</a></li>
							         
							      <%
								 //String roleIdStr = (String) session.getAttribute("role");
							      int roleIdStr = (Integer)session.getAttribute("role");
//System.out.println(roleIdStr);
								 if(roleIdStr==0) {
									 response.sendRedirect("/HealthyRoom1.0/index.jsp");
									 return;
								 } else if(roleIdStr == 2) {
									 out.print("<a href='/HealthyRoom1.0/pages/business_authority/business_pulish_healthyroom_page.jsp' style='font-size: 28px;font-weight: bold;color: red;text-decoration: none;'>发布信息</a>");
							      }
							      %>
								</ul>
							</div>
					</div>
				</div>
				
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background-color: #F5F5F5;">
					<div style="width: 100%;height: 100%;">
					
					<%
						Theme theme = UserManager.getInstance().getThemeItem(themeId);
						String username = UserManager.getInstance().getUserName(theme.getUserId());
						int contAmount = UserManager.getInstance().getTotleThemeReply(themeId);
					%>
					<h3>主题：<a class="healthyName" href="javascript:void(0)" style="font-weight: bolder;text-decoration: none;"><%=theme.getTitle() %></a></h3>
						
						<div class="healthyInfo" style="width: 100%;height: 150px;margin: 20px auto;border-bottom: solid black 1px;">
				               <div class="main-left" style="float: left;">
				                   <div class="img1" style="margin-right: 10px;height: 150px;">
				                       <div style="height:80%;">
				                       		<img class="img-circle" src="04.jpg" alt="" style="width:120px;height: 100%;">
				                       </div>
				                       <div style="height:18%;margin-top: 1%;">
				                       		<span style="float:left;margin-left:10px;">楼主：<%=username %>
				                       			<a class="btn" onclick="history.go(-1)">返回</a>
				                       		</span>
				                       </div>
				                   </div>
				               </div>
				               <div class="main-right" style="text-align: center;height: 150px;">
				                   <p><%=theme.getCont() %></p>
				                   <br/>
				                   <br/>
				                   <h5 style="float:right;margin-right:10px;">回复数：<%=contAmount %>&nbsp;
				                   		<%
				                   			if(userId == theme.getUserId()) {
				                   				out.print("<a href=" + base + "/DeleteTheme?themeId=" + theme.getThemeId() + ">删除此主题</a>");
				                   			}
				                   		%>
				                   </h5>
				               </div>
				           </div>
				      <%
				      	List<ReplyTheme> replyThemes = UserManager.getInstance().getAllReplyTheme(themeId);
				      	for(Iterator<ReplyTheme> items = replyThemes.iterator(); items.hasNext();) {
				      		ReplyTheme replyTheme = items.next();
				      		String replyusername = UserManager.getInstance().getUserName(replyTheme.getUserId());
				      	
				      %>
							<div class="healthyInfo" style="width: 100%;height: 150px;margin: 20px auto;border-bottom: solid black 1px;">
				               <div class="main-left" style="float: left;">
				                   <div class="img1" style="margin-right: 10px;height: 150px;">
				                        <div style="height:80%;">
				                       		<img class="img-circle" src="04.jpg" alt="" style="width:120px;height: 100%;">
				                       </div>
				                       <div style="height:18%;margin-top: 1%;">
				                       		<span style="float:left;margin-left:10px;">层主：<%=replyusername %></span>
				                       </div>
				                   </div>
				               </div>
				               <div class="main-right" style="text-align: center;height: 150px;">
				                   <h4>第<%=replyTheme.getFloorId() %>楼</h4>
				                   <br />
				                   <h3><p><%=replyTheme.getCont() %></p></h3>
				                   <h5 style="float:right;margin-right:10px;">回帖时间：<%=replyTheme.getReplytime() %>&nbsp;
				                   		<%
				                   			if(userId == replyTheme.getUserId()) {
				                   				out.print("<a href=''>删除</a>");
				                   			}
				                   		%>
				                   </h5>
				               </div>
				    </div>				           
				        
				        <%} %>   
				           
						<form action="<%=base %>/DealReplyTheme" method="post" onsubmit="checkcontent()">
							<div style="width: 100%;height: 100%;margin: 0 auto;">
								<div class="input-group" style="width: 100%;height: 70%;">
									<textarea class="" id="content2" name="content" style="width:100%;height:200px;visibility:hidden;"></textarea>
								</div>
								<div class="form-group" style="width: 100%;height: 10%;">
									<button class="btn btn-info btn-lg btn-block" type="submit">回复该主题</button>
									<input type="hidden" name="themeId" value="<%=themeId %>" />
								</div>
							</div>
						</form>
					</div>
				</div>
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
		<div id="logindialogspan"></div>
		<div id="uploadPicture"></div>
		<script>
		function changePhoto() {
			$("#changeModal").modal('show');
		}
		$(document).ready(function() {
			$("#logindialogspan").load("<%=base %>/pages/action_include/logindialog.jsp");
			$("#accomplishUserInfo").load("<%=base %>/pages/action_include/accomplishUserInfo.jsp");
			$("#spanalterPassword").load("<%=base %>/pages/action_include/alterpassword.jsp");
			$("#uploadPicture").load("<%=base %>/pages/healthyforum/userUploadPicture.jsp");
			$('#myTab a:last').tab('show')
		});
		
		function checkcontent() {

			var content= $("#content2").val().trim();
			if(content === "")
				return false;
			else
				return true;
		}
		
		</script>
	</body>

</html>