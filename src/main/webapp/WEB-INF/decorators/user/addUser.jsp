<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<head>
    <title>用户管理</title>
</head>
<div class="modal-header">
	<h4 class="modal-title" >用户信息添加</h4>
</div>
<form id="inputForm" action="${ctx}/user/addUser" method="post" class="form-horizontal">
	<div class="modal-body"><!-- modal-body -->
	      
	          <div class="form-group form-group-sm">
	            <label for="yhName" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font></span>用户姓名:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="text" class="form-control required" id="yhName" name="yhName" maxlength="20"  />
	            </div>
	          </div>
	          
	          <div class="form-group form-group-sm">
	            <label for="userPassword" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font> </span>密码:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20" />
	            </div>
	          </div>
	          
	          <div class="form-group form-group-sm">
	            <label for="userAgainPwd" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font> </span>重复密码:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control" id="userAgainPwd" name="userAgainPwd" maxlength="20" />
	            </div>
	          </div>
	        
	      </div> <!-- /modal-body -->
	
	<div class="modal-footer">
		<p class="text-center">
			<input id="agent-submit" type="button" class="btn-u btn-u-red w100" value="确定">
			<input type="button" name="button1" id="button1" value="返回" onclick="history.go(-1)" class="btn-u btn-u-red w100">
		</p>
	</div>
	
	<script type="text/javascript">
	menu.active('#user-add');
	var validator1 = $('#inputForm').validate({
	 	rules : {
	 		yhName: {
	 			required : true,
	 			remote : '${ctx}/security/checkUserName'
	 		},
	 		userPassword : {
	 			required : true,
	 			rangelength : [ 4, 20 ]
	 		},
	 		userAgainPwd : {
	 			required : true,
	 			equalTo : '#userPassword'
	 		}
	 	},
	 	messages : {
	 		yhName : {
	 			required:'请输入原始密码',
	 			remote : '该用户名已经被占用！'
	 		},
	 		userPassword:{
	 			required:'请填写新密码',
	 			rangelength:'密码长度为{0}到{1}之间'
	 		},
	 		userAgainPwd : {
	 			required:'请重复填写密码',
	 			equalTo : '两次输入的密码不一致！'
	 		}
	 	}
	 });
	$('#agent-submit').click(function() {
	    var $form = $('#inputForm');
	    var url = '${ctx}/user/addUser';
	    if (validator1.form()) {
		    $.post(url, $form.serialize(), function(data) {
		        if (data.code==1) {
		        	layer.msg(data.message);
		        	setTimeout(function(){
		        		window.location.href="${ctx}/user/findAll"
		        	}, 1000)
		        } else {
		            layer.msg(data.message, function(){
		          });
		        } 
		    });
	    }
	});
	
	</script>
</form>
