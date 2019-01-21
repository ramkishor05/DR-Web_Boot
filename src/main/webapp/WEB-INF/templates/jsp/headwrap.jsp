<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
<div style="text-align: right;padding-right: 1cm;padding-top: 15px;">

<c:choose>
<c:when test="${pageContext.request.userPrincipal.name != null}">
		<a href="javascript:formSubmit()" style="display:inline">Logout</a> | Welcome, ${pageContext.request.userPrincipal.name} 

</c:when>
<c:otherwise>


               <a href="/login.html">Login</a>
              
</c:otherwise>
</c:choose>

</div>
