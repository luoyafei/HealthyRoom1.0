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
		<title>荟萃论坛</title>
		<link href="../../assets/bootstrap-3.3.5/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
		<link href="../dashboard.css" rel="stylesheet">
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>
		<script src="../../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
		<script src="../../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
		<script src="../js/replaceImg.js"></script>
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
						<li class="active"><a class="text-primary" href=<%=session.getAttribute("userInfo")==null?"/HealthyRoom1.0/pages/public_visit/healthyforum.jsp":"/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp" %>>荟萃论坛</a></li>
						<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
						<jsp:include page="../../modul/barSearch.jsp" flush="true"></jsp:include>

					</ul>
					<div class="navbar-form pull-right">

						<jsp:include page="../../pages/user_login_external/load_login.jsp" flush="true"></jsp:include>
						<script src="../js/checklogin.js"></script>
					</div>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="tab-content">
					  <div role="tabpanel" class="tab-pane active" id="forum">
					 
					  		<div id="healthyforum">
					  			<div class="" style="background-color: #F5F5F5;width: 80%;margin: 0 auto;">
					<div style="width: 100%;height: 100%;">
					
					<%
					String itemIdStr = request.getParameter("itemId");
					String searchText = (String)session.getAttribute("searchText");
//System.out.println(searchText);
					int allThemeItems = UserManager.getInstance().getSearchThemeListSize(searchText);//获取所有的主题个数
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
					List<Theme> themes = UserManager.getInstance().getCurrentThemeInSearch(searchText, itemId-1);

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
				                       		<img class="img-thumbnail" src="/HealthyRoom1.0/userassets/userPhoto/img/<%=username %>.jpg" alt="img not found" style="width:90px;height: 80%;">
				                       </div>
				                       <div style="height:18%;margin-top: 1%;">
				                       		<span style="float:left;margin-left:10px;" class="floorhost">楼主：<%=username %></span>
				                       </div>
				                   </div>
				               </div>
				               <div class="main-right" style="text-align: center;height: 150px;">
				                   <h3><a class="healthyName" href="/HealthyRoom1.0/pages/public_visit/replyThemePage.jsp?themeId=<%=theme.getThemeId() %>" style="font-weight: bolder;text-decoration: none;"><%=theme.getTitle() %></a></h3>
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
					<%} %>
					
					
					
					<nav>
					  <ul class="pager">
					<%
//System.out.println(itemId);
						if(itemId == 1)//当输入为1时，将上一页按钮禁止
							out.print("<li class='disabled'><a>&larr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp?itemId=" + (itemId-1) + "'>&larr;</a></li>");
						
						
						for(int i=1; i <= allButtons; i++) {
							if(itemId == i)
								out.print("<li class='active'><a href='/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp?itemId=" + i + "'>" + i + "</a></li>");
							else
								out.print("<li><a href='/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp?itemId=" + i + "'>" + i + "</a></li>");
						}
//System.out.println(allButtons + "," + itemId);						
						if(itemId == allButtons)//当输入为总数时，将下一页按钮禁止
							out.print("<li class='disabled'><a>&rarr;</a></li>");
						else
							out.print("<li><a href='/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp?itemId=" + (itemId+1) + "'>&rarr;</a></li>");
					%>
				    	<li><input type="text" style="width:30px;" id="jump" name="itemId"/></li>
				    	<li><a type="submit" onclick="submitItemId()">跳</a></li>
					    <li><a>共 <%=allButtons %> 页</a></li>
					    <script>
					    	function submitItemId() {
					    		window.location.href = "/HealthyRoom1.0/pages/public_visit/searchThemeResult.jsp?itemId="+$("#jump").val().trim();
					    	}
					    </script>
					  </ul>
					</nav>
					
						<form action="<%=base %>/DealPublishTheme" method="post" onsubmit="return checkcontent()">
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
				</div>
			</div>
		</div>
		<div id="logindialogspan">
			<jsp:include page="../../pages/action_include/logindialog.jsp" flush="true"></jsp:include>
		</div>
		<script>
		function changePhoto() {
			$("#changeModal").modal('show');
		}
		
		$(document).ready(function() {
			$('#myTab a').tab('show')
		});
		
		function checkcontent() {
			
			<%
				if(session.getAttribute("userInfo") == null) {
			%>
				func();
				return false;
			<%
				} else {
			%>
				var theme = $("#theme").val().trim();
				var content= $("#content2").val().trim();
				if(theme === "" || content === "")
					return false;
				else
					return true;
			<%
				}
			%>
		}
		
		</script>
	</body>
</html>