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
			.col-md-4,
			.col-md-8,
			.col-md-10 {
				text-align: center;
				margin-bottom: 5%;
			}
			body {
				background: url("../../assets/img/login/324234.jpg");
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
						<li class="active"><a href="<%=base %>/index.jsp">首页</a></li>
						<li><a class="text-primary" href="#">关于我们</a></li>
						<li><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
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
							<!-- <li><a href="/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp">为我制定健身计划</a></li> -->
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

		<div class="container-fluid">
			<div class="row" style="width:60%; height:100%; margin: 0 auto;">
				<div class="tab-content">
					  <div role="tabpanel" class="tab-pane active" id="forum">
					  		<div id="healthyforum">
					  			<div style="background-color: #F5F5F5;opacity: 0.75;">
					<div style="width: 100%;height: 100%;">
					
					<%
					String itemIdStr = request.getParameter("itemId");
					int allThemeItems = UserManager.getInstance().getAllHealthyNum();//获取所有的健身房数目
					int allButtons = allThemeItems%3==0?allThemeItems/3:allThemeItems/3+1;//计算出分页的页数（此处设置每页显示5条）
					try {
						if(itemIdStr == null) {
							itemIdStr = "1";
						} else if(Integer.parseInt(itemIdStr) <= 0) {
							itemIdStr = "1";
						}
					} catch(NumberFormatException e) {
						itemIdStr = "1";
					}
					int itemId = Integer.parseInt(itemIdStr);
					if(itemId > allButtons) {
						itemId = allButtons;
					}
					//List<Theme> themes = UserManager.getInstance().getCurrentTheme(itemId-1);
					//List<PublishHealthyRoom> phrs = UserManager.getInstance().getAllPubHeaRoom();
					List<PublishHealthyRoom> phrs = UserManager.getInstance().getCurrentPubHeaRoom(itemId-1);
/* 					for(Iterator<Theme> items = themes.iterator(); items.hasNext();) {
						Theme theme = items.next();
						String username = UserManager.getInstance().getUserName(theme.getUserId());
						int contAmount = UserManager.getInstance().getTotleThemeReply(theme.getThemeId()); */
						
					for(Iterator<PublishHealthyRoom> items = phrs.iterator(); items.hasNext();) {
						PublishHealthyRoom phr = items.next();
						String username = UserManager.getInstance().getUserName(phr.getBusinessId());
						String address = phr.getGymAddress();
						String gymname = phr.getGymName();
						String tel = phr.getGymTel();
						String gymintroduce = phr.getGymIntroduce();
						String price = phr.getGymPrice();
						//int contAmount = UserManager.getInstance().getTotleThemeReply(theme.getThemeId());
					%>
					
						<div class="healthyInfo" style="width: 100%;height: 150px;margin: 20px auto;border-bottom: solid black 1px;">
				               <div class="main-left" style="float: left;">
				                   <div class="img1" style="margin-right: 10px;height: 150px;">
				                       <div style="height:80%;">
				                       		<img class="img-rounded" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"0" %>.jpg" alt="" style="width:120px;height: 100%;">
				                       		<img class="img-rounded" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"1" %>.jpg" alt="" style="width:120px;height: 100%;">
				                       		<img class="img-rounded" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"2" %>.jpg" alt="" style="width:120px;height: 100%;">
				                       </div>
				                       <div style="height:18%;margin-top: 1%;">
				                       		<span style="float:left;margin-left:10px;font-size: 18px;font-weight: bold;" class="floorhost">地址：<%=address %></span>
				                       </div>
				                   </div>
				               </div>
				               <div class="main-right" style="text-align: left;height: 180px;">
				               		<h3><a class="healthyName" href="javascript:void(0);" onclick="$('#<%=tel %>').modal('show');" style="font-weight: bolder;text-decoration: none;"><%=gymname %></a></h3>
				               		<h4 style="text-align: left;width: 100%;height: 70px;">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">简介: &nbsp;&nbsp;</span><%=gymintroduce %></h4>
				               		<h4 style="float: right;"><%=phr.getGymPublishDate() %></h4>
				               </div>
				           </div>
											           
<!-- #########################################点击健身房名称后出现的信息详情框 -->
							<div class="modal fade bs-example-modal-lg" id="<%=tel %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">健身房信息详情</h4>
										</div>
										<div class="modal-body">
										
											<div class="tab-content-1"
											style="width: 80%; height: 680px; margin: 0 auto; background-color: white;">
											<div class="form-horizontal" style="margin-left: 0px;">

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">名称</label>
														<div class="col-sm-10">
															<span style="font-size: 22px;"><%=gymname %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">地址</label>
														<div class="col-sm-10">
															<span style="font-size: 22px;"><%=address %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">资费</label>
														<div class="col-sm-10">
															<span style="font-size: 22px;"><%=price %></span>
														</div>
													</div>
												</div>
												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">联系</label>
														<div class="col-sm-10">
															<span style="font-size: 22px;"><%=tel %></span>
														</div>
													</div>
												</div>


												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group" style="padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">简介&nbsp;&nbsp;</label>
														<div class="col-sm-10">
															<span style="font-size: 21px;"><%=gymintroduce %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">图片</label>
														<div class="col-sm-10">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"0" %>.jpg" style="width:30%; height: 180px;">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"1" %>.jpg" style="width:30%; height: 180px;">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymname+"2" %>.jpg" style="width:30%; height: 180px;">
														</div>
													</div>
												</div>

											</div>
										</div>
										
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>
											           
				           
				           
					<%} %>
					
					<nav>
					  <ul class="pager">
					<%
//System.out.println(itemId);
						if(itemId == 1)//当输入为1时，将上一页按钮禁止
							out.print("<li class='disabled'><a>&larr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp?itemId=" + (itemId-1) + "'>&larr;</a></li>");
						
						
						for(int i=1; i <= allButtons; i++) {
							if(itemId == i)
								out.print("<li class='active'><a href='/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp?itemId=" + i + "'>" + i + "</a></li>");
							else
								out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp?itemId=" + i + "'>" + i + "</a></li>");
						}
//System.out.println(allButtons + "," + itemId);						
						if(itemId == allButtons)//当输入为总数时，将下一页按钮禁止
							out.print("<li class='disabled'><a>&rarr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp?itemId=" + (itemId+1) + "'>&rarr;</a></li>");
					%>
				    	<li><input type="text" style="width:30px;" id="jump" name="itemId"/></li>
				    	<li><a type="submit" onclick="submitItemId()">跳</a></li>
					    <li><a>共 <%=allButtons %> 页</a></li>
					    
					    <script>
					    	function submitItemId() {
					    		window.location.href = "/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp?itemId="+$("#jump").val().trim();
					    	}
					    </script>
					  </ul>
					</nav>
					
					</div>
				</div>
					  		</div>
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
			/* $("#jump").bind('click', function() {
	    		$(".floorhost").html("你好");
	    	}); */
	    	
	    	$(".pager a").bind('click', function() {
	    		
	    		/* $post("/HealthyRoom1.0/updateThemeItem"), {
	    			itemId : $(this).text()
	    		}, function (data, textStatus) {
	    			
	    		}; */
	    	});
	    	
			$("#logindialogspan").load("<%=base %>/pages/action_include/logindialog.jsp");
		});
		
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