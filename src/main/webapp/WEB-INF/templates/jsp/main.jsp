<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${path}/assets/bootstrap/css/bootstrap.min.css">
    <link href="${path}/assets/css/style.css" rel="stylesheet">
    <%-- <script src="${path}/assets/js/jquery.min.js"></script> --%>
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="header" />
</head>
<body>
	<section class="main">
       <tiles:insertAttribute name="leftnav" />
		<!-- <section class="main__middle__container typo"> -->
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="rightnav" />
		<tiles:insertAttribute name="footer" />
        
    </section>
	<script src="${path}/assets/js/bootstrap.min.js"></script>
	<%-- <script src="${path}/assets/js/jquery.marquee.min.js"></script>
	<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
	<script src="${path}/assets/js/custom.js"></script> --%>
</body>
</html>