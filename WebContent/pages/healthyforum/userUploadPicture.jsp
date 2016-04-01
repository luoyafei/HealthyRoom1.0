<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!-- 点击上传图片出现的上传模态框 -->
<div class="modal fade  bs-example-modal-sm" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form action="/HealthyRoom1.0/DealUploadPicture" method="post" enctype="multipart/form-data">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请进行上传头像操作</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal" role="form">
							<div class="form-group">
								<div class="col-md-10">
									<input type="file" id="uploadFile" name="file" accept="image/*" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-default" id="modal-submit">上传</button>
					</div>
				</form>
			</div>
		</div>
	</div>

    