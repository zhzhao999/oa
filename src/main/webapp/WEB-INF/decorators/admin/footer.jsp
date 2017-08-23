<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- footer -->   
<div id="footer" class="row footer" style="padding: 10px 0;">
  <div class="container">
    <div class="footer_top"></div>
    <div class="footer-bottom text-center">
        Copyright <span class="glyphicon glyphicon-copyright-mark"></span> <fmt:formatDate value="${now }" pattern="yyyy"/> 北京媒立方传媒科技有限公司
    </div>
  </div>
</div>

<script type="text/javascript">

$(function() {
	
    $(document).ajaxStart(function() {
        $('#loading').show();
    }).ajaxStop(function() {
        $('#loading').hide();
    });
    
    if ($(document).height() > $(window).height()) {
    	$('#scrollUp').show();
    } else {
    	$('#scrollUp').hide();
    };
    
});
</script>