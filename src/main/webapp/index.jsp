<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>" />
<%-- Redirected because we can't set the welcome page to a virtual URL. --%>
<c:redirect url="/login.html"/>