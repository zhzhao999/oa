<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>

<!doctype html>
<html>
<head>
    <title>员工管理</title>
	<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<link href="${ctx }/css/pager.css" rel="stylesheet" type="text/css">
    <script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctx }/js/page.js" type="text/javascript"></script>
</head>
<body>
    <div class="panel panel-default">                    
        <div class="panel-heading">
            <ul class="breadcrumb">
              <li><span class="glyphicon glyphicon-home"></span> 员工管理</li>
              <li class="active">员工列表</li>
            </ul>
        </div>
		
		<div class="panel-body">
            <div class="subtt appearance-style">
            	<div class="col-md-10 mt10 text-left">
				<form class="form-inline">
					<div class="form-group">
				          <input type="text" class="form-control input-sm" id="name" placeholder="按名称查询" value="${param.name }"/>
			        </div>
			        <div class="form-group form-group-sm"> 
                        <label>入职时间</label>
                        <div class="input-group">
                        <input type="text" class="form-control Wdate" id="startTime" value="${param.startTime }" 
                            onFocus="WdatePicker({lang:'zh-cn'})">
                        <div class="input-group-addon">至</div>
                        <input type="text" class="form-control Wdate"  id="endTime" value="${param.endTime }" 
                            onFocus="WdatePicker({lang:'zh-cn'})">
                        </div>
                    </div> 
			        <div class="form-group">
					<input id="submit" class="btn btn-primary btn-sm" type="button" value="查询">
					</div>
				</form>
				</div>
                <div class="btn-group-sm mt10">
	                  <a class="btn btn-primary" href="${ctx }/employee/showAddEm"><i class="fa fa-plus"></i>新增员工</a>
                </div>
            </div>
            <table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
		                <th>员工编号</th>
		                <th>姓名</th>
			            <th>部门</th>
			            <th>职位</th>
			            <th>入职日期</th>
		                <th>操作</th>
			        </tr>
			    </thead>
			    <tbody id="contList">
			        <%-- <c:forEach items="${emList}" var="em">
			        <tr>
			            <td>${em.name }</td>
			            <td>${em.school}</td>
			           	<td><fmt:formatDate value="${em.birthday }" pattern="yyyy-MM-dd"/></td>
		                <td>
							<div class="btn-group" role="group" aria-label="...">
								<a id="look" href="${ctx }/employee/showDetail/${em.id }" class="btn btn-default btn-sm">查看</a>
								<a id="look" href="${ctx }/employee/showUpdate/${em.id }" class="btn btn-default btn-sm">修改</a>
								<a href="javascript:if(confirm('确实要删除该员工吗?'))location='${ctx }/employee/deleteEm/${em.id}'" class="btn btn-default btn-sm">删除</a>
							</div>
		                </td>
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
menu.active('#employee-list');
	$(function(){
		//查询
		var name = '';
		var startTime = '';
		var endTime = '';
		$('#submit').on('click',function(){
			name = $('#name').val();
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
	            url: '${ctx }/employee/showListByPage',
	            type: 'POST',
	            dataType: 'json',
	            data: {
	            	name: name,
	            	startTime: startTime,
	            	endTime: endTime,
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
	        });
	    }
		//返回、加载列表
	    function createTab(list) {
	        var data = list;
	        var html = '';
	        for (var i = 0, len = data.length; i < len; i++) {
	            html += '<tr>' +
	            	'<td>' + data[i].ee_id + '</td>' +
	            	'<td>' + data[i].name + '</td>' +
	            	'<td>' + data[i].department + '</td>' +
	            	'<td>' + data[i].job + '</td>' +
	            	'<td>' + formatDate(data[i].entry_date) + '</td>' +
	            	'<td>' +
	            		'<div class="btn-group" role="group" aria-label="...">' +
	            			'<a id="look" href="${ctx }/employee/showDetail/' + data[i].id + '" class="btn btn-default btn-sm">查看</a>' +
	            			'<a id="look" href="${ctx }/employee/showUpdate/' + data[i].id + '" class="btn btn-default btn-sm">修改</a>' +
	            			'<a onclick="isDelete(' + data[i].id + ')" class="btn btn-default btn-sm">删除</a>' +
	            		'</div>' +
	            	'</td></tr>';
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
		//删除
		isDelete = function(id){
			console.log(id);
			if(confirm('确实要删除该员工吗?')){
				window.location.href = '${ctx }/employee/deleteEm/'+id;
			}
		}
	});
</script>
</body>
</html>
