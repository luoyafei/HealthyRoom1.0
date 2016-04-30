<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="/HealthyRoom1.0/SearchThemeAction" method="post" class="navbar-form navbar-left" role="search" onsubmit="return chechSearchValue()">
						<div class="form-group">
							<input type="text" name="searchTheme" id="searchTheme" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">快速搜索</button>
					</form>
					<script>
						function chechSearchValue() {
							if($("#searchTheme").val().trim() != "" && $("#searchTheme").val().trim().length < 10)
								return true;
							else {
								alert("请输入您想搜索的主题内容的关键字！请将字数限制在10个以内!");
								return false;
							}
								
						}
					</script>