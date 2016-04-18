<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.xust.bean.*,com.xust.DAO.*"%>
<%@ page import="java.util.*" %>
<%
	String base = request.getContextPath();
	String jspbase = request.getServletPath();
%>
<%!
	int userId;
	String userName;
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
<link rel="icon" href="../../favicon.ico">

<title>西科梦想减肥健身行</title>

<!-- Bootstrap core CSS -->
<link href="../assets/bootstrap-3.3.5/dist/css/bootstrap.min.css"
	type="text/css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="../assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	.col-md-4,.col-md-8,.col-md-10{
    		text-align: center;
    		margin-bottom: 5%;
    	}
    </style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"
					style="font-size: 24px; font-family: '微软雅黑';">西科梦想减肥健身行</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=base %>/index.jsp">首页</a></li>
					<li><a class="text-primary" href="#">关于我们</a></li>
					<li><a class="text-primary"
						href="<%=base%>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp">看健身房</a></li>
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
							userName = UserManager.getInstance().getUserName(userId);
							//System.out.println(u.getUserId());
							List<Theme> themes = UserManager.getInstance().getAllTheme(userId);
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
							<!-- <li><a href="/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp">为我制定健身计划</a></li> -->
							<li><a href="/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp">我的消息 <span class="badge" style="background-color: red;"><%=notReadNum %></span></a></li>
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
					<script>
						function func() {
							$('#myModal').modal('show');
						}
						/* 此为点击确认登录后，验证 模态框内的用户名和密码*/
						function checkModalData() {
							var username = $("#modal-email").val().trim();
							var password = $("#modal-password").val().trim();
							var xmlhttp = null;
							if (username === "" || password === "") {
								alert("请填写登录名及密码");
								addNodeRemove();
								addNodePswRemove();
								$("#modal-email").focus();
								return;
							}
							if (window.XMLHttpRequest) {
								xmlhttp = new XMLHttpRequest();
							} else if (window.XMLHttpRequest) {
								xmlhttp = new ActiveXObject();
							}
							if (xmlhttp == null) {
								alert("无法创建XMLHttpRequest对象");
								return;
							}
							xmlhttp.open("GET", "<%=base %>/CheckOfUserLogin?username="
									+ username + "&password=" + password, true);
							xmlhttp.onreadystatechange = function() {
								if (xmlhttp.readyState == 4) {
									if (xmlhttp.status == 200) {
										if (xmlhttp.responseText) {
											//alert(xmlhttp.responseText);
											addNodePswOk();
											$('#myModal').modal('hide');
											$("#login-register-bar").load("<%=base %>/index_user.jsp");
											//location.reload();
										} else {
											addNodePswRemove();
											$("#modal-email").focus();
										}
									} else {
										alert(xmlhttp.status);
									}
								}
							}
							xmlhttp.send(null);
						}
						/* 此为验证 模态框内的用户名是否存在*/
						function checkModalEmail() {
							var xmlhttp = null;
							var username = $("#modal-email").val().trim();
							if (window.XMLHttpRequest) {
								xmlhttp = new XMLHttpRequest();
							} else if (window.XMLHttpRequest) {
								xmlhttp = new ActiveXObject();
							}
							if (xmlhttp == null) {
								alert("无法创建XMLHttpRequest对象");
								return;
							}
							xmlhttp.open("GET",
									"<%=base %>/CheckUsernameIshave?username="
											+ username, true);
							xmlhttp.onreadystatechange = function() {
								if (xmlhttp.readyState == 4) {
									if (xmlhttp.status == 200) {
										if (xmlhttp.responseText) {
											//alert(xmlhttp.responseText);
											addNodeOk();
										} else {
											addNodeRemove();
										}
									} else {
										alert(xmlhttp.status);
									}
								}
							}
							xmlhttp.send(null);
						}
						/*此函數用于模态框内提示email是否正確*/
						function addNodeOk() {
							$("#modal-gly-info")
									.replaceWith(
											"<span id='modal-gly-info' class='glyphicon glyphicon-ok'></span>");
						}

						function addNodeRemove() {
							$("#modal-gly-info")
									.replaceWith(
											"<span id='modal-gly-info' class='glyphicon glyphicon-remove'></span>");
						}
						/*此函數用于模态框内提示password是否正確*/
						function addNodePswOk() {
							/* $("#modal-gly-password-info").removeClass("glyphicon-remove").addClass("glyphicon-ok"); */
							$("#modal-gly-password-info")
									.replaceWith(
											"<span id='modal-gly-password-info' class='glyphicon glyphicon-ok'></span>");
						}

						function addNodePswRemove() {
							$("#modal-gly-password-info")
									.replaceWith(
											"<span id='modal-gly-password-info' class='glyphicon glyphicon-remove'></span>");
						}
						/* 此为模态框成功登陆后做的操作 */
						function successLogin() {
							$('#myModal').modal('hide');
							//$("#login-register-bar").replaceWith("<div class='btn-group navbar-form pull-right'><button type='button' class='btn btn-default btn-large'><a href='#'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>&nbsp;&nbsp;用户名</a></button><button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'><span class='caret'></span><span class='sr-only'>Toggle Dropdown</span></button><ul class='dropdown-menu' role='menu'><li><a href='#'>个人中心</a></li><li><a href='#'>我的项目</a></li><li><a href="#'>我的消息</a></li><li class='divider'></li><li><a href='#'>登出</a></li></ul></div>");
						}
					</script>
				</div>
			</div>
		</div>
	</nav>

	 <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        	<div style="width: 80%;height: 30%;margin: 0 auto;margin-bottom: 20%;">
        		
        		<div style="width: 75%; height: 75%;margin: 0 auto; margin-bottom: 10px;">
        			<img class="img-circle" style="width: 100%; height: 100%;" src="/HealthyRoom1.0/userassets/userPhoto/img/<%=userName %>.jpg" />
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
								<li role="presentation" class="active"><a href="/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
								<li role="presentation"><a href="/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp">我的帖子</a></li>
								<li role="presentation"><a href="#addInfo" role="tab" data-toggle="tab">修改信息</a></li>
								<li role="presentation"><a href="#alterPassword" role="tab" data-toggle="tab">修改密码</a></li>
								<li role="presentation"><a  role="tab" data-toggle="tab" href="#myHealthyPlan">制定健身计划</a></li>
								   
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
        
        <div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="addInfo">
			  		<div id="accomplishUserInfo"></div>
			  </div>
			  
			  <div role="tabpanel" class="tab-pane" id="myHealth">
				<div id="myHealth"></div>
			  </div>
			  <div role="tabpanel" class="tab-pane" id="myHealthyPlan">
				<div id="myHealthyPlan"></div>
				</div>
				
			  <div role="tabpanel" class="tab-pane" id="alterSource">
				<div id="alterSource"></div>
				</div>
			  <div role="tabpanel" class="tab-pane" id="alterPassword">
			  	<div id="alterPassword">
					<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				          <h1 class="page-header" style="color: #A9A9A9;font-family: '微软雅黑';">修改密码</h1>
									<div style="width: 100%;height: 100%;">
										
										<div class="tab-content-1" style="width: 100%;height: 100%;margin: 0 auto; background-color: white;">
										<div class="form-horizontal" role="form" style="margin-left: 0px;">
											<div style="border-bottom: dashed #A9A9A9 1px;">
												<div class="form-group" style="margin-right: 0px;margin-left: -45px;padding-top: 30px;">
													<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">原始密码</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="repassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
													</div>
												</div>
											</div>
											<div style="border-bottom: dashed #A9A9A9 1px;">
												<div class="form-group" style="margin-right: 0px;margin-left: -45px;;padding-top: 15px;">
													<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">新&nbsp;密&nbsp;码&nbsp;</label>
													<div class="col-sm-10">
														<input type="password" class="form-control" id="newpassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
													</div>
												</div>
											</div>
											<div style="border-bottom: dashed #A9A9A9 1px;">
												<div class="form-group" style="margin-right: 0px;margin-left: -45px;;padding-top: 15px;">
													<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">重复密码</label>
													<div class="col-sm-10">
														<input type="password" class="form-control" id="renewpassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
													</div>
												</div>
											</div>
											<div style="margin: 50px auto;">
												<div class="form-group" style="margin: 0 auto; text-align: center;">
													<button class="btn btn-primary btn-lg btn-block" style="float: right;margin-bottom: 10px;" id="submit_btn" onclick="checkalterpassword()">提交</button>
												</div>
											</div>
										</div>
									</div>
				 	</div>
				 </div>
			  	</div>
			  </div>
		</div>
        <!-- <div id="accomplishUserInfo"></div> -->
      </div>
    </div>
	<!-- Bootstrap core JavaScript
	    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
	<script src="../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
	<div id="logindialogspan"></div>
	<div id="uploadPicture"></div>
	<script>
	
	function checkalterpassword() {

		var repassword = $("#repassword").val().trim();
		var newpassword = $("#newpassword").val().trim();
		var renewpassword = $("#renewpassword").val().trim();
//alert(repassword + "," + newpassword + "," + renewpassword);
		if(repassword != "" && newpassword != "" && renewpassword != "" && newpassword == renewpassword) {
			
			var xmlhttp = null;
			if(window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			if(xmlhttp == null) {
				alert("无法创建XMLHttpRequest对象！");
				return;
			}
			
			var url = "/HealthyRoom1.0/UpdatePassword?repassword="+repassword+"&newpassword="+newpassword+"&renewpassword="+renewpassword;
			
			xmlhttp.open("Get", url, true);
			xmlhttp.onreadystatechange = function() {
				if(xmlhttp.readyState == 4) {
					if(xmlhttp.status == 200) {
						//alert(typeof(xmlhttp.responseText));
						if(xmlhttp.responseText==="1") {
//alert(xmlhttp.responseText);
							alert("修改成功！");
							window.location.href = "/HealthyRoom1.0/pages/action.jsp";
						} else {
							alert("修改失败！");
						}
					} else {
						alert(xmlhttp.status);
					}
				} 
			};
			xmlhttp.send(null);
		}
}
	
	
	function changePhoto() {
		$("#changeModal").modal('show');
	}
	
		$(document).ready(function() {
			$("#logindialogspan").load("<%=base %>/pages/action_include/logindialog.jsp");
			$("#accomplishUserInfo").load("<%=base %>/pages/action_include/accomplishUserInfo.jsp");
			
			$("#uploadPicture").load("<%=base %>/pages/healthyforum/userUploadPicture.jsp");
			$("#myHealthyPlan").load("<%=base %>/pages/myHealthyPlan.html");
			$('#myTab a').tab('show')
		});
	</script>
</body>
</html>
