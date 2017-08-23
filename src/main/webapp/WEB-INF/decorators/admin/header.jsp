<%-- <%@page import="com.lczy.media.util.UserContext"%> --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<!-- Static navbar -->
<div class="row header">
	<div class="nav">
		<div class="navbar-top">
			<div class="container-fluid">
				<%-- <img src="${ctx}/static/assets/img/headers/c-logo.png" height="50" /> --%>
				&nbsp;&nbsp;<span class="tel"> 人资档案系统</span>
				<div class="navbar-top-right">
					<span id="adminUserName"></span>
					<script type="text/javascript">
						$(function() {
							var adminName = '${adminName }';
							if (adminName == "" || adminName == null) {
								window.location.href = '${ctx}/user/logout';
							} else {
								if (adminName == "admin") {
									$("#adminUserName").text("超级管理员");
								} else {
									$("#adminUserName").text(adminName);
								}
							}
						})
						$(function() {
							// 修改密码
							if ($('#changePwd').length > 0) {
								$('#changePwd').click(function() {
									$.get('${ctx}'+'/changePassword?ajax',function(data) {
										$('#pwd-modal').remove();//从DOM删除已有的对话框
										$('body').append(data);
										common.showModal('#pwd-modal',false);
								});
								return false;
								});
							}

							// 调整 #content 的最小高度.
							try {
								var h = $(window).height()
										- $('#header').height()
										- $('#footer').height();
								$('#content').css('min-height', h);
							} catch (e) {
								common.log(e);
							}

						});
					</script>
					<span id="greeting"> &nbsp您好</span>
					<div class="msginfo">
						<a href="javascript:void(0)" id="msgtext">消息<span id="msgNum">0</span></a>
						<div class="msglist">
							<a href="">消息</a>
						</div>
					</div>
					<span class="cutline"></span> <a href="#" id="changePwd">修改密码</a> <span
						class="cutline"></span> <a href="${ctx}/user/logout">退出登录</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- / Header -->
<script type="text/javascript" src="${ctx}/js/eventsource.js"></script>
