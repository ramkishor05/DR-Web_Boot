<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="path" value="<%=request.getContextPath()%>" />
 <script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
 <script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
 function csrfSafeMethod(method) {
      // these HTTP methods do not require CSRF protection
      return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  	}
		 
	$(document).ready(function() {
		var path = '${path}';
		commonReady(path);
		var csrfToken = $("meta[name='_csrf']").attr("content") ? $("meta[name='_csrf']").attr("content") : $("input[name=_csrf]").val();
		var csrfHeader = $("meta[name='_csrf_header']").attr("content"); 
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
		loadCurrentThought(path);
		$('#sendThought').click(function(){
			var thought={};
			thought['desciption']=$('#description').val();
			thought['thoughtId']=$('#thoughtId').val();
			
			if($('#sendThought').val()=='Edit'){
				$.ajax({
				     type  :   'POST',
				     url   :   '${path}/dashboard/updateThought', 
				     dataType: 'json',
				     contentType: 'application/json; charset=utf-8',
				     data: JSON.stringify(thought),
				     success  :  function(res,rr){
				    	 loadCurrentThought(path);
				    	 showConfirmModal();
				     },
				     error: function(error){
				     	console.log("error",error);
				     }
				});
			}else{
				$.ajax({
				     type  :   'POST',
				     url   :   '${path}/dashboard/addThought', 
				     dataType: 'json',
				     contentType: 'application/json; charset=utf-8',
				     data: JSON.stringify(thought),
				     success  :  function(res,rr){
				    	 loadCurrentThought(path);
				    	 showConfirmModal();
				     },
				     error: function(error){
				     	console.log("error",error);
				     }
				});
			}
		})
	});
	
	function showConfirmModal() {
	       $('#confirmModal').modal({
	           backdrop: 'static',
	           keyboard: false
	       })
		}
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
          <h4>Today's Thought </h4>
         <div style="font-size:16px;"><span style="font-size:24px;"></span>
         	<div id="thought_view"></div><span style="font-size:24px;"></span>
             <button class="btn btn-secondary" style="margin-top:10px;margin-bottom:20px;" id="editThought">Edit</button>
         </div>
         <div id="thoughtform" class="col-md-12">
         	<div class="col-md-11">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" id="thoughtId" name="thoughtId" value="" />
            <textarea id="description" class="form-control"></textarea>
            </div>
            <div class="col-md-1">
             <button class="btn btn-primary" id="sendThought">Add</button>
             </div>
          </div>
         <br>
          <h1><c:if test="${day eq 'Fri' ||day eq 'Sat' || day eq 'Sun'}">Happy weekend.</c:if></h1>
          </div>
         </div>                
     </div>
 </div>
 
<!-- Confirm  Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="confirmModal">Thought Updated</h4>
                </div>
                <div class="modal-body">
                	Thought is successfully updated.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
   <!-- Confirm  Modal -->