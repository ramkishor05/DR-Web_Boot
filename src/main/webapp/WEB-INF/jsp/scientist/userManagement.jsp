<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script
	src="${path}/assets/bootstrap/js/custom/validatorUserManagement.js"></script>
<div class="mid-box">
	<form name="document" id="updateProfileForm" method="POST"
		enctype="multipart/form-data" action="${path}/scientist/updateInfo"
		autocomplete="off">
		<div class="register-box clearfix">
			<h2 class="heading-box">Edit User Details</h2>
			<div class="inner-container">
				<%@ include file='/WEB-INF/jsp/comman/userManagement.jsp'%>
				<div class="form-submit">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" id="updateMyProfileBtn"
						class="btn btn-primary marR10">Submit</button>
					<a type="button" role="button" class="btn btn-secondary"
						href="${path}/scientist/welcomeScientist">Cancel</a>
				</div>
			</div>
		</div>
	</form>
</div>
