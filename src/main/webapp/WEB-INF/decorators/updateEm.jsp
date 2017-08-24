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
				<select class="form-control" name="gender">
					<c:if test="${em.gender == '男'}">
						<option value="男" selected>男</option>
						<option value="女">女</option>
					</c:if>
					<c:if test="${em.gender == '女'}">
						<option value="男" >男</option>
						<option value="女" selected>女</option>
					</c:if>
					<c:if test="${empty em.gender }">
						<option value="男" selected>男</option>
						<option value="女" >女</option>
					</c:if>
				</select>
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
				<input type="text" class="form-control" name="education" value="${em.education }" /> 
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
				<select class="form-control" name="probation">
					<c:if test="${em.probation == '1' }">
						<option value="1" selected>一个月</option>
						<option value="3">三个月</option>
						<option value="6">六个月</option>
					</c:if>
					<c:if test="${em.probation == '3' }">
						<option value="1" >一个月</option>
						<option value="3" selected>三个月</option>
						<option value="6">六个月</option>
					</c:if>
					<c:if test="${em.probation == '6' }">
						<option value="1" >一个月</option>
						<option value="3">三个月</option>
						<option value="6" selected>六个月</option>
					</c:if>
					<c:if test="${em.probation == '0'}">
						<option value="1" >一个月</option>
						<option value="3" selected>三个月</option>
						<option value="6">六个月</option>
					</c:if>
					
				</select>
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>合同年限:</label>
			<div class="col-sm-2 has-feedback">
				<select class="form-control" name="contract_year">
					<c:if test="${em.contract_year == '2' }">
						<option value="2" selected>两年</option>
						<option value="3">三年</option>
						<option value="5">五年</option>
					</c:if>
					<c:if test="${em.contract_year == '3' }">
						<option value="2">两年</option>
						<option value="3" selected>三年</option>
						<option value="5">五年</option>
					</c:if>
					<c:if test="${em.contract_year == '5' }">
						<option value="2">两年</option>
						<option value="3">三年</option>
						<option value="5" selected>五年</option>
					</c:if>
					<c:if test="${em.contract_year == '0'}">
						<option value="2" selected>两年</option>
						<option value="3" >三年</option>
						<option value="5" >五年</option>
					</c:if>
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
			<label class="col-sm-3 control-label"><font color="red">*</font>中心/部门:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="department" value="${em.department }" /> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>职务:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="job" value="${em.job }" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>职级:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="level" value="${em.level }"/> 
			</div>
			<label class="col-sm-2 control-label"><font color="red">*</font>岗位级别:</label>
			<div class="col-sm-2 has-feedback">
				<input type="text" class="form-control" name="post_level" value="${em.post_level }" /> 
			</div>
		</div>
 		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label"><font color="red">*</font>税前新资:</label>
			<div class="col-sm-6 has-feedback">
				<input type="text" class="form-control" name="salary" value="${em.salary}"/> 
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<p class="text-center">
			<input id="agent-submit" type="submit" class="btn-u btn-u-red w100" value="修改">
			<input type="button" name="button1" id="button1" value="取消" onclick="history.go(-1)" class="btn-u btn-u-red w100">
		</p>
	</div>
</form>