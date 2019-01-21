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
    
</head>
<div class="mid-box">
        <div class="login-box">
        	<div class="inner-container">
				<div class="message-block padBlock text-center">
	  				<h1 class=""><i class="far fa-thumbs-up"></i>Success!</h1>
				</div>
				<div class="marT30 padBlock text-center">
					<button type="button" id="backButton" class="btn btn-default" onclick="window.location='${path}/'">Home</button>
				</div>         
	        </div>
	     </div>
    </div>

