<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">

<head>
    <title>薪资管理</title>
</head>
<div class="panel panel-default">                    
	<div class="panel-heading">
	    <ul class="breadcrumb">
	      <li><span class="glyphicon glyphicon-home"></span> 薪资管理</li>
	      <li class="active">岗位级别修改</li>
	    </ul>
	</div>
</div>
<form id="inputForm" action="${ctx }/salary/dict/postLevel/update" method="post" class="form-horizontal">
	<input type="hidden" name="id" value="${level.id }">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>级别:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="type_name" value="${level.type_name }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>岗位工资:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="post_salary" value="${level.post_salary }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>上升比例:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="up_ratio" value="${level.up_ratio }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>绩效工资:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="merit_pay" value="${level.merit_pay }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>绩效/岗位占比:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="merit_ratio" value="${level.merit_ratio }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>满勤奖:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="merit_pay" value="${level.full_award }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>小计:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="total" value="${level.total }" /> 
			</div>
		</div>
		
	</div>
	<div class="modal-footer">
		<p class="text-center">
			<input id="agent-submit" type="submit" class="btn-u btn-u-red w100" value="修改" >
			<input type="button" name="button1" id="button1" value="取消" onclick="history.go(-1)" class="btn-u btn-u-red w100">
		</p>
	</div>
</form>
<script type="text/javascript">
menu.active('#salary-post-list');

$(function() {
	$('#inputForm').validate({
		rules: {
			type_name: {
				required: true,
			},
			post_salary: {
				required: true,
			},
			merit_pay: {
				required: true,
			},
			merit_ratio: {
				required: true,
			},
			total: {
				required: true,
			},
			
		},
		messages: {
			type_name: {
				required:'级别不能为空',
			},
			post_salary: {
				required: '岗位工资不能为空',
			},
			merit_pay: {
				required: '绩效工资不能为空',
			},
			merit_ratio: {
				required: '绩效/岗位占比不能为空',
			},
			total: {
				required: '小计不能为空',
			},
		}
	});
	
})
</script>