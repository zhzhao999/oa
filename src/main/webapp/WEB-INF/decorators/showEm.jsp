<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">

<div class="modal-header">
	<h4 class="modal-title" >员工信息添加</h4>
</div>
<form id="inputForm" action="${ctx}/employee/saveEmployee" method="post" class="form-horizontal">
	<div class="modal-body">
		<p class="alert alert-danger hide"></p>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="name" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label">性别:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="gender">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>民族:</label>
			<div class="col-sm-2 has-feedback"> 
				<input type="text" class="form-control" name="nation" />
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>出生日期:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control Wdate" id="birthday" name="birthday" onFocus="WdatePicker({lang:'zh-cn'})"/> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>身份证号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" id="card_id" name="card_id" /> 
			</div>
		</div>
		
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>学历:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="education" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>毕业院校:</label>
			<div class="col-sm-3 has-feedback">
				<input type="text" class="form-control" name="school" /> 
			</div>
			<label class="col-sm-1 control-label"><font color="red">*</font>专业:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="major" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>入职日期:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control Wdate" name="entry_date" onFocus="WdatePicker({lang:'zh-cn'})"/> 
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
			<label class="col-sm-2 control-label"><font color="red">*</font>转正日期:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="regular_date" disabled="disabled"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>合同年限:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="contract_year">
					<option value="3">三年</option>
					<option value="5">五年</option>
					<option value="10">十年</option>
				</select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>合同终止日期:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="contract_end_date" disabled="disabled"/> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>手机号:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="telephone" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>QQ号:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" id="qq" name="qq" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>邮箱:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="email" /> 
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>中心/部门:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="department" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>职务:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="job" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="level" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="post_level" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>税前新资:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="salary" /> 
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
/* $(function() {
	$('#inputForm').validate({
		rules: {
			supplierType:{
				required: true
			},
			loginName: {
				required: true,
				rangelength : [6, 11],
	      		remote: "${ctx}/common/checkLoginName?oldName=" + encodeURIComponent('')
			},
			name: {
				required: true,
				rangelength : [2, 20],
			},
			password: {
				required: true,
				rangelength : [6, 20]
			},
			checkPassword: {
				required: true,
				equalTo : '#password'
			},
			mobPhone: {
				required: true,
				digits:true,
				rangelength: [11,11],
				remote: {
					depends: function() {
						return !('${cust.mobPhone}' == $('#mobPhone').val())
					},
					param: '${ctx}/common/checkMobPhoneSup'
				}
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
			introduction: {
				required: true,
				rangelength:[6,200]
			},
			strCNS: {
				required: true
			},
			linkman: {
				required: true
			}
		},
		messages: {
			linkman:{
				required: '联系人不能为空!'
			},
			strCNS:{
				required: '请选择服务类别!'
			},
			supplierType:{
				required: '请选择供应商类型'
			},
			loginName: {
				required:'请填写登录账号',
				rangelength:'登录名长度介于{0}和{1}之间',
				remote: '登录名已经存在，请重新输入！'
			},
			name: {
				required:'请填写公司名称',
				rangelength:'请输入长度介于{0}和{1}之间的公司名称',
			},
			password: {
				required:'请输入密码',
				rangelength:'密码长度为{0}-{1}.',
			},
			checkPassword:{
				required:'请重复填写密码',
				equalTo:'两次填写密码不一致!'
			},
			mobPhone: {
				required:'请输入手机号.',
				digits:'请正确填写手机号',
				rangelength:'请填写正确的11位手机号',
				remote:'此手机号已注册!'
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
			introduction:{
				required:'请填写简介',
				rangelength:'简介字数为{0}-{1}之间'
			}
		}
	});
}); */
</script>