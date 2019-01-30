<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<link href="${path}/assets/material-charts/css/material-charts.css"
	type="text/css" rel="stylesheet" media="screen">
<%-- <script src="${path}/assets/jquery/jquery.min.js"></script>

<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>

<script src="${path}/assets/js/bootstrap.min.js"></script>
 --%>
 <script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
 <script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorBasicDetails.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
 function csrfSafeMethod(method) {
      // these HTTP methods do not require CSRF protection
      return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  	}
		
	$(document).ready(function() {
		var path = '${path}';
		
		$.ajaxSetup({
		      beforeSend: function(xhr, settings) {
		       //alert('Before Sending AJAX : csrftoken -> ' + csrfToken);
		       //alert(csrfParameter + ' --- ' + csrfHeader + ' --- ' + csrfToken);
		          if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
		              xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		          }
		          xhr.setRequestHeader("Content-Type","application/json");
		          xhr.setRequestHeader("Accept","text/json");
		      }
		  }); 
	});
</script>

<div class="mid-box">
     <div class="inner-page clearfix">
         <h2 class="heading-box capitalize">Welcome <span>
         <c:choose>
        	<c:when test="${profile.prefix eq 'MR'}">Mr.</c:when>
        	<c:when test="${profile.prefix eq 'MRS'}">Mrs.</c:when>
        	<c:when test="${profile.prefix eq 'MS'}">Ms.</c:when>
        	<c:when test="${profile.prefix eq 'DR'}">Dr.</c:when>         
         </c:choose> ${profile.firstName} ${profile.lastName}</span></h2>
         <div class="inner-container welcome-msg">
             <h2>
             <fmt:formatDate type="time" var="time" value="${today}" pattern="H"/>
          	<fmt:formatDate type="time" var="day" value="${today}" pattern="E"/>
             <c:choose>
		          <c:when test="${time lt 12}">
		          	Good Morning
		          </c:when>
		          <c:when test="${(time gt 12) and (time lt 16)}">
		          	Good Afternoon
		          </c:when>
		          <c:otherwise>
		          Good Evening
		          </c:otherwise>
	          </c:choose></h2>
	          <p>Thanks for visiting DRDO INMAS Online Portal.</p>
	          <div>  
	      	<p>
          
          <br><br>
         <h4>Today's Thought</h4>
         <div style="font-size:16px;"><span style="font-size:24px;"></span>
         	<div id="thought_view"></div><span style="font-size:24px;"></span>
         </div>
         <br>
          <h1><c:if test="${day eq 'Fri' ||day eq 'Sat' || day eq 'Sun'}">Happy weekend.</c:if></h1>
          </div>
         </div>                
     </div>
 </div>

<div class="modal fade" tabindex="-1" role="dialog" id="basicDetailModal" aria-labelledby="modalLabel">
	<form  name="welcomeProfileBean" id="welcomeProfileBeanForm"  method="POST" action="${path}/division/updateBasicDetails">
	   <%@ include file='/WEB-INF/jsp/comman/welcome_model.jsp' %>>
	</form>
</div>
