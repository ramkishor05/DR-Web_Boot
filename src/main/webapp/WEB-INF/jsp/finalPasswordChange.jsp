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
    <script src="${path}/assets/js/jquery.hotkeys.js"></script>
</head>
<body>

<div class="mid-box">
        <div class="login-box">
            <h2>Reset Password</h2>
            <form:form method="post" action="${path}/resetPassword/complete" id="resetPasswordFormFinal" novalidate="" modelAttribute="resetPasswordFormFinal">
            <div class="inner-container">
                <div class="form-group">
                    <input id="resetPasswordaccountid" name="token" type="hidden" value="${param.token}"></input>
                  	<label class="control-label marB10" for="password">New Password</label>
	                  <input type="password" name="password" id="resetPasswordpassword" class="form-control"  maxlength="30" value="" aria-required="true">
	                  <span id="password-hint" class="help-block" style="display: none;color: #a94442;">Password Should have minimum 8 and maximum 15 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character.</span>
                </div>
                <div class="form-group">
                	<label class="control-label marB10">Confirm Password</label>
                  	<input type="password" name="confpassword" id="resetPasswordconfpassword" onkeyup="checkPasswordFinal();" class="form-control" maxlength="30" value="" aria-required="true">
                </div>
                <div class="form-submit">
					<button type="button" id="resetPasswordbtnfinalStep" onclick="validateUpdatePasssword();" class="btn btn-yellow btn-lg btn-block">Reset</button>
				</div>
            </div>   
            </form:form>            
        </div>
    </div>

</body>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/jquery.marquee.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>

<script src="${path}/assets/js/custom.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorResetPassword.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
<script>
$(document).ready(function(){
	/* $("#resetPasswordbtnfinalStep").on("click", function () {
	    if($("#resetPasswordpassword").valid() && $("#resetPasswordconfpassword").valid()){ 
		  document.getElementById("resetPasswordFormFinal").submit();
		}
	}); */
}); 

 function checkPasswordFinal(){
	if(jQuery("#resetPasswordpassword").val() != jQuery("#resetPasswordconfpassword").val()){
	 jQuery("#resetPasswordpassword").attr('style',"border-color: #ff0000;");
	 jQuery("#resetPasswordconfpassword").attr('style',"border-color: #ff0000;");
	 jQuery("#confpassfinal").html('Password and Confirm Password Should be same!!');
	  
	}else{
	 jQuery("#resetPasswordpassword").attr('style',"border-color: #3c763d");
	 jQuery("#resetPasswordconfpassword").attr('style',"border-color: #3c763d;");
	 jQuery("#confpassfinal").html('');
	}
}

function validateUpdatePasssword(){
	 if($("#resetPasswordpassword").valid() && $("#resetPasswordconfpassword").valid() && ($("#resetPasswordpassword").val() === $("#resetPasswordconfpassword").val())){
		 $("#resetPasswordpassword").removeAttr('style');
		 $("#resetPasswordconfpassword").removeAttr('style');
		 document.getElementById("resetPasswordFormFinal").submit();
     }else{
   		if(!$("#resetPasswordpassword").valid() || $("#resetPasswordpassword").val()===''){
   			$("#resetPasswordpassword").focus();
   		}else if(!$("#resetPasswordconfpassword").valid() || $("#resetPasswordconfpassword").val()===''){
   			$("#resetPasswordconfpassword").focus();
   		}else if($("#resetPasswordpassword").val() != $("#resetPasswordconfpassword").val()){
   			$("#resetPasswordconfpassword").focus();
   		}
   		$("#resetPasswordpassword").attr("onkeyup","checkPasswordFinal()");
   		$("#resetPasswordpassword").attr('style',"border-color: #ff0000;");
	 	$("#resetPasswordconfpassword").attr('style',"border-color: #ff0000;");
	 	$("#confpassfinal").html('New Password and Confirm Password should be same.');
     } 
 }

</script>
</html>