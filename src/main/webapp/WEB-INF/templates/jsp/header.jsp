<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="<%=request.getContextPath()%>" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="${path}/assets/images/favicon.ico">
<link href="${path}/assets/css/style.css" rel="stylesheet">
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<meta charset="utf-8">
<!--Meta Tag-->
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta name="format-detection" content="telephone=no">
<script src="${path}/assets/js/jquery.min.js"></script>
<form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>

<header class="header">
        <div class="top-header">
            <figure class="header-pic1"><img src="${path}/assets/images/drdo_logo.jpg"/></figure>
            <figure class="header-flag"><img src="${path}/assets/images/flag.png"/></figure>
            <figure class="header-pic2"><img src="${path}/assets/images/subhash-bhamre.jpg"/></figure>
            <figure class="header-pic2"><img src="${path}/assets/images/nirmala-sitharaman.jpg"/></figure>
        </div>        
    </header>

 <%--  <header class="header">
        <div class="top-header">
            <figure class="header-pic1"><img src="${path}/assets/images/nirmala-sitharaman.jpg"/></figure>
            <figure class="header-flag"><img src="${path}/assets/images/flag.png"/></figure>
            <figure class="header-pic2"><img src="${path}/assets/images/subhash-bhamre.jpg"/></figure>
        </div>
        <nav>
        	<c:choose>
	        	<c:when test="${pageContext.request.isUserInRole('ADMIN')}">
	            	<ul>                
		                <li><a href="${path}/admin/welcomeAdmin">Home</a></li>
		                <li><a href="${path}/admin/registerUser">New User</a></li>
		                <li><a href="${path}/admin/resetPassword.html">Reset Password</a></li>
		                <li><a href="${path}/admin/getUserList">User Detail</a></li>
		                <li><a href="${path}/admin/createGroup">Group</a></li>
		                <li><a href="${path}/admin/getLoginLog">Login Summary</a></li>
		                <li><a href="${path}/admin/deptMgmt">Department Management</a></li>
		                <li><a href="javascript:formSubmit()">Logout</a></li>
		            </ul>
		           </c:when>
		           <c:when test="${pageContext.request.isUserInRole('ROLE_CHIEF_ZONAL_COMMISSIONER')}">
		           	<ul>                
		                <li><a href="${path}/deptHead/welcomeDeptHead">Home</a></li>
		                <li><a href="${path}/deptHead/userManagement">Profile</a></li>
		                <li><a href="${path}/zone/resetPassword.html">Reset Password</a></li>
		                <li><a href="javascript:formSubmit()">Logout</a></li>
		            </ul>
	           </c:when>
          </c:choose>
        </nav>
    </header> --%>

<script>

	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
