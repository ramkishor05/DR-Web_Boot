<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/jquery.marquee.min.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
$(document).ready(function() {
    	var path = '${path}';
		commonReady(path);
});
</script>
</head>
<body>
<div class="mid-box">
		<div class="login-box">
			<div class="inner-container">
				<div class="message-block padBlock text-center">
					<h1 class="">
						<i class="far fa-thumbs-up"></i>Success!
					</h1>
				</div>
				<div class="marT30 padBlock text-center">
					<c:choose>
						<c:when test="${pageContext.request.isUserInRole('ADMIN')}">
							<button type="button" id="backButton" class="btn btn-default"
								onclick="window.location='${path}/admin/welcomeAdmin'">Home</button>
						</c:when>
						<c:when
							test="${pageContext.request.isUserInRole('ROLE_CHIEF_ZONAL_COMMISSIONER')}">
							<button type="button" id="backButton" class="btn btn-default"
								onclick="window.location='${path}/deptHead/welcomeDeptHead'">Home</button>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>