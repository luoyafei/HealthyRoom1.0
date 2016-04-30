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
						<li class="active"><a href="<%=base %>/index.jsp">首页</a></li>
						<li><a class="text-primary" href="/HealthyRoom1.0/pages/public_visit/about_our.jsp">关于我们</a></li>
						<li><a class="text-primary" href="<%=base %>/pages/healthyforum/healthyforum.jsp">荟萃论坛</a></li>
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
			        <h4 class="modal-title" id="myModalLabel">怎样跑步不伤害海膝盖?
			        	<span><button class="btn btn-default" onclick="window.history.go(-1)" style="float: right;">点此返回</button></span>
			        </h4>
			        
			      </div>
			      <div class="modal-body">
			        
			        <div style="width: 100%;height: 100%;">
						<div id="all" >
						    <p align="justify">任何材料在长期受力的情况下都会磨损。铝合金，螺纹钢，混凝土，包括组成膝盖的骨骼，半月板，韧带和肌肉也不能例外。如果静态的来看，
						    长期对膝盖的使用会产生磨损，就像所有的材料和设备都会磨损老化一样。但是我们的身体不是静态的设备，从一出场就固定不变了。在受到外界
						    的刺激之后会相应做出变化。比如脆弱的皮肤会生出老茧。骨骼和肌肉也不例外，长期锻炼的骨骼会更致密，而肌肉也会更强壮。也就是说越多锻
						    炼膝盖的耐磨性就越高。</p>
							<img src="../../assets/img/jianshen/fa500ff3d7ca7bcb2ccf63fdbf096b63f724a80e.jpg" width="100%"  class="img-thumbnail"/>
						　　<p>但是当跑步过程中磨损和冲击力超过骨骼肌肉的能力，或是增加的强度超过骨骼肌肉的成长速度，那么就会受伤。如果肌肉和骨骼的强壮程度超
							过磨损和冲击力则不会产生伤痛。因此每次膝盖受伤后医生给的建议都是休息，一动不动；而有些有经验的跑者建议继续跑，还有一种所谓的“慢跑治
							膝伤”的说法。其实两种说法都既有道理又片面，关键在于如何控制磨损和冲击力与骨骼，肌肉成长恢复的程度.知道了这个基本原理后，避免跑步损
						    伤膝盖的办法就是减少磨损和冲击力，提高骨骼，肌肉的强度。而不是不跑步，长期不进行锻炼，肌肉骨骼会退化，骨质疏松或是轻微冲击就会造成各
						    种伤病。同时缺乏有效的有氧训练，心肺能力，抵抗力，血压等生理机能都会出现各类问题。因此决不能只是单纯的从跑步有可能造成膝关节磨损而
						    完全放弃跑步运动。任何运动在过量或是不合理训练都会造成身体伤害。选择科学的训练方式才是最好的解决方法。</p>
							<p >一：控制跑量：关于跑量的递增量有不同说法，比如每周不超过10%，或是5%。但是每个人的个体差异极大，而且跑量基数也不同，单纯用百
						    分比来控制只是一个统计学上的结果，并不非常合理。因此每次跑步时的感受非常重要。这种感觉就是肌肉和身体的疲倦程度。在跑过一段时间后，
						    都能够比原来更精确的感觉疲倦。每天的温度，身体情况，饮食情况等多种因素都会让身体出现的疲倦点不同。腿部肌肉疲倦，除了速度减慢外，很
						    重要的一点就是对步伐和落地时的控制变差。肌肉越疲倦，半月板承受的冲击力越大，当超出了其的缓冲范围就会伤害到股骨头。而半月板和股骨头的
						    很多损伤是不可修复的。对有经验的跑者来说，在跑量递增的赛前时期，先要感知一下跑与上周同样的跑量是否更轻松，如果是的话，在超出的跑量部分
						    任意点感到无法控制跑姿时都应该停下来。如果并不感觉比上周更轻松，则不要选择增加跑量。在连续增加跑量或是高强度训练进行3-4周后，要设计1周的
						    间隔周，将跑量减至最高峰的70%左右，进行充分的恢复和休息。之后再继续增加跑量和训练强度。　而对于新手来说，双周增加一次跑量更为合理。
						    相当于一周提高，一周巩固成果。而增加量不必限制刻意的比例。关注身体，跑到觉得落地变重，或是膝部感觉有压力时马上停下来。</p>
						　　<p>二：减少速度训练：同等跑量的情况下，更高的速度意味着更大的冲击力，对膝盖伤害的可能更大。同时更高的速度，跑姿就会变形，为了拉大步伐，
						提高速度。不自觉的腿部在落地时没有任何弯曲，丧失了通过关节弯曲时的肌肉缓冲能力，而将冲击力直接传给了膝盖。这也是很多初跑者在跑步的前2个月，
						跑量很少的情况下受伤的原因。跑量虽然只有每天2，3km。但是急速尽自己的全力猛跑，在肌肉保护还不够强大的时候巨大的冲击力将膝盖弄伤了。
						 对于长跑和耐力跑来说，即使一个有经验的跑者，速度训练量一般也不会超过总训练量的10%。而且每周一般只有一次的间歇速度训练。而初跑者根本不
						 用安排速度训练。甚至可以开玩笑的认为在马拉松成绩3小时30以外的跑者都无需进行速度训练。只要合理的累积训练量，安排好休息成绩就会稳步提高。</p>
						　　<p> 三：调整跑步姿势：跑步姿态对膝盖的冲击在NHK的纪录片《马拉松军团》中已经有详尽的描述。合理的控制跑姿能够让帕特里克.马
						考（马拉松世界记录保持者）比日本的顶级马拉松选手减少25%以上的膝盖冲击力。虽然普通人无法做到马考那种惊人协调的跑姿
						。但是普通跑者几个对膝盖损伤最大的姿势如下： 首先是脚落地的位置在膝盖的前边，造成膝关节伸直，甚至锁死（在每次站起
						的时候，能发现膝关节在最后的阶段仿佛卡起来了，这是个自然机制，为了增加站立的稳定性）。此时有相当向前的力量都通过地
						面反馈，冲击到膝关节。所以，在落地的时候控制脚踝的位置尽可能在膝盖的正下方，或是略偏后一点。膝盖处的弯曲将起到极好的缓冲作用。<p>
						　　<p>其次是脚部落地点尽可能控制在前脚掌，尤其是重心最好落在正对大脚趾和二脚趾之间的前脚掌位置。这个重力位
						置为腿部合理排列的受力点。受力点无论是更靠脚的外侧，内侧还是后部都会造成对膝盖侧向的冲击力，导致受伤。
						 还有就是控制身体的稳定，不要左右摇晃。因为左右摇晃会让重心位置在侧向不断改变，给膝盖侧向冲击力。而膝
						 盖正面承受体重的能力最强。因此在跑步过程中不要过度摆臂，过度向前跨步，因为这些都会造成身体不稳定性的增加。</p>
									    
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




		<!-- <div class="container-fluid">
			<div class="row" style="width:60%; height:100%; margin: 0 auto;">
				<div class="tab-content">
					  <div role="tabpanel" class="tab-pane active" id="forum">
					  		<div id="healthyforum">
					  			<div style="background-color: #F5F5F5;opacity: 0.75;">
									<div style="width: 100%;height: 100%;">
										
									<div id="all" >
										<h1><b><center>怎样跑步不上膝盖?</center></b></h1>
									    <hr />
									    <p align="justify">任何材料在长期受力的情况下都会磨损。铝合金，螺纹钢，混凝土，包括组成膝盖的骨骼，半月板，韧带和肌肉也不能例外。如果静态的来看，
									    长期对膝盖的使用会产生磨损，就像所有的材料和设备都会磨损老化一样。但是我们的身体不是静态的设备，从一出场就固定不变了。在受到外界
									    的刺激之后会相应做出变化。比如脆弱的皮肤会生出老茧。骨骼和肌肉也不例外，长期锻炼的骨骼会更致密，而肌肉也会更强壮。也就是说越多锻
									    炼膝盖的耐磨性就越高。</p>
										<img src="../../assets/img/jianshen/fa500ff3d7ca7bcb2ccf63fdbf096b63f724a80e.jpg" width="100%" height="502px" align="center"/>
									　　<p>但是当跑步过程中磨损和冲击力超过骨骼肌肉的能力，或是增加的强度超过骨骼肌肉的成长速度，那么就会受伤。如果肌肉和骨骼的强壮程度超
										过磨损和冲击力则不会产生伤痛。因此每次膝盖受伤后医生给的建议都是休息，一动不动；而有些有经验的跑者建议继续跑，还有一种所谓的“慢跑治
										膝伤”的说法。其实两种说法都既有道理又片面，关键在于如何控制磨损和冲击力与骨骼，肌肉成长恢复的程度.知道了这个基本原理后，避免跑步损
									    伤膝盖的办法就是减少磨损和冲击力，提高骨骼，肌肉的强度。而不是不跑步，长期不进行锻炼，肌肉骨骼会退化，骨质疏松或是轻微冲击就会造成各
									    种伤病。同时缺乏有效的有氧训练，心肺能力，抵抗力，血压等生理机能都会出现各类问题。因此决不能只是单纯的从跑步有可能造成膝关节磨损而
									    完全放弃跑步运动。任何运动在过量或是不合理训练都会造成身体伤害。选择科学的训练方式才是最好的解决方法。</p>
										<p >一：控制跑量：关于跑量的递增量有不同说法，比如每周不超过10%，或是5%。但是每个人的个体差异极大，而且跑量基数也不同，单纯用百
									    分比来控制只是一个统计学上的结果，并不非常合理。因此每次跑步时的感受非常重要。这种感觉就是肌肉和身体的疲倦程度。在跑过一段时间后，
									    都能够比原来更精确的感觉疲倦。每天的温度，身体情况，饮食情况等多种因素都会让身体出现的疲倦点不同。腿部肌肉疲倦，除了速度减慢外，很
									    重要的一点就是对步伐和落地时的控制变差。肌肉越疲倦，半月板承受的冲击力越大，当超出了其的缓冲范围就会伤害到股骨头。而半月板和股骨头的
									    很多损伤是不可修复的。对有经验的跑者来说，在跑量递增的赛前时期，先要感知一下跑与上周同样的跑量是否更轻松，如果是的话，在超出的跑量部分
									    任意点感到无法控制跑姿时都应该停下来。如果并不感觉比上周更轻松，则不要选择增加跑量。在连续增加跑量或是高强度训练进行3-4周后，要设计1周的
									    间隔周，将跑量减至最高峰的70%左右，进行充分的恢复和休息。之后再继续增加跑量和训练强度。　而对于新手来说，双周增加一次跑量更为合理。
									    相当于一周提高，一周巩固成果。而增加量不必限制刻意的比例。关注身体，跑到觉得落地变重，或是膝部感觉有压力时马上停下来。</p>
									　　<p>二：减少速度训练：同等跑量的情况下，更高的速度意味着更大的冲击力，对膝盖伤害的可能更大。同时更高的速度，跑姿就会变形，为了拉大步伐，
									提高速度。不自觉的腿部在落地时没有任何弯曲，丧失了通过关节弯曲时的肌肉缓冲能力，而将冲击力直接传给了膝盖。这也是很多初跑者在跑步的前2个月，
									跑量很少的情况下受伤的原因。跑量虽然只有每天2，3km。但是急速尽自己的全力猛跑，在肌肉保护还不够强大的时候巨大的冲击力将膝盖弄伤了。
									 对于长跑和耐力跑来说，即使一个有经验的跑者，速度训练量一般也不会超过总训练量的10%。而且每周一般只有一次的间歇速度训练。而初跑者根本不
									 用安排速度训练。甚至可以开玩笑的认为在马拉松成绩3小时30以外的跑者都无需进行速度训练。只要合理的累积训练量，安排好休息成绩就会稳步提高。</p>
									　　<p> 三：调整跑步姿势：跑步姿态对膝盖的冲击在NHK的纪录片《马拉松军团》中已经有详尽的描述。合理的控制跑姿能够让帕特里克.马
									考（马拉松世界记录保持者）比日本的顶级马拉松选手减少25%以上的膝盖冲击力。虽然普通人无法做到马考那种惊人协调的跑姿
									。但是普通跑者几个对膝盖损伤最大的姿势如下： 首先是脚落地的位置在膝盖的前边，造成膝关节伸直，甚至锁死（在每次站起
									的时候，能发现膝关节在最后的阶段仿佛卡起来了，这是个自然机制，为了增加站立的稳定性）。此时有相当向前的力量都通过地
									面反馈，冲击到膝关节。所以，在落地的时候控制脚踝的位置尽可能在膝盖的正下方，或是略偏后一点。膝盖处的弯曲将起到极好的缓冲作用。<p>
									　　<p>其次是脚部落地点尽可能控制在前脚掌，尤其是重心最好落在正对大脚趾和二脚趾之间的前脚掌位置。这个重力位
									置为腿部合理排列的受力点。受力点无论是更靠脚的外侧，内侧还是后部都会造成对膝盖侧向的冲击力，导致受伤。
									 还有就是控制身体的稳定，不要左右摇晃。因为左右摇晃会让重心位置在侧向不断改变，给膝盖侧向冲击力。而膝
									 盖正面承受体重的能力最强。因此在跑步过程中不要过度摆臂，过度向前跨步，因为这些都会造成身体不稳定性的增加。</p>
									    
									</div>

									
									</div>
								</div>
					  		</div>
					  </div>
				</div>
			</div>
		</div> -->

		<!-- Bootstrap core JavaScript
	    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="../../assets/jQuery/2.x/jquery-2.1.4.min.js"></script>
		<script src="../../assets/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
		<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/vendor/holder.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="../../assets/bootstrap-3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
		<div id="logindialogspan">
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