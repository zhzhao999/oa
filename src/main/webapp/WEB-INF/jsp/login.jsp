<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OA登录</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/css/htmleaf-demo.css">
	
	<link href="${ctx}/static/legacy/css/login.css" rel="stylesheet" />
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h2>人资档案系统</span></h1>
		</header>
		<div class="demo form-bg" style="padding: 20px 0;">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-offset-3 col-md-6">
		                    <form class="form-horizontal" action="${ctx }/user/login" method="post">
		                    	<div class="heading">用户登录</div>
		                        <div class="form-group">
		                            <input name="name"  class="form-control" id="inputEmail3" placeholder="用户名">
		                            <i class="fa fa-user"></i>
		                        </div>
		                        <div class="form-group help">
		                            <input name="password" type="password" class="form-control" id="inputPassword3" placeholder="密　码">
		                            <i class="fa fa-lock"></i>
		                            <a href="#" class="fa fa-question-circle"></a>
		                        </div>
		                        <div class="form-group">
		                            <!--<div class="main-checkbox">
		                                 <input type="checkbox" value="None" id="checkbox1" name="check"/>
		                                <label for="checkbox1"></label>
		                            </div> --> 
		                            <span class="text"><font color="red" size="3">${errorMsg}</font></span>
		                            
		                            <button type="submit" class="btn btn-default">登录</button>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="related"></div>
	</div>
</body>
</html>