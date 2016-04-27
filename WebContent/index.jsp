<%@page import="com.xust.DAO.UserManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.xust.bean.*"%>
<%@ page import="java.util.*" %>
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
<link rel="icon" href="../../favicon.ico">

<title>西科健身交流平台</title>

<!-- Bootstrap core CSS -->
<link href="assets/bootstrap-3.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="./js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="./js/html5shiv.min.js"></script>
      <script src="./js/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="assets/bootstrap-3.3.5/docs/examples/carousel/carousel.css"
	rel="stylesheet">

<link rel="shortcut icon" href="assets/img/icon1.jpg">
</head>
<!-- NAVBAR
================================================== -->

<body style="padding-bottom: 0px;">

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
					<li class="active"><a href="/HealthyRoom1.0/index.jsp">首页</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/about_our.jsp">关于我们</a></li>
					<li><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">快速搜索</button>
					</form>

				</ul>
				<div class="navbar-form pull-right">

					<jsp:include page="pages/user_login_external/load_login.jsp" flush="true"></jsp:include>
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
							xmlhttp.open("GET", "CheckOfUserLogin?username="
									+ username + "&password=" + password, true);
							xmlhttp.onreadystatechange = function() {
								if (xmlhttp.readyState == 4) {
									if (xmlhttp.status == 200) {
										if (xmlhttp.responseText) {
											//alert(xmlhttp.responseText);
											addNodePswOk();
											$('#myModal').modal('hide');
											$("#login-register-bar").load(
													"index_user.jsp");
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
							xmlhttp.open("POST",
									"/HealthyRoom1.0/CheckUsernameIshave?username="
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

				<!-- Split button -->
				<!--					<div class="btn-group navbar-form pull-right">
						<button type="button" class="btn btn-default btn-large"><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;用户名</a></button>
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">个人中心</a></li>
							<li><a href="#">我的项目</a></li>
							<li><a href="#">我的消息</a></li>
							<li class="divider"></li>
							<li><a href="#">登出</a></li>
						</ul>
					</div>
				
				<!--/.nav-collapse -->
			</div>
		</div>
	</nav>

	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide" src="assets/img/newpicture/1.jpg"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
<!-- 						<p>
							<a class="btn btn-lg btn-primary" href="#" role="button">查看更多</a>
						</p>
 -->					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/2.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
						<!-- <p>
							<a class="btn btn-lg btn-primary" href="#" role="button">查看更多</a>
						</p> -->
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide" src="assets/img/newpicture/3.jpg"
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
						<!-- <p>
							<a class="btn btn-lg btn-primary" href="#" role="button">查看更多</a>
						</p> -->
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->

	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">
		<!-- Three columns of text below the carousel -->
		<div class="thumbtitle">
			<h1>健身技巧快速学习</h1>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<a href="/HealthyRoom1.0/pages/public_visit/showDetail001.jsp">
					<img class="img-thumbnail" src="assets/img/jianshen/a14e5abegw1exw8h22yxqg20c80c8kjl.gif"
					alt="Generic placeholder image" style="width: 320px;height: 220px;">
				</a>
				<h2>收腹练习图文教程</h2>
				<p>
					<a class="btn btn-default" href="/HealthyRoom1.0/pages/public_visit/showDetail001.jsp" role="button">查看详细 &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<a href="/HealthyRoom1.0/pages/public_visit/showDetail002.jsp">
					<img class="img-thumbnail" src="assets/img/jianshen/a14e5abegw1exqgot5pnog208c05kwjq.gif"
						alt="Generic placeholder image" style="width: 320px;height: 220px;">
				</a>
				<h2>马甲线详细实训</h2>
				<p>
					<a class="btn btn-default" href="/HealthyRoom1.0/pages/public_visit/showDetail002.jsp" role="button">查看详细 &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<a href="/HealthyRoom1.0/pages/public_visit/showDetail003.jsp">
					<img class="img-thumbnail" src="assets/img/jianshen/fa500ff3d7ca7bcb2ccf63fdbf096b63f724a80e.jpg"
						alt="Generic placeholder image" style="width: 320px;height: 220px;">
				</a>
				<h2>图文剖析身体健康</h2>
				<p>
					<a class="btn btn-default" href="/HealthyRoom1.0/pages/public_visit/showDetail003.jsp" role="button">查看详细 &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->
	</div>

	<div class="jumbotitle">
		<div class="container">
			<p class="left">
			&nbsp;&nbsp;&nbsp;&nbsp;“我过去的兴趣一直在如何保持完美的身体比例上。有一次，15岁的我脱光衣服站在镜子前看自己。看着镜中裸体的自己，我发现要达到完美的身体比例，我得有一对20英寸粗的臂膀，才配得上身体的其它地方。”
			<span class="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;——阿诺德·施瓦辛格</span></p>
			
		</div>
	</div>

	<!-- /.container -->

	<hr class="featurette-divider">

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

	<!-- 点击登陆出现的登陆框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请登录</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="email" class="form-control" id="modal-email"
									placeholder="Email" onblur="checkModalEmail()">
							</div>
							<div class="modal-errorInfo">
								<span id="modal-gly-info" class="glyphicon"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="modal-password"
									placeholder="Password">
							</div>
							<div class="modal-errorInfo">
								<span id="modal-gly-password-info" class="glyphicon"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-default" id="modal-submit"
						onclick="checkModalData()">登陆</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
	<script src="assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>