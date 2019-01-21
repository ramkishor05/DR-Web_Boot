<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />

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
    <script src="${path}/assets/js/bootstrap.min.js"></script>
	<script src="${path}/assets/js/jquery.marquee.min.js"></script>
	<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
	<script src="${path}/assets/js/custom.js"></script> 
</head>   
    <div class="mid-box">
        <div class="login-box">
            <h2>Login</h2>
            <form name='loginForm' id="loginForm" action="<c:url value='/login' />" method='POST'>
            <div class="inner-container">
                <div class="form-group">
                    <label for="accountid" class="control-label">Username</label>
                    <input type="text" name="userId" id="userId" class="form-control" aria-describedby="userId-error">
                    <div class="col-md-12 marL70">
                    	<span id="userId-error" class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control" aria-describedby="password-error">
                    <div class="col-md-12 marL70">
                    	<span id="password-error" class="help-block"></span>
                    </div>
                </div>
                <div class="form-submit">
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="button" class="btn btn-primary marR10" type="button" id="loginBtn">Sign In</button>
                    <a type="button" href="${path}/forgotpassword" role="button" class="btn btn-secondary">Forgot Password</a>
                </div>
            </div>   
            </form>             
        </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${path}/assets/js/bootstrap.min.js"></script>
    <script src="${path}/assets/js/jquery.marquee.min.js"></script>
	<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
    <script src="${path}/assets/js/custom.js"></script>
    <script src="${path}/assets/bootstrap/js/custom/validatorLogin.js"></script>
    <script>
    	$(document).ready(function(){
    		$('#loginBtn').on('click',function(){
    			submitForm();
    		});
    		
    		$('#loginForm').keydown(function(e) {
    			var key = e.which;
    			if (key == 13) {
    				submitForm();
    			}
   			});
    	})
    	function submitForm(){
    		if($("#userId").valid() && $("#password").valid()){
				document.getElementById("loginForm").submit();
			}
    	}
    </script>