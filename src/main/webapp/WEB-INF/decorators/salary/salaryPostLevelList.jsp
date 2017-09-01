<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>

<!doctype html>
<html>
<head>
    <title>薪资管理</title>
	<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<link href="${ctx }/css/pager.css" rel="stylesheet" type="text/css">
    <script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="${ctx }/js/page.js" type="text/javascript"></script>
</head>
<body>
    <div class="panel panel-default">                    
        <div class="panel-heading">
            <ul class="breadcrumb">
              <li><span class="glyphicon glyphicon-home"></span> 薪资管理</li>
              <li class="active">岗位级别</li>
            </ul>
        </div>
		
		<div class="panel-body">
            <div class="subtt appearance-style">
            	<div class="col-md-10 mt10 text-left">
				<form class="form-inline">
					<div class="form-group">
				          <input type="text" class="form-control input-sm" id="type_name" placeholder="按级别查询" />
			        </div>
			        <div class="form-group">
					<input id="submit" class="btn btn-primary btn-sm" type="button" value="查询">
					</div>
				</form>
				</div>
            </div>
            <table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
		                <th>级别</th>
			            <th>岗位工资</th>
			            <th>上升比例</th>
			            <th>绩效工资</th>
			            <th>绩效/岗位占比</th>
			            <th>满勤奖</th>
			            <th>小计</th>
			            <th>操作</th>
			        </tr>
			    </thead>
			    <tbody id="contList">
			    </tbody>
			</table>
			<div class="page_number clearfix myPager" id="myPager">
		        <a class="PageButton prev fl" data-val="prev"><i class="icon-iconfont-zuosanjiao"></i>上一页</a>
		        <ul>
		        </ul>
		        <a class="PageButton next fr" data-val="next">下一页<i class="icon-iconfont-yousanjiao"></i></a>
		        <div class="count fr" id="count">共<em>0</em>条</div>
		     </div>
        </div>
	</div>
<script type="text/javascript">
menu.active('#salary-post-list');
	$(function(){
		//查询
		var type_name = '';
		$('#submit').on('click',function(){
			type_name = $('#type_name').val();
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
	            url: '${ctx }/salary/dict/postLevel/showListByPage',
	            type: 'POST',
	            dataType: 'json',
	            data: {
	            	type_name: type_name,
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
	            	'<td>' + data[i].type_name + '</td>' +
	            	'<td>' + data[i].post_salary + '</td>' +
	            	'<td>' + data[i].up_ratio + '</td>' +
	            	'<td>' + data[i].merit_pay + '</td>' +
	            	'<td>' + data[i].merit_ratio + '</td>' +
	            	'<td>' + data[i].full_award + '</td>' +
	            	'<td>' + data[i].total + '</td>' +
	            	'<td>' +
	            		'<div class="btn-group" role="group" aria-label="...">' +
	            			'<a id="look" href="${ctx }/salary/dict/postLevel/showUpdate/' + data[i].id + '" class="btn btn-default btn-sm">修改</a>' +
	            		'</div>' +
            		'</td>'+
	            	'</tr>';
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
	});
</script>
</body>
</html>
