<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">

<head>
    <title>新资管理</title>
</head>
<div class="panel panel-default">                    
	<div class="panel-heading">
	    <ul class="breadcrumb">
	      <li><span class="glyphicon glyphicon-home"></span> 薪资管理</li>
	      <li class="active">员工薪资修改</li>
	    </ul>
	</div>
</div>
<form id="inputForm" action="${ctx }/salary/updateSalary" method="post" class="form-horizontal">
	<input type="hidden" name="employee_id" value="${salary.employee_id }">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="name" value="${salary.name }" readonly="readonly" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>员工编号:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="name" value="${salary.ee_id }" readonly="readonly" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-6 has-feedback">
				<select class="form-control" name="level" id="level"></select>
			</div>
		</div>
 		<div class="form-group form-group-sm">
 			<label class="col-sm-3 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-6 has-feedback">
				<select class="form-control" name="post_level" id="post_level"></select>
			</div>
		</div>
 		<div class="form-group form-group-sm">
 			<label class="col-sm-3 control-label"><font color="red"></font>薪资其他:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="other" value="${salary.other }" /> 
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
menu.active('#salary-list');

$(function() {
	$('#inputForm').validate({
		rules: {
			level: {
				required: true
			},
			post_level: {
				required: true
			}
		},
		messages: {
			level: {
				required: '职级不能为空'
			},
			post_level: {
				required: '岗位级别不能为空'
			}
		}
	});
	
	//  获取职级
	var url6 = "${ctx}/salary/dict/level/type"
	$.post(url6,null,function(data){
		var list = data.data;
		$("#level").append("<option value=''>请选择</option>");
		for (var i = 0; i < list.length; i++) {
			if(list[i].id == "${salary.level}"){
				$("#level").append("<option selected value='"+list[i].id+"'>"+list[i].type_name+"</option>");
			}else{
				$("#level").append("<option value='"+list[i].id+"'>"+list[i].type_name+"</option>");
			}
		}
	});
	//  获取岗位级别
	var url7 = "${ctx}/salary/dict/postLevel/type"
	$.post(url7,null,function(data){
		var list = data.data;
		$("#post_level").append("<option value=''>请选择</option>");
		for (var i = 0; i < list.length; i++) {
			if (list[i].id == "${salary.post_level}") {
				$("#post_level").append("<option selected value='"+list[i].id+"'>"+list[i].type_name+"</option>");
			}else{
				$("#post_level").append("<option value='"+list[i].id+"'>"+list[i].type_name+"</option>");
			}
		}
	});
})
</script>