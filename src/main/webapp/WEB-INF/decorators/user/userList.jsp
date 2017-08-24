<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<!doctype html>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
    <div class="panel panel-default">                    
        <div class="panel-heading">
            <ul class="breadcrumb">
              <li><span class="glyphicon glyphicon-home"></span> 用户管理</li>
              <li class="active">用户列表</li>
            </ul>
        </div>
		
		<div class="panel-body">
            <div class="subtt appearance-style">
            	<div class="col-md-10 mt10 text-left">
				<form class="form-inline" >
					<div class="form-group">
				          <input type="text" class="form-control input-sm" id = "searchName"  name="search_LIKE_name" placeholder="按名称查询" value=""/>
				          
			        </div>
			        <div class="form-group">
					<button class="btn btn-primary btn-sm" id="searchByName" type="button"><i class="fa fa-search"></i> 查询</button>
					</div>
				</form>
				</div>
                <div class="btn-group-sm mt10">
	                  <a class="btn btn-primary" href="${ctx }/addUser" ><i class="fa fa-plus"></i>新增员工</a>
                </div>
            </div>
            <table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
		                <th>编号</th>
			            <th>名称</th>
			            <th>创建时间</th>
		                <th>操作</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${userList}" var="em">
			        <tr>
			            <td>${em.id }</td>
			            <td>${em.name}</td>
			           	<td><fmt:formatDate value="${em.createTime }" pattern="yyyy-MM-dd"/></td>
		                <td>
							<div class="btn-group" role="group" aria-label="...">
								<a href="javascript://" onclick="deleteUser(${em.id })" class="btn btn-default btn-sm">删除</a>
							</div>
		                </td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
        </div>
	</div>
	<script type="text/javascript">
				          	$("#searchByName").click(function(){
				          		var searchName = $("#searchName").val();
				          		var url="${ctx}/user/searchByName?name="+searchName;
				          		window.location.href=url;
				          	})
				          </script>
<script type="text/javascript">
$(function() {
    menu.active('#package-manage');
});

var validator1 = $('#user-form').validate({
 	rules : {
 		userName: {
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
 		userName : {
 			required:'请输入原始密码',
 			remote : '您输入的原始密码不正确！'
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
 
$('#user-form-save').click(function() {
    var $form = $('#pwd-form');
    var url = '${ctx}/security/changePassword';
    if (validator1.form()) {
	    $.post(url, $form.serialize(), function(data) {
	        var json = $.parseJSON(data);
	        if (json.code==1) {
	        	layer.msg("修改密码成功");
	        	setTimeout(function(){
	        		window.location.href="showHomepage"
	        	}, 1000)
	        } else {
	            layer.msg('修改密码失败', function(){
	            	window.location.href="showHomepage"
	          });
	        } 
	    });
    }
});
 
</script>    

<script type="text/javascript">
									function deleteUser(id){
										layer.msg('确定删除此用户？', {
											  time: 0 //不自动关闭
											  ,btn: ['删除', '不删除']
											  ,yes: function(index){
												   $.post("${ctx }/user/deleteUser",{"id":id},function(data){
														if(data.code==1){	
															layer.msg(data.message);
															setTimeout(function(){
																window.location.href="${ctx}/user/findAll"
													        }, 1000)
														}else{
															layer.msg(data.message);
															setTimeout(function(){
																window.location.href="${ctx}/user/findAll"
													        }, 1000)
														}
													},"json") 
											  }
											});
									}
									</script>
<!-- <div class="modal fade" id="user-modal" data="2" tabindex="-1" role="dialog123" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<form id="user-form" class="form-horizontal">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="usermodal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">modal-body
	      
	          <div class="form-group form-group-sm">
	            <label for="userName" class="col-sm-4 control-label"><span class="text-red"><font color="red">*</font></span>用户名称:</label>
	            <div class="col-sm-6 has-feedback">
	              <input type="password" class="form-control required" id="userName" name="userName" maxlength="20"  />
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
	        
	      </div> /modal-body
			<div class="modal-footer">
				
				<button type="button" class="btn btn-primary" id="user-form-save">
					保存
				</button>
				<button type="button" class="btn btn-default" data-dismiss="usermodal">
					关闭
				</button>
			</div>
		</div>
	</div>
	</form>
</div>     -->
</body>
</html>
