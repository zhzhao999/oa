<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script src="${ctx }/js/jquery.min.js"></script>
<script src="${ctx }/js/common.js"></script>
<script src="${ctx }/js/layer.js"></script>
<script src="${ctx}/static/legacy/js/bootstrap-validation/validate.js" type="text/javascript"></script>
<script src="${ctx}/static/legacy/js/bootstrap-validation/messages_zh.js" type="text/javascript"></script>
<script src="${ctx}/static/legacy/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx }/js/page.js"></script>

<link rel="stylesheet" href="${ctx}/static/legacy/js/jquery/jquery-ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">