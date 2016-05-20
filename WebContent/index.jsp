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
<title>西科健身交流平台</title>

	<link href="assets/bootstrap-3.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>
	<link href="assets/bootstrap-3.3.5/docs/examples/carousel/carousel.css" rel="stylesheet">
	<link rel="shortcut icon" href="assets/img/icon1.jpg">
	<script src="assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
	<script src="assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
	<script src="assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</head>

<body style="padding-bottom: 0px;">

	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
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
					<li><a class="text-primary" href=<%=session.getAttribute("userInfo")==null?"/HealthyRoom1.0/pages/public_visit/healthyforum.jsp":"/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp" %>>荟萃论坛</a></li>
					<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp">看健身房</a></li>
					<jsp:include page="modul/barSearch.jsp" flush="true"></jsp:include>
				</ul>
				<div class="navbar-form pull-right">

					<jsp:include page="pages/user_login_external/load_login.jsp" flush="true"></jsp:include>
					<script src="pages/js/checklogin.js"></script>
				</div>

			</div>
		</div>
	</nav>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
			<li data-target="#myCarousel" data-slide-to="6"></li>
			<li data-target="#myCarousel" data-slide-to="7"></li>
			<li data-target="#myCarousel" data-slide-to="8"></li>
			<li data-target="#myCarousel" data-slide-to="9"></li>
			<li data-target="#myCarousel" data-slide-to="10"></li>
			<li data-target="#myCarousel" data-slide-to="11"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide" src="assets/img/newpicture/1.jpg"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/2.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide" src="assets/img/newpicture/3.jpg"
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/4.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/5.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/6.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/7.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/8.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/9.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="assets/img/newpicture/10.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div><div class="item">
				<img class="second-slide" src="assets/img/newpicture/11.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
					</div>
				</div>
			</div><div class="item">
				<img class="second-slide" src="assets/img/newpicture/12.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>西科梦想减肥健身行</h1>
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

	<div class="container marketing">
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
		</div>
	</div>

	<div class="jumbotitle">
		<div class="container">
			<p class="left">
			&nbsp;&nbsp;&nbsp;&nbsp;“我过去的兴趣一直在如何保持完美的身体比例上。有一次，15岁的我脱光衣服站在镜子前看自己。看着镜中裸体的自己，我发现要达到完美的身体比例，我得有一对20英寸粗的臂膀，才配得上身体的其它地方。”
			<span class="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;——阿诺德·施瓦辛格</span></p>
			
		</div>
	</div>

	<hr class="featurette-divider">

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
</body>

</html>