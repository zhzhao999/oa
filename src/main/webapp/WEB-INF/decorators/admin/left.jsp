<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>

<div class="panel panel-default">

					<div class="panel-heading">
						<a href="#"><span class="glyphicon glyphicon-th-large"></span>
							<strong>功能菜单</strong></a>
					</div>
					
					<div class="panel-body leftmenu">
						<!-- 左侧菜单 -->
						<ul class="list-group leftmenu-list">
							
							<li><a id=""><span></span> 员工管理</a>
								<ul class="list-group">
									<li><a href="${ctx}/employee/findAll" class="list-group-item" id="member-register">员工查询</a></li>
									<li><a href="${ctx}/employee/addEmployee" class="list-group-item" id="advertiser-import">员工录入</a></li>
									<li><a href="${ctx}/employee/importEmployee" class="list-group-item" id="advertiser-import">员工录入</a></li>
								</ul>
						   </li>
							
							<li><a id=""><span></span> 用户管理</a>
								<ul class="list-group">
									<li><a href="${ctx}/user/findAll" class="list-group-item" id="member-register">用户查询</a></li>
									<li><a href="${ctx}/user/addUser" class="list-group-item" id="advertiser-import">用户添加</a></li>
								</ul>
						   </li>
						   
						</ul>
					</div>
					<!-- / 左侧菜单 -->

				</div>
<script type="text/javascript">
$(function() {
	setTimeout(function() {
		if( $('.leftmenu > ul.leftmenu-list > li > ul > li> a.active').length == 0 ) {
			$('.leftmenu > ul.leftmenu-list > li:first a').click();
		}
	}, 500);
})
</script>