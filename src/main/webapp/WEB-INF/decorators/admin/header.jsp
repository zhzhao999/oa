<%@ page language="java" pageEncoding="UTF-8"%>
<%-- 	<link rel="stylesheet" href="${ctx }/static/legacy/css/bootstrap.css"> --%>
<div class="row header" id= "headerss">
	<div class="nav">
		<div class="navbar-top">
			<div class="container-fluid">
				<%-- <img src="${ctx}/static/assets/img/headers/c-logo.png" height="50" /> --%>
				&nbsp;&nbsp;<span class="tel"> 人资档案系统</span>
				
				<div class="navbar-top-right">
					<span id="adminUserName"></span>
					<script type="text/javascript">
						 $(function() {
							var adminName = '${userName }';
							if (adminName == "" || adminName == null) {
								window.location.href = '${ctx}/user/logout';
							} else {
								if (adminName == "admin") {
									$("#adminUserName").text("超级管理员");
								} else {
									$("#adminUserName").text(adminName);
								}
							}
						})	 
					</script>
					<span id="greeting"> &nbsp您好</span>
					<div class="msginfo">
						<a href="${ctx}/tooltip/findUnreadM" id="msgtext">消息<span id="msgNum">0</span></a>
						<div class="msglist">
							<a href="${ctx}/tooltip/findUnreadM">消息</a>
						</div>
					</div>
					<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button> -->
					<span class="cutline"></span> <a href="#"  data-toggle="modal" data-target="#pwd-modal" >修改密码</a>
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
				
				<button type="button" class="btn btn-primary" id="pwd-form-save">
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
 <script type="text/javascript">

 var validator = $('#pwd-form').validate({
 	rules : {
 		oldPwd : {
 			required : true,
 			remote : '${ctx}/security/checkPassword'
 		},
 		password : {
 			required : true,
 			rangelength : [ 4, 20 ]
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
 
 $('#pwd-form-save').click(function() {
	    var $form = $('#pwd-form');
	    var url = '${ctx}/security/changePassword';
	    if (validator.form()) {
		    $.post(url, $form.serialize(), function(data) {
		        var json = $.parseJSON(data);
		        if (json.code==1) {
		        	layer.msg("修改密码成功");
		        	setTimeout(function(){
		        		window.location.href="${ctx}/showHomepage"
		        	}, 1000)
		        } else {
		            layer.msg('修改密码失败', function(){
		            	window.location.href="showHomepage"
		          });
		        } 
		    });
	    }
	});
 
 $(function(){
	 $.post("${ctx}/tooltip/searchRegularE",{},function(data){
		 $("#msgNum").text(data);
	 },"json")
 })
</script>
  
</script>
