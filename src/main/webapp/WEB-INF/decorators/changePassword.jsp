<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>

	
	<div id="pwd-modal" class="modal fade" tabindex="-1" role="dialog" 
	   aria-labelledby="changePwd-ModalLabel" aria-hidden="true">
	   
	    
		<form id="pwd-form" class="form-horizontal">
		  <zy:token/>
	
	      <div class="modal-header"> <!-- modal-header -->
	      
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="changePwd-ModalLabel">修改密码</h4>
	        
	      </div> <!-- /modal-header -->
	      
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
	      
	      <div class="modal-footer"> <!-- modal-footer -->
	        <button type="button" id="pwd-form-save" class="btn btn-primary btn-addstyle">确定</button>
	        <button type="button" id="pwd-form-cancel" class="btn btn-default btn-stylecancel">取消</button>
	      </div> <!-- /modal-footer -->
	      
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

$('#pwd-form-save').click(function() {
    var $form = $('#pwd-form');
    var url = '${ctx}/security/changePassword';
    if (validator.form()) {
	    $.post(url, $form.serialize(), function(data) {
	        common.hideModal('#pwd-modal');
	        var json = $.parseJSON(data);
	        if (json.result) {
	            common.showMessage('修改密码成功！')
	        } else {
	            common.showMessage('修改密码失败！<br>原因：'+json.content, 'warn');
	        }
	    });
    }
});

//取消表单
$('#pwd-form-cancel').click(function(event) {
	common.hideModal('#pwd-modal');
});

</script>