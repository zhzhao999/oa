<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">

<head>
    <title>员工管理</title>
</head>
<div class="panel panel-default">                    
	<div class="panel-heading">
	    <ul class="breadcrumb">
	      <li><span class="glyphicon glyphicon-home"></span> 员工管理</li>
	      <li class="active">员工信息查看</li>
	    </ul>
	</div>
</div>
<form id="inputForm" action="${ctx }/employee/showUpdate/${em.id}" method="post" class="form-horizontal">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-sm-6 has-feedback">
				<font class="form-control" >${em.name }</font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label">性别:</label>
			<div class="col-sm-2 has-feedback"> 
				<font class="form-control" id="gender"></font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>民族:</label>
			<div class="col-sm-2 has-feedback"> 
				<font class="form-control" >${em.nation }</font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>出生日期:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control"><fmt:formatDate value="${em.birthday }" pattern="yyyy-MM-dd"/></font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>身份证号:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.card_id}</font>
			</div>
		</div>
		
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>学历:</label>
			<div class="col-sm-6 has-feedback">
				<font class="form-control" id="education" ></font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>毕业院校:</label>
			<div class="col-sm-3 has-feedback">
				<font class="form-control" >${em.school }</font>
			</div>
			<label class="col-sm-1 control-label"><font color="red">*</font>专业:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.major }</font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>入职日期:</label>
			<div class="col-sm-6 has-feedback">
				<font class="form-control" ><fmt:formatDate value="${em.entry_date }" pattern="yyyy-MM-dd"/></font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>试用期:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" id="probation"></font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>转正日期:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control"><fmt:formatDate value="${em.regular_date}" pattern="yyyy-MM-dd"/></font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>合同年限:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" id="contract_year"></font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>合同终止日期:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control"><fmt:formatDate value="${em.contract_end_date}" pattern="yyyy-MM-dd"/></font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>手机号:</label>
			<div class="col-sm-6 has-feedback">
				<font class="form-control" >${em.telephone } </font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>QQ号:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.qq } </font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>邮箱:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.email } </font>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>中心:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" id="center" ></font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>部门:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" id="department"></font>
			</div>
		</div>
 		<div class="form-group form-group-sm">
 		<label class="col-sm-3 control-label"><font color="red">*</font>职务:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.job } </font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.level } </font>
			</div>
			
		</div>
 		<div class="form-group form-group-sm">
 		<label class="col-sm-3 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.post_level } </font>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>税前新资:</label>
			<div class="col-sm-2 has-feedback">
				<font class="form-control" >${em.salary } </font>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<p class="text-center">
			<input type="button" name="button1" id="button1" value="确定" onclick="history.go(-1)" class="btn-u btn-u-red w100">
			<input id="agent-submit" type="submit" class="btn-u btn-u-red w100" value="修改">
		</p>
	</div>
</form>

<script type="text/javascript">
menu.active('#employee-list');
$(function(){
	//请求性别
	var url = "${ctx}/dict/getItem/001"
	$.post(url,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].id == "${em.gender}"){
				$("#gender").append(list[i].item_name);
			}
		}
	});
	//学历
	var url2 = "${ctx}/dict/getItem/004"
	$.post(url2,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].id == "${em.education }"){
				$("#education").append(list[i].item_name);
			}
		}
	});
	//试用期
	var url3 = "${ctx}/dict/getItem/002"
	$.post(url3,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].item_code == "${em.probation }"){
				$("#probation").append(list[i].item_name);
			}
		}
	});
	//合同年限
	var url4 = "${ctx}/dict/getItem/003"
	$.post(url4,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].item_code == "${em.contract_year }"){
				$("#contract_year").append(list[i].item_name);
			}
		}
	});
	
	//中心
	var url5 = "${ctx}/dict/getItem/005"
	$.post(url5,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].id == "${em.center }"){
				$("#center").append(list[i].item_name);
			}
		}
	});
	//  部门。。
	var url5 = "${ctx}/dict/getItem/006"
	$.post(url5,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if(list[i].id == "${em.department }"){
				$("#department").append(list[i].item_name);
			}
		}
	});
})
</script>