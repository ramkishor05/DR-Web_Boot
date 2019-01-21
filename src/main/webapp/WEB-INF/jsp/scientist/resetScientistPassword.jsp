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
	<script src="${path}/assets/jquery/jquery.min.js"></script>
	<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
	<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
	<script src="${path}/assets/js/moment-with-locales.js"></script>
	<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
	<script src="${path}/assets/material-charts/js/material-charts.js"></script>
	<script src="${path}/assets/bootstrap/js/common.js"></script>
	<script src="${path}/assets/js/commonAjax.js"></script>
</head>

	<div class="mid-box">
        <div class="login-box">
            <h2>Reset Password </h2>
            <form:form method="post" action="${path}/scientist/resetPasswordSubmit" novalidate="" id="resetPasswordFormSecure" modelAttribute="resetPasswordFormFinal">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="inner-container">
                <div class="form-group">
                  <input id="resetPasswordaccountid" name="token" type="hidden" value="${param.token}"></input>
                                 <label for="resetPasswordpassword" class="control-label">New Password</label>
                                 <input class="form-control" id="resetPasswordpassword" name="password" value="${zoneName}" type="password">
                </div>
                <div class="form-group">
                    <label for="resetPasswordconfpassword" class="control-label">Confirm Password</label>
                    <input class="form-control" name="confpassword" value="${comment}" id="resetPasswordconfpassword" onkeyup="checkPasswordFinal();" type="password">
                </div>
                 <div class="col-md-12">
                             	<span id="confpassfinal" class="text-danger"></span>
                             </div>
                <div class="form-submit">
                
                    <a type="button" role="button" class="btn btn-secondary" href="${path}/deptHead/welcomeDeptHead">Cancel</a>
                                <button type="button" id="resetPasswordbtnfinalStep" onclick="validateUpdatePasssword();" class="btn btn-primary">Submit</button>
                             
                </div>
            </div>   
             </form:form>             
        </div>
    </div>
      
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorResetPassword.js"></script>
<script>
$(document).ready(function(){
	var path = '${path}';
	commonReady(path);
	
	/* $("#resetPasswordbtnfinalStep").on("click", function () { 
	    if($("#resetPasswordFormSecure").valid()){ 
		  document.getElementById("resetPasswordFormSecure").submit();
		}
	}); */
}); 

function checkPasswordFinal(){
	if($("#resetPasswordpassword").val() != $("#resetPasswordconfpassword").val()){
	 $("#resetPasswordpassword").attr('style',"border-color: #ff0000;");
	 $("#resetPasswordconfpassword").attr('style',"border-color: #ff0000;");
	 $("#confpassfinal").html('New Password and Confirm Password should be same.');
	  
	}else{
	 $("#resetPasswordpassword").attr('style',"border-color: #3c763d");
	 $("#resetPasswordconfpassword").attr('style',"border-color: #3c763d;");
	 $("#confpassfinal").html('');
	}
}

function validateUpdatePasssword(){
	 if($("#resetPasswordpassword").valid() && $("#resetPasswordconfpassword").valid() && ($("#resetPasswordpassword").val() === $("#resetPasswordconfpassword").val())){
		 $("#resetPasswordpassword").removeAttr('style');
		 $("#resetPasswordconfpassword").removeAttr('style');
		 document.getElementById("resetPasswordFormSecure").submit();
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
