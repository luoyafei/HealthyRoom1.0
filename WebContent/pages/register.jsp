<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	String base = request.getContextPath();
    	
    %>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<meta name="description" content="">
		<meta name="author" content="">
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Cache" content="no-cache">
		
		<link rel="icon" href="../../favicon.ico">

		<title>用户注册</title>

		<!-- Bootstrap core CSS -->
		<link href="../assets/bootstrap-3.3.5/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
		<link href="" type="" />
		<!-- Custom styles for this template -->
		<link href="../assets/bootstrap-3.3.5/docs/examples/signin/signin.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../assets/bootstrap-3.3.5/docs/assets/js/ie-emulation-modes-warning.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			body {
				background: url("../assets/img/login/4.jpg");
			}
			
			a:hover {
				text-decoration: none;
			}
			
			i {
				font-style: normal;
			}
			
			.container {
				width: 100%;
				height: 100%;
				font-family: "微软雅黑";
			}
			
			.page-header {
				text-align: center;
				/*background-color: #000000;*/
				color: snow;
			}
			
			.main {
				width: 30%;
				margin: 4% auto 0 auto;
				padding: 10px;
				background-color: white;
				border-radius: 5px;
			}
			
			.main-login {
				padding: 10px auto;
			}
			
			.form-control {
				width: 95%;
			}
			
			.forget-password {
				float: left;
			}
			
			.register {
				float: right;
			}
			
			.other-login {
				float: left;
			}
			
			.other-detail {
				margin-bottom: 20px;
			}
			
			label {
				float: left;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="page-header">
				<h1><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;个人用户</h1>
			</div>
			<div class="main">

				<div class="other-login">
					<h5>换种方式注册</h5>
					<div class="other-detail">
						<a href="#">电话注册</a>
					</div>
				</div>

				<div class="main-login">
					<form action="<%=base %>/RegisterResult" method="post" name="form" onsubmit="return checkdata()">
						<hr />

						<div class="form-group">
							<input type="email" class="form-control" name="username" id="exampleInputEmail1" placeholder="邮箱" onblur="checkemail()">
							<div class="alert alert-danger alert-email" role="alert" style="display: none">请输入您的邮箱</div>
							<div class="alert alert-danger alert-check-email" role="alert" style="display:none;"><span class="email-error"></span></div>

						</div>

						<div class="form-group">
							<input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="密码" onblur="chechpassword()">
							<div class="alert alert-danger alert-password" role="alert" style="display: none;">请输入您的密码</div>
						</div>

						<div class="form-group">
							<input type="password" class="form-control" name="repassword" id="exampleInputPassword2" placeholder="确认密码" onblur="chechrepassword()">
							<div class="alert alert-danger alert-repassword" role="alert" style="display: none;">请核实密码与确认密码是一致的</div>
						</div>

						<div class="form-group" style="margin: 0 auto;text-align: center;padding-bottom: 15px;">
							<div class="form-group-radio">
								<input type="radio" name="role" value="1" checked="checked" />用户
								<input type="radio" name="role" value="2" />商家
							</div>
						</div>
						
						<div class="form-group">
							<div class="form-group-inputidentifycode" style="width:50%;height:100%;float:left;">
								<input type="text" class="form-control" name="InputIdentifyCode" id="InputIdentifyCode" onblur="regetIdentifyCode()">
							</div>
							<div class="form-group-identifyimg" style="width:50%; heigth:100%;float:right;" onclick="changeImg()">
								<span class="badge" id="regetIdentify">
									<img alt="" id="validateCodeImg" src="/HealthyRoom1.0/demo" style="width:120px;height:30px;">
								</span>
								<script type="text/javascript">
									function changeImg(){
	 									document.getElementById("validateCodeImg").src = "/HealthyRoom1.0/demo?"+Math.random();
									}
								</script>
							</div>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" checked="checked"> 我已阅读并同意</input>
								<a href="#">《西科梦想减肥健身行用户协议》</a>
							</label>
						</div>
						<input type="hidden" name="action" value="register" />
						<button type="submit" class="btn btn-success btn-l btn-block">确认注册</button>
					</form>
				</div>
				<div class="main-buttom">
					<div class="forget-password">
						<label>
							<i>忘记密码？点击<a href="#"><b>这里</b></a>找回</i>
						</label>
					</div>
					<div class="register">
						<b></h6>已有账户?返回首页<a onclick="history.go(-1)">马上登陆</a></b>
					</div>
					<br />
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript
	    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
		<script src="../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
		<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
		<script src="../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
	</body>
	<script>
		//<!--
		var regetIdentifyCodeResult;
		function regetIdentifyCode() {
			
			var codeContent = document.getElementById("InputIdentifyCode").value;
			
			var xmlhttp = null;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
			}
			if (xmlhttp === null) {
				alert("无法创建XMLHttpRequest对象");
				return;
			}
			
			xmlhttp.open("GET", "../CheckIdentifyCodeForAJAX?identifycode=" + codeContent, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						regetIdentifyCodeResult = xmlhttp.responseText;
					} else {
						alert(xmlhttp.status);
					}
				}
			}
			xmlhttp.send(null);
		}
		

		function checkemail() {
			var email = $("#exampleInputEmail1").val().trim();
			var alertemail = $(".alert-email");
			var checkemail = $(".alert-check-email");
			if (email === "") {
				alertemail.attr("style", "display:inline-block;");
				checkemail.attr("style", "display:none;");
			}
			//当email的输入非空时，进行ajax验证
			var xmlhttp = null;
			if (email !== "") {
				alertemail.attr("style", "display:none;");
				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
				}
				if (xmlhttp === null) {
					alert("无法创建XMLHttpRequest对象");
					return;
				}
				xmlhttp.open("GET", "../CheckUsernameForAJAX?username=" + email, true);
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4) {
						if (xmlhttp.status == 200) {
							var result = xmlhttp.responseText;
							//alert(result);
							checkemail.attr("style", "display:inline-block;");
							$(".email-error").text(result);
						} else {
							alert(xmlhttp.status);
						}
					}
				}
				xmlhttp.send(null);
			}
		}

		function chechpassword() {
			var password = $("#exampleInputPassword1").val().trim();
			if (password === "") {
				$(".alert-password").attr("style", "display:inline-block;");
			} else {
				$(".alert-password").attr("style", "display:none;");
			}
		}

		function chechrepassword() {
			var password = $("#exampleInputPassword1").val().trim();
			var repassword = $("#exampleInputPassword2").val().trim();
			if (repassword === "" || password !== repassword) {
				$(".alert-repassword").attr("style", "display:inline-block;");
			} else if (password === repassword) {
				$(".alert-repassword").attr("style", "display:none;");
			}
		}

		function checkdata() {
			var email = $("#exampleInputEmail1").val().trim();
			var password = $("#exampleInputPassword1").val().trim();
			var repassword = $("#exampleInputPassword2").val().trim();
			if (email === "" || password === "" || repassword === "") {
				alert("请您将信息填写完整");
				return false;
			} else if (password !== repassword) {
				alert("密码与确认密码必须一致！")
				return false;
			} else if (!regetIdentifyCodeResult) {
				alert("验证码不正确！");
				return false;
			} else {
				return true;
			}
		}
		
		regetIdentifyCodeResult = "";
		//-->
	</script>

</html>