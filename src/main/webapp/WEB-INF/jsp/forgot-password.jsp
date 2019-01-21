<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${path}/assets/images/favicon.ico">
    <title>Dashboard</title>
    <!-- Custom styles for this template -->
    <link href="${path}/assets/css/style.css" rel="stylesheet">
    <script src="${path}/assets/js/jquery.min.js"></script>
    <script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
    <script src="${path}/assets/js/jquery.hotkeys.js"></script>

</head>

<body>
 	<div class="mid-box">
        <div class="login-box">
            <h2>Forgot Password</h2>
            <form method="post" action="${path}/resetPassword/init" novalidate="" name="resetPasswordForm" id="resetPasswordForm" modelAttribute="resetPasswordForm">
            <div class="inner-container">
                <div class="form-group">
                    <label for="userName" class="control-label marB10">Email address</label> (Email Address used to register)
                    <input id="userName" name="userName" class="form-control"  value="" aria-required="true">
                </div>
                <div class="form-group">
                    <label for="dob" class="control-label marB10">Date of Birth</label>
                  	<input type="text" name="dob" id="dob" name="dob" class="form-control" value="" placeholder="YYYY-MM-DD">
                </div>
                <div class="form-submit">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <button type="button" id="resetPasswordbtn" class="btn btn-yellow" style="width:150px;">Submit</button>
                <button type="button" id="backButton" class="btn btn-yellow" style="width:150px;" onclick="javascript:window.history.back();">Back</button>
                </div>
            </div>   
            </form>             
        </div>
    </div>
   
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/jquery.marquee.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/js/custom.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorForgetPassword.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript">

$("#resetPasswordbtn").on("click", function () {
	   if(jQuery("#userName").valid() && jQuery("#dob").valid()){
	  document.getElementById("resetPasswordForm").submit();
	   }
  }); 

</script>
</html>
