<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>
<!doctype html>
<html>
<head>
    <title>用户管理</title>
    <link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<link href="${ctx }/css/pager.css" rel="stylesheet" type="text/css">
    <script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctx }/js/page.js" type="text/javascript"></script>
</head>
<body>
    <div class="panel panel-default">                    
        <div class="panel-heading">
            <ul class="breadcrumb">
              <li><span class="glyphicon glyphicon-home"></span>提醒信息</li>
              <li class="active">未查看提醒</li>
            </ul>
        </div>
		
		<div class="panel-body">
            <div class="subtt appearance-style">
            </div>
            <table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
			       		<th>提醒时间</th>
		                <th>员工姓名</th>
			            <th>部门</th>
			            <th>职务</th>
			            <th>入职时间</th>
		                <th>提醒信息</th>
		                <th>是否完成</th>
			        </tr>
			    </thead>
			    <tbody id="contList">
			       <%--  <c:forEach items="${toolList}" var="em">
			        <tr>
			        	<td><fmt:formatDate value="${em.create_time }" pattern="yyyy-MM-dd"/></td>
			            <td>${em.employeeName }</td>
			            <td>${em.department}</td>
			            <td>${em.job}</td>
			           	<td><fmt:formatDate value="${em.entry_date }" pattern="yyyy-MM-dd"/></td>
			           	<td>${em.message}</td>
			        </tr>
			        </c:forEach> --%>
			    </tbody>
			</table>
			<div class="page_number clearfix myPager" id="myPager">
		        <a class="PageButton prev fl" data-val="prev"><i class="icon-iconfont-zuosanjiao"></i>上一页</a>
		        <ul>
		        </ul>
		        <a class="PageButton next fr" data-val="next">下一页<i class="icon-iconfont-yousanjiao"></i></a>
		        <div class="count fr" id="count">共<em>0</em>条</div>
		        <!-- <div class="jump_box fr clearfix">
		          <span class="jump fl">跳转到</span>
		          <div class="jump_text fl">
		            <input type="text" name='text_box'>
		          </div>
		          <span class="jump fl">页</span> <a class="PageButton submit fl page_color2" data-val="submit">确认</a>
		        </div> -->
		     </div>
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
menu.active('#tooltip-add');
$(function() {
	var a ='${toolList}';
	var b = a[1];
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

<script type="text/javascript">
	$(function(){
		//查询
		var startTime = '';
		var endTime = '';
		$('#submit').on('click',function(){
			startTime = $('#startTime').val();
			endTime = $('#endTime').val();
			getList();
		});
		// 初始化分页,获取添加分页的节点
	    var myPager = new Pager($('#myPager'));
		//  获取容器
	    var dataList = $('#contList');
		// 默认分页为1
	    var page = 1;
		//请求数据
	    function getList() {
	        $.ajax({
	            url: '${ctx }/tooltip/toolitipList',
	            type: 'POST',
	            dataType: 'json',
	            data: {
	            	page:"all",
	                pageNum: page,
	                pageSize: 10
	            },
	            success: function (data) {
	            	//console.log(data);
	                //传入两个参数 ，1当前页 ，2分页总数
	                myPager.paint(page, data.pages);
	                //总条数
	                $('#count em').text(data.total);
	                //清空上一页数据
	                dataList.empty();
	                //插入数据
	                $(createTab(data.list)).appendTo($(dataList));
	                $("#contList li:nth-child(4n)").css("marginRight", "0px");
	                if(data.total > 1){
	                	//显示分页
	                	$('#myPager').show();
	                } 
	            }
	           /*  <td><fmt:formatDate value="${em.create_time }" pattern="yyyy-MM-dd"/></td>
	            <td>${em.employeeName }</td>
	            <td>${em.department}</td>
	            <td>${em.job}</td>
	           	<td><fmt:formatDate value="${em.entry_date }" pattern="yyyy-MM-dd"/></td>
	           	<td>${em.message}</td> */
	        });
	    }
		//返回、加载列表
	    function createTab(list) {
	        var data = list;
	        var html = '';
	        for (var i = 0, len = data.length; i < len; i++) {
	        	if(data[i].fin_status){
	            html += '<tr>' +
	           		'<td>' + formatDate(data[i].create_time) + '</td>' +
	            	'<td>' + data[i].employeeName + '</td>' +
	            	'<td>' + data[i].department + '</td>' +
	            	'<td>' + data[i].job + '</td>' +
	            	'<td>' + formatDate(data[i].entry_date) + '</td>' +
	            	'<td>' + data[i].message + '</td>' +
	            	'<td>' +
            		'<div class="btn-group" role="group" aria-label="...">' +
            			'<a id="look" href="javascript://" onclick="modificationStatus('+data[i].id+","+data[i].fin_status+')" class="btn btn-default btn-sm active">已完成</a>' +
            		'</td>'
	            	'</tr>';
	        	}else{
	        		 html += '<tr>' +
		           		'<td>' + formatDate(data[i].create_time) + '</td>' +
		            	'<td>' + data[i].employeeName + '</td>' +
		            	'<td>' + data[i].department + '</td>' +
		            	'<td>' + data[i].job + '</td>' +
		            	'<td>' + formatDate(data[i].entry_date) + '</td>' +
		            	'<td>' + data[i].message + '</td>' +
		            	'<td>' +
	            		'<div class="btn-group" role="group" aria-label="...">' +
	            			'<a id="look" href="javascript://" onclick="modificationStatus('+data[i].id+","+data[i].fin_status+')" class="btn btn-default btn-sm ">未完成</a>' +
	            		'</td>'
		            	'</tr>';
	        	}
	        	
	        }
	        return html;
	    }
		
		
	    
		// 监听页面切换
	    myPager.on('page', function (data) {

	        //获取当前点击页数,赋值给page
	        page = data.page;
	        // 更新数据
	        getList();
	     // 删除层
	    });
		//调用列表
	    getList();
		// 时间戳
		function formatDate(data){
			if(!data){
				return '-';
			}
			var da = new Date(data);
		    var year = da.getFullYear()+'年';
		    var month = da.getMonth()+1+'月';
		    var date = da.getDate()+'日';
		    return [year,month,date].join('');
		}
	});
	
	function modificationStatus(id,fin_status){
		layer.msg('确定修改状态么？', {
			  time: 0 //不自动关闭
			  ,btn: ['确定', '关闭']
			  ,yes: function(index){
			    layer.close(index);
			    $.post("${ctx}/tooltip/modificationStatus",{"id":id,"fin_status":fin_status},function(data){
		    		 layer.msg(data.message);
		    		 setTimeout(function(){
			    		 location.reload();
		    		 }, 1000)
			    },"json")
			  }
			});
	}
</script>
</body>
</html>
