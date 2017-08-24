<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 模态框（Modal）插件事件</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="C:\Users\Administrator\Desktop\validate.js" type="text/javascript"></script>
</head>
<body>
<div class="row header">
	<div class="nav">
		<div class="navbar-top">
			<div class="container-fluid">
				&nbsp;&nbsp;<span class="tel"> 人资档案系统</span>
				<div class="navbar-top-right">
					<span id="adminUserName"></span>					
					<span id="greeting"> &nbsp您好</span>
					<div class="msginfo">
						<a href="javascript:void(0)" id="msgtext">消息<span id="msgNum">0</span></a>
						<div class="msglist">
							<a href="">消息</a>
						</div>
					</div>
					<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button> -->
					<span class="cutline"></span> <a href="javascript://"  data-toggle="modal" data-target="#pwd-modal" >修改密码</a>
					<span class="cutline"></span> <a href="${ctx}/user/logout">退出登录</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="pwd-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<form id="pwd-form" class="form-horizontal">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body"><!-- modal-body -->
	      
	          <div class="form-group form-group-sm">
	            <label for="oldPwd" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font></span>原始密码:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control required" id="oldPwd" name="oldPwd" maxlength="20"  />
	            </div>
	          </div>
	          
	          <div class="form-group form-group-sm">
	            <label for="password" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font> </span>新密码:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control" id="password" name="password" maxlength="20" />
	            </div>
	          </div>
	          
	          <div class="form-group form-group-sm">
	            <label for="againPwd" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font> </span>重复新密码:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control" id="againPwd" name="againPwd" maxlength="20" />
	            </div>
	          </div>
	        
	      </div> <!-- /modal-body -->
			<div class="modal-footer">
				
				<button type="button" class="btn btn-primary" id="pwd-form-save" onclick="save()">
					保存
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
			</div>
		</div>
	</div>
	</form>
</div>


<script>
  function save(){
	$("#pwd-modal").modal('hide');
  }
   $("#changePwd").click(function(){
		 $("#pwd-modal").modal('show');
   })

   $(function(){
	 var validator = $('#pwd-modal').validate({
								   	rules : {
								   		oldPwd : {
								   			required : true,
								   			remote : '${ctx}/security/checkPassword'
								   		},
								   		password : {
								   			required : true,
								   			rangelength : [ 6, 20 ]
								   		},
								   		againPwd : {
								   			required : true,
								   			equalTo : '#password'
								   		}
								   	},
								   	messages : {
								   		oldPwd : {
								   			required:'请输入原始密码',
								   			remote : '您输入的原始密码不正确！'
								   		},
								   		password:{
								   			required:'请填写新密码',
								   			rangelength:'密码长度为{0}到{1}之间'
								   		},
								   		againPwd : {
								   			required:'请重复填写密码',
								   			equalTo : '两次输入的密码不一致！'
								   		}
								   	}
								   });
   })
</script>
</body>
</html>