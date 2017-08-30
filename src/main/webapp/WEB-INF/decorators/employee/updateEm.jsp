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
	      <li class="active">员工信息修改</li>
	    </ul>
	</div>
</div>
<form id="inputForm" action="${ctx }/employee/updateEm" method="post" class="form-horizontal">
	<input type="hidden" name="id" value="${em.id }">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="name" value="${em.name }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label">性别:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="gender" id="gender"></select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>民族:</label>
			<div class="col-sm-2 has-feedback"> 
				<input type="text" class="form-control" name="nation" value="${em.nation }"/>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>出生日期:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control Wdate" name="birthday" onFocus="WdatePicker({lang:'zh-cn'})"
				value="<fmt:formatDate value="${em.birthday }" pattern="yyyy-MM-dd"/>"/> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>身份证号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="card_id" value="${em.card_id}"/> 
			</div>
		</div>
		
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>学历:</label>
			<div class="col-sm-6 has-feedback">
			<%-- 	<input type="text" class="form-control" name="education" value="${em.education }" />  --%>
				<select class="form-control" name="education" id="education"></select>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>毕业院校:</label>
			<div class="col-sm-3 has-feedback">
				<input type="text" class="form-control" name="school" value="${em.school }"/> 
			</div>
			<label class="col-sm-1 control-label"><font color="red">*</font>专业:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="major" value="${em.major }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>入职日期:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control Wdate" name="entry_date" onFocus="WdatePicker({lang:'zh-cn'})" 
				value="<fmt:formatDate value="${em.entry_date }" pattern="yyyy-MM-dd"/>"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>试用期:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="probation" id="probation"></select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>合同年限:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="contract_year" id="contract_year">
				</select>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>手机号:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="telephone" value="${em.telephone }" />
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>QQ号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="qq" value="${em.qq }"/> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>邮箱:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="email" value="${em.email }" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>中心:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="center" id="center"></select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>部门:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="department" id="department"></select>
			</div>
		</div>
 		<div class="form-group form-group-sm">
 		<label class="col-sm-3 control-label"><font color="red">*</font>职务:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="job" value="${em.job }" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="level" value="${em.level }"/> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
 		<label class="col-sm-3 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="post_level" value="${em.post_level }" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>税前新资:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="salary" value="${em.salary}"/> 
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
menu.active('#employee-list');

$(function() {
	//请求性别
	var url = "${ctx}/dict/getItem/001"
	$.post(url,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if (list[i].id == "${em.gender}") {
				$("#gender").append("<option selected value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}else{
				$("#gender").append("<option value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}
		}
	});
	
	//学历
	var url2 = "${ctx}/dict/getItem/004"
	$.post(url2,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if (list[i].id == "${em.education}") {
				$("#education").append("<option selected value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}else{
				$("#education").append("<option value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}
		}
	});
	
	//试用期
	var url3 = "${ctx}/dict/getItem/002"
	$.post(url3,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if (list[i].item_code == "${em.probation}") {
				$("#probation").append("<option selected value='"+list[i].item_code+"'>"+list[i].item_name+"</option>");
			}else{
				$("#probation").append("<option value='"+list[i].item_code+"'>"+list[i].item_name+"</option>");
			}
		}
	});
	//合同年限
	var url4 = "${ctx}/dict/getItem/003"
	$.post(url4,null,function(data){
		var list = data.data;
		for (var i = 0; i < list.length; i++) {
			if (list[i].item_code == "${em.contract_year}") {
				$("#contract_year").append("<option selected value='"+list[i].item_code+"'>"+list[i].item_name+"</option>");
			}else{
				$("#contract_year").append("<option value='"+list[i].item_code+"'>"+list[i].item_name+"</option>");
			}
		}
	});
	
	//中心
	var url5 = "${ctx}/dict/getItem/005"
	$.post(url5,null,function(data){
		var list = data.data;
		$("#center").append("<option value=''>请选择</option>");
		for (var i = 0; i < list.length; i++) {
			if (list[i].id == "${em.center }") {
				$("#center").append("<option selected value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}else{
				$("#center").append("<option value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}
		}
	});
	//  部门。。
	var url5 = "${ctx}/dict/getItem/006"
	$.post(url5,null,function(data){
		var list = data.data;
		$("#department").append("<option value=''>请选择</option>");
		for (var i = 0; i < list.length; i++) {
			if (list[i].id == "${em.department }") {
				$("#department").append("<option selected value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}else{
				$("#department").append("<option value='"+list[i].id+"'>"+list[i].item_name+"</option>");
			}
		}
	});
})
</script>