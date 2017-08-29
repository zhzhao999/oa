<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>

<head>
<title>员工管理</title>

</head>
<style type="text/css">
.form-horizontal .control-label {
	text-align: left;
}
</style>
<div class="panel panel-default">
	<div class="panel-heading">
		<ul class="breadcrumb">
			<li><span class="glyphicon glyphicon-home"></span> 员工管理</li>
			<li class="active">员工信息导出</li>
		</ul>
	</div>
</div>

<form id="inputForm" action="${ctx}/employee/exportEm" method="post" class="form-horizontal">
	<div class="modal-body">
		<div class="form-group form-group-sm">
			<label class="col-sm-2 text-right"> 
				<h4>导出字段</h4>
			</label> 
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label"></label>
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="姓名" />姓名
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="性别" />性别
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="出生日期" />出生日期
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="身份证号" />身份证号
			</label>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label"></label>
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="学历" />学历
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="毕业院校" />毕业院校
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="专业" />专业
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="入职日期" />入职日期
			</label>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label"></label>
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="部门" />部门
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="职务" />职务
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="职级" />职级
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="新资" />新资
			</label>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label"></label>
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="手机" />手机
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="QQ" />QQ
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eType" type="checkbox" value="邮箱" />邮箱
			</label> 
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 text-right"> 
				<h4>排序方式</h4>
			</label>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-2 control-label"></label>
			<label class="col-sm-2 control-label"> 
				<input name="eSort" type="checkbox" value="部门" />部门
			</label> 
			<label class="col-sm-2 control-label"> 
				<input name="eSort" type="checkbox" value="入职日期" />入职日期
			</label> 
		</div>
	</div>
	<div class="modal-footer center">
		<p class="text-center">
			<input id="agent-submit" type="button" class="btn-u btn-u-red w100" value="确定"> 
			<input type="button" name="button1" id="button1" value="返回" onclick="history.go(-1)" class="btn-u btn-u-red w100">
		</p>
	</div>
</form>

<script type="text/javascript">
menu.active('#employee-export');
/* $("#agent-submit").click(function(){
	var data_ = [];
	$("input[type=checkbox]:checked").each(function(){
		data_.push($(this).val());
	})
	data_ = data_.join(",");
	var url = "${ctx}/employee/exportEm";
	var param = {'data':data_};
	$.post(url,param,function(data){
		if(data.code == 1){
			alert("导出成功");
		}else{
			alert(data.message);
		}
	});
});  */
$("#agent-submit").click(function(){
	var data_ = [];
	$("input[type=checkbox]:checked").each(function(){
		data_.push($(this).val());
	})
	data_ = data_.join(",");
	if (data_.length == 0) {
		alert("请选择导出字段");
	}else{
		$("#inputForm").submit();
	}
});
</script>