<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能导航</title>

</head>
<body>

				<div class="panel panel-default">
					<div class="panel-heading">
						<ul class="breadcrumb">
							<li><span class="glyphicon glyphicon-home"></span> 系统管理</li>
							<li class="active">操作日志</li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="topwrap">
							<form class="form-inline">
								<div class="form-group form-group-sm">
									<label>操作时间</label>
									<div class="input-group">
										<input type="text" class="form-control"
											id="search_GTE_createTime" name="search_GTE_createTime"
											value="${param.search_GTE_createTime }"
											onfocus="WdatePicker({firstDayOfWeek:1,maxDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'search_LTE_createTime\')}'})">
										<div class="input-group-addon">至</div>
										<input type="text" class="form-control"
											id="search_LTE_createTime" name="search_LTE_createTime"
											value="${param.search_LTE_createTime }"
											onfocus="WdatePicker({firstDayOfWeek:1,maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'search_GTE_createTime\')}'})">
									</div>
								</div>

								<div class="form-group form-group-sm">
									<label>编号</label> <input name="search_LIKE_id"
										value="${param.search_LIKE_id }" type="text"
										class="form-control">
								</div>

								<div class="form-group form-group-sm">
									<label>操作人</label> <input name="search_LIKE_user.nickname"
										value="${param['search_LIKE_user.nickname'] }" type="text"
										class="form-control">
								</div>

								<div class="form-group form-group-sm">
									<label>操作人角色：</label> <select name="search_EQ_user.role.id"
										class="form-control input-sm">
										<option value=""
											<c:if test="${empty param.search_EQ_user.role.id }">selected</c:if>>
											-选择角色
									</select>
								</div>

								<div class="form-group form-group-sm">
									<label>操作模块</label> <input name="search_EQ_optModule"
										value="${param['search_EQ_optModule'] }" type="text"
										class="form-control">
								</div>

								<div class="form-group form-group-sm">
									<button type="button" class="btn btn-primary searchBtn">
										<i class="fa fa-search"></i> 查询
									</button>
									<a class="btn btn-primary"
										href="${ctx}/admin/adminLog/list/${type}">重置</a>
									<button type="button" class="btn btn-primary importBtn"
										data-type="LOG_TYPE"">导出</button>
								</div>
							</form>

						</div>

					</div>
				</div>


</body>
</html>