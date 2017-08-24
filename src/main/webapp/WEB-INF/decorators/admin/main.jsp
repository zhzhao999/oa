<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<title><decorator:title default="采媒在线"/></title>

<script src="${ctx}/static/legacy/js/main.js" type="text/javascript"></script>
<script src="${ctx}/static/legacy/js/custom.js" type="text/javascript"></script><!-- 自定义：包含全选/取消全选脚本 -->
<link rel="stylesheet" href="${ctx}/static/legacy/css/bootstrap.min.css">
<link href="${ctx}/static/legacy/css/style.css" rel="stylesheet" />
<link href="${ctx}/static/legacy/css/usercenter.css" rel="stylesheet" />
<link href="${ctx}/static/legacy/css/menu.css" rel="stylesheet" /><!-- 头部和左侧菜单样式 -->
<link href="${ctx}/static/legacy/css/layer.css" rel="stylesheet" />

<style type="text/css">
.navbar-brand {width:500px;line-height: 70px;padding-left:170px;color:#fff;}
.breadcrumb {
  margin: 0;
  padding:0;
  background-color: transparent;
}

</style>
	
<decorator:head />

</head>

<body>
	
	<!-- Container -->
	<div class="container-fluid">
	
		<%@include file="/WEB-INF/decorators/admin/header.jsp" %>

		<!-- Row -->
		<div class="row mt20">

			<!-- 左侧内容 -->
			<div id="leftbar" class="col-md-2">
				<%@include file="/WEB-INF/decorators/admin/left.jsp" %>
			</div>
			<!-- / 左侧内容 -->

			<!-- 右侧内容 -->
			<div id="maincontent" class="col-md-10">
				<decorator:body />
			</div>
			<!-- / 右侧内容 -->

		</div>
		<!-- / Row -->

		<!-- footer -->
		<%@include file="/WEB-INF/decorators/admin/footer.jsp" %>
		<!-- /footer -->

	</div>
</body>
</html>