<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: url(3.jpg);">
          <h1 class="page-header" style="color: snow;font-family: '微软雅黑';">修改密码</h1>
					<div style="width: 100%;height: 100%;">
						
						<div class="tab-content-1" style="width: 100%;height: 100%;margin: 0 auto; background-color: white;">
						<form class="form-horizontal" role="form" style="margin-left: 0px;">
							<div style="border-bottom: dashed #A9A9A9 1px;">
								<div class="form-group" style="margin-right: 0px;margin-left: -45px;padding-top: 40px;">
									<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">原始密码</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="repassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
									</div>
								</div>
							</div>
							<div style="border-bottom: dashed #A9A9A9 1px;">
								<div class="form-group" style="margin-right: 0px;margin-left: -45px;;padding-top: 15px;">
									<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">新&nbsp;密&nbsp;码&nbsp;</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="newpassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
									</div>
								</div>
							</div>
							<div style="border-bottom: dashed #A9A9A9 1px;">
								<div class="form-group" style="margin-right: 0px;margin-left: -45px;;padding-top: 15px;">
									<label for="create-project-name1" class="col-sm-2 control-label" style="font-size: 18px;font-weight: normal;">重复密码</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="renewpassword" style="background-color: #F5F5F5;" id="create-project-name1" placeholder="">
									</div>
								</div>
							</div>
							<div style="margin: 50px auto;">
								<div class="form-group" style="margin: 0 auto; text-align: center;">
									<button type="submit" class="btn btn-primary btn-lg btn-block" style="float: right;margin-bottom: 10px;">提交</button>
								</div>
							</div>
						</form>
					</div>
 	</div>
 </div>