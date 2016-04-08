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
								xmlhttp.open("GET", "/HealthyRoom1.0/CheckOfUserLogin?username=" + username + "&password=" + password, true);
								xmlhttp.onreadystatechange = function() {
									if (xmlhttp.readyState == 4) {
										if (xmlhttp.status == 200) {
											if (xmlhttp.responseText) {
												//alert(xmlhttp.responseText);
												addNodePswOk();
												$('#myModal').modal('hide');
												$("#login-register-bar").load("/HealthyRoom1.0/index_user.jsp");
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
								xmlhttp.open("GET", "/HealthyRoom1.0/CheckUsernameIshave?username=" + username, true);
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
