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
									<li><a href="${ctx}/employee/showList" class="list-group-item" id="employee-list">员工列表</a></li>
									<li><a href="${ctx}/employee/showAddEm" class="list-group-item" id="employee-add">员工录入</a></li>
									<li><a href="${ctx}/employee/showExport" class="list-group-item" id="employee-export">员工信息导出</a></li>
								</ul>
						   </li>
							<li><a id=""><span></span> 薪资管理</a>
								<ul class="list-group">
									<li><a href="${ctx}/salary/showList" class="list-group-item" id="salary-list">员工薪资表</a></li>
									<li><a href="${ctx}/salary/dict/postLevel/showList" class="list-group-item" id="salary-post-list">岗位级别</a></li>
									<li><a href="#" class="list-group-item" id="salary-level-list">职级级别</a></li>
								</ul>
						   </li>
							<c:if test="${userName eq 'admin' }">
								<li><a id=""><span></span> 用户管理</a>
									<ul class="list-group">
										<li><a href="${ctx}/user/findAll" class="list-group-item" id="user-list">用户列表</a></li>
										<li><a href="${ctx}/addUser" class="list-group-item" id="user-add">用户添加</a></li>
									</ul>
							   </li>
						   </c:if>
						   <li><a id=""><span></span>提醒信息</a>
								<ul class="list-group">
									<li><a href="${ctx}/tooltip/findUnreadM" class="list-group-item" id="tooltip-list">未查看提醒</a></li>
									<li><a href="${ctx}/tooltip/findUnreadM?page=all" class="list-group-item" id="tooltip-add">提醒记录</a></li>
								</ul>
						   </li>
						   <li><a id=""><span></span>系统管理</a>
								<ul class="list-group">
									<li><a href="${ctx}/dict/show" class="list-group-item" id="dict-list">字典管理</a></li>
									<li><a href="${ctx}/log/showList" class="list-group-item" id="use-log">操作日志</a></li>
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