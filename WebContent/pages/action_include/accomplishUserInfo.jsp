<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.xust.bean.*" %>
<%
	String base = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<%
	UserDetailInfo userDetailInfo = (UserDetailInfo)session.getAttribute("userDetailInfo");
	
%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="">
          <h1 class="page-header" style="color: snow;font-family: '微软雅黑';">請完善您的基本信息</h1>
					<div style="width: 100%;height: 100%;">
						
						<div style="width: 100%;height: 100%;margin: 0 auto;">
						<form action="<%=base+"/AccomplishUserInfo" %>" method="post">	
							
						<div class="row">
						  <div class="col-md-4">
								<div class="btn-group" data-toggle="buttons">
							   <label class="btn btn-default">
							      <input type="radio" name="usergender" id="option1" value="男"> 男
							   </label>
							   <label class="btn btn-default">
							      <input type="radio" name="usergender" id="option2" value="女"> 女
							   </label>
								</div>	
							</div>
							
						  <div class="col-md-4">
								<div class="form-group">
							    <!--<label for="inputage" class="col-sm-2 control-label">年龄</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputage" name="userage" placeholder="年龄" />
						    	</div>
						  	</div>
							</div>
							 <div class="col-md-4">
								<div class="form-group">
							    <!--<label for="inputbirthday" class="col-sm-2 control-label">出生日期</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputbirthday" name="userbirthday" placeholder="出生日期(1999/9/9)">
						    	</div>
						  	</div>
							</div>
						</div>
						
						
						<div class="row">
						  <div class="col-md-8">
						  	<div class="form-group">
							    <!--<label for="inputaddress" class="col-sm-2 control-label">用户地址</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputaddress" name="useraddress" placeholder="用户地址(例:陕西西安)">
						    	</div>
						  	</div>
							</div>
						  <div class="col-md-4">
								<div class="form-group">
							    <!--<label for="inputtesl" class="col-sm-2 control-label">用户电话</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputtel" name="usertel" placeholder="用户电话">
						    	</div>
						  	</div>
							</div>
						</div>

						<div class="row">
						  <div class="col-md-4">
						  	<div class="form-group">
							    <!--<label for="inputheight" class="col-sm-2 control-label">身高</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputheight" name="userheight" placeholder="身高(cm)">
						    	</div>
						  	</div>
							</div>
						  <div class="col-md-4">
								<div class="form-group">
							    <!--<label for="inputweight" class="col-sm-2 control-label">体重</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputweight" name="userweight" placeholder="体重(kg)">
						    	</div>
						  	</div>
							</div>
							 <div class="col-md-4">
								<div class="form-group">
							    <!--<label for="inputBWH" class="col-sm-2 control-label">三围</label>-->
							    <div class="col-sm-10">
						      <input type="text" class="form-control" id="inputBWH" name="userBWH" placeholder="三围(例子:87cm/88cm/89cm)">
						    	</div>
						  	</div>
							</div>
						</div>
						<div class="row" style="margin-bottom: -10px;margin: 0 auto;">
								<div class="col-md-10">
									<div class="form-group">
						      		<textarea class="form-control" rows="3" name="userIntroduce" placeholder="用户简介"></textarea>
						  		</div>
								</div>
						</div>
						<button type="submit" class="btn btn-primary btn-lg btn-block" style="float: right;margin-bottom: 10px;">提交</button>
						</form>
					</div>
 	</div>
 </div>