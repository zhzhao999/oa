<%-- <%@page import="com.lczy.media.util.UserContext"%> --%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>
<!-- Static navbar -->
<div class="row header">
			<div class="nav">
				<div class="navbar-top">
					<div class="container-fluid">
						<%-- <img src="${ctx}/static/assets/img/headers/c-logo.png" height="50" /> --%>
						&nbsp;&nbsp;<span class="tel"> 人资档案系统</span>
						<div class="navbar-top-right">
							<span id="greeting">您好！</span> <span class="cutline"></span>
							<div class="msginfo">
								<a href="javascript:void(0)" id="msgtext">消息<span
									id="msgNum">0</span></a>
								<div class="msglist">
									<a href="">消息</a>
								</div>
							</div>
							<span class="cutline"></span> <a href="#" id="changePwd">修改密码</a>
							<span class="cutline"></span> <a href="${ctx}/user/logout">退出登录</a>
						</div>
					</div>
				</div>
			</div>
		</div><!-- / Header -->
<%-- <script type="text/javascript" src="${ctx}/static/assets/js/eventsource.js"></script> --%>
