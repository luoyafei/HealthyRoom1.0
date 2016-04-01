<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
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
