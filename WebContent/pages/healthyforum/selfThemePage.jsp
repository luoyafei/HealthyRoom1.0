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

		<title>荟萃论坛</title>

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
		</style>
		
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
						<li><a href="<%=base %>/index.jsp">首页</a></li>
						<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/about_our.jsp">关于我们</a></li>
						<li class="active"><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
						<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
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
							
							List<Theme> themes = UserManager.getInstance().getAllTheme(userId);
							
							if(themes.size() == 0) {
								response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
System.out.println("该用户尚未发出任何主题帖！");
								return;
							}
							
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

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<div style="width: 80%;height: 30%;margin: 0 auto;margin-bottom: 20%;">

						<div style="width: 75%; height: 75%;margin: 0 auto; margin-bottom: 10px;">
							<img class="img-thumbnail" id="userpicture" style="width: 100%; height: 100%;" alt="" src="/HealthyRoom1.0/userassets/userPhoto/img/<%=userName %>.jpg" />
						</div>
						<div class="form-group" style="width: 100%;height: 40%;">
							<div style="width: 100%;height: 100%;text-align: center;">
								<button type="button" class="btn btn-primary" id="changePicture" onclick="changePhoto()">更换头像</button>
								
							</div>
						</div>
					</div>

					<div style="width: 100%;height: 50%;margin: 0 auto;text-align: center;">

						<div style="width: 100%;height: 50%;margin: 0 auto;text-align: center;">
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
					 
					  		<div id="healthyforum">
					  			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background-color: #F5F5F5;">
					<div style="width: 100%;height: 100%;">
					
					<%
					String itemIdStr = request.getParameter("itemId");
					List<Theme> selfAllThemes = UserManager.getInstance().getAllTheme(userId);
						
					int allThemeItems = selfAllThemes.size();//获取该用户所有的主题
					int allButtons = allThemeItems%5==0?allThemeItems/5:allThemeItems/5+1;//计算出分页的页数（此处设置每页显示5条）
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
					List<Theme> themes = UserManager.getInstance().getCurrentTheme(userId, itemId-1);
					
					/* themes = UserManager.getInstance().getAllTheme(); */
					/* List<Theme> themes = UserManager.getInstance().getCurrentTheme(int itemId); */
					for(Iterator<Theme> items = themes.iterator(); items.hasNext();) {
						Theme theme = items.next();
						String username = UserManager.getInstance().getUserName(theme.getUserId());
						int contAmount = UserManager.getInstance().getTotleThemeReply(theme.getThemeId());
					%>
					
						<div class="healthyInfo" style="width: 100%;height: 150px;margin: 20px auto;border-bottom: solid black 1px;">
				               <div class="main-left" style="float: left;">
				                   <div class="img1" style="margin-right: 10px;height: 150px;">
				                        <div style="height:80%;">
				                       		<img class="img-thumbnail" src="/HealthyRoom1.0/userassets/userPhoto/img/<%=username %>.jpg" alt="" style="width:90px;height: 80%;">
				                       </div>
				                       <div style="height:18%;margin-top: 1%;">
				                       		<span style="float:left;margin-left:10px;" class="floorhost">楼主：<%=username %></span>
				                       </div>
				                   </div>
				               </div>
				               <div class="main-right" style="text-align: center;height: 150px;">
				                   <h3><a class="healthyName" href="<%=base %>/pages/healthyforum/replyThemePage.jsp?themeId=<%=theme.getThemeId() %>" style="font-weight: bolder;text-decoration: none;"><%=theme.getTitle() %></a></h3>
				                   <p><%=theme.getCont() %></p>
				                   <h5 style="float:right;margin-right:10px;">回复数：<%=contAmount %>&nbsp;
				                   		<%
				                   			if(userId == theme.getUserId()) {
				                   				out.print("<a href=" + base + "/DeleteTheme?themeId=" + theme.getThemeId() + ">删除</a>");
				                   			}
				                   		%>
				                   </h5>
				               </div>
				           </div>
					<%
					}
					%>
					
					
					
					<nav>
					  <ul class="pager">
					<%
//System.out.println(itemId);
						if(itemId == 1)//当输入为1时，将上一页按钮禁止
							out.print("<li class='disabled'><a>&larr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp?itemId=" + (itemId-1) + "'>&larr;</a></li>");
						
						
						for(int i=1; i <= allButtons; i++) {
							if(itemId == i)
								out.print("<li class='active'><a href='/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp?itemId=" + i + "'>" + i + "</a></li>");
							else
								out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp?itemId=" + i + "'>" + i + "</a></li>");
						}
//System.out.println(allButtons + "," + itemId);						
						if(itemId == allButtons)//当输入为总数时，将下一页按钮禁止
							out.print("<li class='disabled'><a>&rarr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp?itemId=" + (itemId+1) + "'>&rarr;</a></li>");
					%>
				    	<li><input type="text" style="width:30px;" id="jump" name="itemId"/></li>
				    	<li><a type="submit" onclick="submitItemId()">跳</a></li>
					    <li><a>共 <%=allButtons %> 页</a></li>
					    <script>
					    	function submitItemId() {
					    		window.location.href = "/HealthyRoom1.0/pages/healthyforum/selfThemePage.jsp?itemId="+$("#jump").val().trim();
					    	}
					    </script>
					  </ul>
					</nav>
					
						<form action="<%=base %>/DealPublishTheme" method="post" onsubmit="checkcontent()">
							<div style="width: 100%;height: 100%;margin: 0 auto;">
								<div class="input-group" style="width: 100%;height: 20%;">
									<span class="input-group-addon">发表主题&nbsp;<span class="glyphicon glyphicon-pencil"></span></span>
									<input type="text" class="form-control" placeholder="请输入您想发表的主题......" name="theme" id="theme" />
								</div>
								 <script charset="utf-8" src="../../assets/ke/kindeditor.js"></script>
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
								<div class="input-group" style="width: 100%;height: 70%;">
									<textarea id="content2" name="content" style="width:100%;height:200px;visibility:hidden;"></textarea>
								</div>
								<div class="form-group" style="width: 100%;height: 10%;">
									<button class="btn btn-info btn-lg btn-block" type="submit">确认发布主题</button>
								</div>
							</div>
						</form>
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
			$("#accomplishUserInfo").load("<%=base %>/pages/action_include/accomplishUserInfo.jsp");
			$("#spanalterPassword").load("<%=base %>/pages/action_include/alterpassword.jsp");
			$("#uploadPicture").load("<%=base %>/pages/healthyforum/userUploadPicture.jsp");
			$('#myTab a').tab('show')
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