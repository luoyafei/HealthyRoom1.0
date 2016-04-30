<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.xust.bean.*,com.xust.DAO.*"%>

<%!int userId;
	String userName;%>

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

<title>荟萃论坛</title>

	<!-- Bootstrap core JavaScript
	    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
	<script src="../../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="../../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="../../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
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
.col-md-4, .col-md-8, .col-md-10 {
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
					<li class="active"><a href="<%=base%>/index.jsp">首页</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/about_our.jsp">关于我们</a></li>
					<li><a class="text-primary"
						href="<%=base%>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
					<jsp:include page="../../modul/barSearch.jsp" flush="true"></jsp:include>

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
						<a class="btn btn-default" href="<%=base%>/pages/register.jsp">注册</a>
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
				<div
					style="width: 80%; height: 30%; margin: 0 auto; margin-bottom: 20%;">

					<div
						style="width: 75%; height: 75%; margin: 0 auto; margin-bottom: 10px;">
						<img class="img-thumbnail" id="userpicture"
							style="width: 100%; height: 100%;" alt=""
							src="/HealthyRoom1.0/userassets/userPhoto/img/<%=userName%>.jpg" />
					</div>
					<div class="form-group" style="width: 100%; height: 40%;">
						<div style="width: 100%; height: 100%; text-align: center;">
							<button type="button" class="btn btn-primary" id="changePicture"
								onclick="changePhoto()">更换头像</button>

						</div>
					</div>
				</div>

				<div
					style="width: 100%; height: 50%; margin: 0 auto; text-align: center;">

					<div
						style="width: 100%; height: 50%; margin: 0 auto; text-align: center;">
						<div class="btn-group-vertical" role="group" aria-label="...">
							<ul class="nav" role="tablist">
								<li role="presentation" class="active"><a href="/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
								  <li role="presentation"><a href="/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp">我的帖子</a></li>
									<li role="presentation"><a href="/HealthyRoom1.0/pages/action.jsp">修改信息</a></li>
									<li role="presentation"><a href="/HealthyRoom1.0/pages/action.jsp">修改密码</a></li>
							      	<li role="presentation"><a href="/HealthyRoom1.0/pages/action.jsp">制定健身计划</a></li>
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
			</div>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="forum">
				<%!
					boolean isPublish = false;
				%>
				<%
					User u = (User)session.getAttribute("userInfo");
					int businessId = u.getUserId(); 
					PublishHealthyRoom gymInfo = UserManager.getInstance().getPublishInfo(businessId);
//System.out.println(gymInfo.getGymId());
					if(gymInfo != null && gymInfo.getGymId() != 0)
						isPublish = true;
				%>


					<div id="healthyforum">
						<div
							class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background-color: #F5F5F5;">
							<div style="width: 100%; height: 100%;margin-top: 30px;">
								<div class="marketing-nav">
									<ul class="nav nav-tabs marketing-nav-content" role="tablist" id="myTab">
										<li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" style="color: #398BE5;">健身房信息发布</a></li>
										<li role="presentation" class=""><a href="#profile" role="tab" data-toggle="tab" style="color: black;">健身房信息修改</a></li>
									</ul>
								</div>

								<div class="tab-content"
									style="background-color: white; border-bottom: solid #A9A9A9 2px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">



<!--##############################################此为发布健身房信息-->
									<div role="tabpanel" class="tab-pane active" id="home">
										<div class="form-horizontal" role="form">
											<div class="tab-content-1"
												style="width: 80%; height: 780px; margin: 0 auto; background-color: white;">
												
												<form action="/HealthyRoom1.0/DealBusinessPublishGymInfo" method="post" class="form-horizontal" role="form" style="margin-left: 0px;" enctype="multipart/form-data" onsubmit="<!-- checkcontent ()-->">
													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group"
															style="margin-right: 0px; padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">健身房名称</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" name="gymName"
																	style="background-color: #F5F5F5;" placeholder="健身房名称">
															</div>
														</div>
													</div>

													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group"
															style="margin-right: 0px; padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">健身房地址</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" name="gymAddr"
																	style="background-color: #F5F5F5;" placeholder="健身房地址">
															</div>
														</div>
													</div>

													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group"
															style="margin-right: 0px; padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">资费描述</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" name="gymPrice"
																	style="background-color: #F5F5F5;" placeholder="资费描述">
															</div>
														</div>
													</div>
													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group"
															style="margin-right: 0px; padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">联系方式</label>
															<div class="col-sm-10">
																<input type="tel" class="form-control" name="gymTel" style="background-color: #F5F5F5;" placeholder="联系方式">
															</div>
														</div>
													</div>


													<script>
												//此处是使用KE在线编辑器
												KE.show({
													id: 'healthyRoomIntroduce',
													resizeMode: 1,
													allowPreviewEmoticons: false,
													allowUpload: false,
													items: [
														'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
														'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
														'insertunorderedlist', '|', 'emoticons', 'image', 'link'
													]
												});
											</script>

													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group" style="padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">健身房简介&nbsp;&nbsp;</label>
															<div class="col-sm-10">
																<textarea id="healthyRoomIntroduce" name="gymIntroduce" style="width: 100%; height: 200px; visibility: hidden;"></textarea>
															</div>
														</div>
													</div>

													<div style="border-bottom: dashed #A9A9A9 1px;">
														<div class="form-group"
															style="margin-right: 0px; padding-top: 15px;">
															<label for="create-project-name1"
																class="col-sm-2 control-label"
																style="font-size: 18px; font-weight: normal;">健身房图片</label>
															<div class="col-sm-10">
																<input type="file" style="display: inline;width: 30%;" class="file1" name="file1" accept="image/*"></input>
																<input type="file" style="display: inline;width: 30%;" class="file2" name="file2" accept="image/*"></input> 
																<input type="file" style="display: inline;width: 30%;" class="file2" name="file3" accept="image/*"></input>
															</div>
														</div>
													</div>

													<div style="margin: 50px auto;">
														<div class="form-group"
															style="margin: 0 auto; text-align: center;">
															<%=isPublish?"":"<button type='submit' class='btn btn-default' style='border: solid #A9A9A9 2px; border-radius: 10px;'>确认发布</button>" %>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
<script type="text/javascript">
	function checkcontent() {
		var file1 = $(".file1");
		alert(file1);
		return false;
	}
</script>




<!--##############################################此为修改管理发布的健身房信息-->
									<div role="tabpanel" class="tab-pane" id="profile">

										<div class="tab-content-1"
											style="width: 80%; height: 780px; margin: 0 auto; background-color: white;">
											<div class="form-horizontal" role="form" style="margin-left: 0px;">

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">健身房名称</label>
														<div class="col-sm-10">
															<span style="background-color: #F5F5F5;"><%=gymInfo.getGymName() %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">健身房地址</label>
														<div class="col-sm-10">
															<span style="background-color: #F5F5F5;"><%=gymInfo.getGymAddress() %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">资费描述</label>
														<div class="col-sm-10">
															<span style="background-color: #F5F5F5;"><%=gymInfo.getGymPrice() %></span>
														</div>
													</div>
												</div>
												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">联系方式</label>
														<div class="col-sm-10">
															<span style="background-color: #F5F5F5;"><%=gymInfo.getGymTel() %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group" style="padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">健身房简介&nbsp;&nbsp;</label>
														<div class="col-sm-10">
															<span style="background-color: #F5F5F5;"><%=gymInfo.getGymIntroduce() %></span>
														</div>
													</div>
												</div>

												<div style="border-bottom: dashed #A9A9A9 1px;">
													<div class="form-group"
														style="margin-right: 0px; padding-top: 15px;">
														<label for="create-project-name1"
															class="col-sm-2 control-label"
															style="font-size: 18px; font-weight: normal;">健身房图片</label>
														<div class="col-sm-10">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymInfo.getGymName()+"0" %>.jpg" style="width:30%; height: 200px;">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymInfo.getGymName()+"1" %>.jpg" style="width:30%; height: 200px;">
															<img alt="" src="/HealthyRoom1.0/business_healthyroomUp/img/<%=gymInfo.getGymName()+"2" %>.jpg" style="width:30%; height: 200px;">
														</div>
													</div>
												</div>

												<div style="margin: 50px auto;">
														<div class="form-group"
															style="margin: 0 auto; text-align: center;">
															
															<%=isPublish?"<button id='delete_pub' class='btn btn-default' style='border: solid #A9A9A9 2px; border-radius: 10px;color: black;'>点击删除</button>":"" %>
														</div>
												</div>
												<script>
													$(document).ready(function() {
														
														$("#delete_pub").bind('click', function() {
															$('#delete_dialog').modal('show');	
														});
														$("#sure_delete").bind('click', function() {
															
															$.get("/HealthyRoom1.0/DeletePublishGym?t="+Math.random(), {},function(data, textStatus) {
																var status = data.status;
																//alert(status);
																if(status == "1") {
																	alert("删除成功！");
																	$('#delete_dialog').modal('hide');
																	window.location.href="/HealthyRoom1.0/pages/business_authority/business_pulish_healthyroom_page.jsp";
																} else {
																	alert("删除失败！");	
																	$('#delete_dialog').modal('hide');	
																}
															},"json");
														});
													});
												</script>
													
													<div class="modal fade  bs-example-modal-sm" id="delete_dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
													  <div class="modal-dialog modal-sm">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
													        <h4 class="modal-title" id="myModalLabel">提示！</h4>
													      </div>
													      <div class="modal-body alert alert-warning" role="alert">
													        	您确定现在想要删除您发布的该健身房信息吗？
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
													        <button type="button" id="sure_delete" class="btn btn-danger">确定</button>
													      </div>
													    </div>
													  </div>
													</div>
													
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="addInfo">
					<div id="accomplishUserInfo"></div>
				</div>
				<div role="tabpanel" class="tab-pane" id="myHealth">
					<div id="spanmyHealth"></div>
				</div>
				<div role="tabpanel" class="tab-pane" id="myFocus">
					<div id="spanmyFocus"></div>
				</div>
				<div role="tabpanel" class="tab-pane" id="myReply">
					<div id="spanmyReply"></div>
				</div>

				<div role="tabpanel" class="tab-pane" id="alterSource">
					<div id="spanalterSource"></div>
				</div>
				<div role="tabpanel" class="tab-pane" id="alterPassword">
					<div id="spanalterPassword"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="logindialogspan"></div>
	<div id="uploadPicture"></div>
	<script>
		
		$('#myTab a').click(function(e) {
			//e.preventDefault()
			$(this).tab('show')
		})
		
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
	    	
			$("#logindialogspan").load("<%=base%>/pages/action_include/logindialog.jsp");
			$("#accomplishUserInfo").load("<%=base%>/pages/action_include/accomplishUserInfo.jsp");
			$("#spanalterPassword").load("<%=base%>/pages/action_include/alterpassword.html");
			$("#uploadPicture").load("<%=base%>/pages/healthyforum/userUploadPicture.jsp");
		});
							
	</script>
</body>
</html>