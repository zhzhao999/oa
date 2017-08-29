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
	      <li class="active">员工信息添加</li>
	    </ul>
	</div>
</div>

<form id="inputForm" action="${ctx}/employee/saveEmployee" method="post" class="form-horizontal">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="name" id="name"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>性别:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="gender">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>民族:</label>
			<div class="col-sm-2 has-feedback"> 
				<input type="text" class="form-control" name="nation" id="nation"/>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>出生日期:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control Wdate" name="birthday" id="birthday" onFocus="WdatePicker({lang:'zh-cn'})"/> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>身份证号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="card_id" id="card_id" /> 
			</div>
		</div>
		
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>学历:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" id="education" name="education" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>毕业院校:</label>
			<div class="col-sm-3 has-feedback">
				<input type="text" class="form-control" name="school" id="school" /> 
			</div>
			<label class="col-sm-1 control-label"><font color="red">*</font>专业:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="major" id="major"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>入职日期:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control Wdate" name="entry_date" id="entry_date" onFocus="WdatePicker({lang:'zh-cn'})"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>试用期:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="probation">
					<option value="1">一个月</option>
					<option value="3" selected>三个月</option>
					<option value="6">六个月</option>
				</select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>合同年限:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="contract_year">
					<option value="2">两年</option>
					<option value="3">三年</option>
					<option value="5">五年</option>
				</select>
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>手机号:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="telephone" id="telephone"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>QQ号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="qq" id="qq" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>邮箱:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="email" id="email" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>中心/部门:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="department" id="department" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>职务:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="job" id="job" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="level" id="level" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="post_level" id="post_level" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>税前新资:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="salary" id="salary"/> 
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<p class="text-center">
			<input id="agent-submit" type="submit" class="btn-u btn-u-red w100" value="确定">
			<input type="button" name="button1" id="button1" value="返回" onclick="history.go(-1)" class="btn-u btn-u-red w100">
		</p>
	</div>
</form>

<script type="text/javascript">
$(function() {
	$('#inputForm').validate({
		rules: {
			name: {
				required: true,
			},
			nation:{
				required: true
			},
			birthday: {
				required: true,
				dateISO:true 
			},
			card_id: {
				required: true,
			},
			education: {
				required: true,
			},
			school: {
				required: true,
			},
			major: {
				required: true,
			},
			entry_date: {
				required: true,
				dateISO:true 
			},
			telephone: {
				required: true,
			},
			email: {
				required: true, 
				rangelength: [6,30],
				email:true
			},
			qq: {
				required: true, 
				rangelength: [5,13],
				digits:true
			},
			department: {
				required: true,
			},
			job: {
				required: true
			},
			level: {
				required: true
			},
			post_level: {
				required: true
			},
			salary: {
				required: true
			}
		},
		messages: {
			name: {
				required:'姓名不能为空',
			},
			nation:{
				required: '民族不能为空'
			},
			birthday: {
				required: '生日不能为空',
				dateISO: '日期格式有误' 
			},
			card_id: {
				required: '身份证号不能为空',
			},
			education: {
				required: '学历不能为空',
			},
			school: {
				required: '毕业院校不能为空',
			},
			major: {
				required: '专业不能为空',
			},
			entry_date: {
				required: '入职日期不能为空',
				dateISO: '日期格式有误'
			},
			telephone: {
				required: '手机号不能为空',
			},
			email:{
				required:'请填写邮箱!',
				rangelength:'邮箱长度在{0}-{1}之间',
				email:'请填写正确格式的邮箱!'
			},
			qq: {
				required:'请填写QQ号!',
				rangelength:'QQ长度在{0}-{1}之间',
				digits:'请填写正确的QQ号'
			},
			department: {
				required: '所属不能为空',
			},
			job: {
				required: '职务不能为空'
			},
			level: {
				required: '职级不能为空'
			},
			post_level: {
				required: '岗位级别不能为空'
			},
			salary: {
				required: '新资不能为空'
			}
		}
	});
}); 
</script>