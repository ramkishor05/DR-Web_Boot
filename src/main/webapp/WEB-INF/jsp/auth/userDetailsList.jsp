<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/js/jspdf.min.js"></script>
<script src="${path}/assets/js/jspdf.plugin.autotable.min.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/jquery.marquee.min.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
var page = '${param["page"]}';
var pages = '${pages}'
function createForm(profileId) {
	var formObject = document.forms['profileForm'];
	// Create new field
	var newField = document.createElement('input');
	newField.type = 'hidden';
	newField.id = 'profileId';
	newField.name = 'profileId';
	newField.value = profileId;
	document.forms['profileForm'].appendChild(newField);
	document.forms['profileForm'].submit();
}
function createDeleteForm(profileId) {
	var formObject = document.forms['deleteUserForm'];
	// Create new field
	var newField = document.createElement('input');
	newField.type = 'hidden';
	newField.id = 'profileId';
	newField.name = 'profileId';
	newField.value = profileId;
	document.forms['deleteUserForm'].appendChild(newField);
	document.forms['deleteUserForm'].submit();
}
function csrfSafeMethod(method) {
      // these HTTP methods do not require CSRF protection
      return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  	}
$(document).ready(function() {
	/****************************/
	if("${userUpdateStatus}" === "SUCCESS"){
		showUpdateConfirmationModal();
	}
	/***********************/
   	var path = '${path}';
   	var a_elements = $("#table-content").find("li");
   	for (var i = 0, len = a_elements.length; i < len; i++ ) {
   	if(Number(page)===i){
   	console.log($(a_elements[ Number(page)+1 ]).addClass('active'));
   	}
  		}
   	console.log(path,page,pages);
	commonReady(path);
	
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
	  $( ".next" ).click(function() {
	  console.log(Number(page)>Number(pages));
	  if(Number(page)<Number(pages)-1){
	  var number= Number(page)+1;
	  window.location='${path}/admin/getUserList?page='+number;
	  }
		 
	});
	 $( ".previous" ).click(function() {
		  console.log(Number(page),Number(pages));
		  if(Number(page)<Number(pages)){
		  var number= Number(page)-1;
		  if(number<0){
		  }else{
		  window.location='${path}/admin/getUserList?page='+number;
		  }
		  }
	}); 
	
	$("#download-btn").on('click',function(){
		var head = $("#heading").text();
		pdfFromHTML(head);
	});
	
	showHidePagination();
});
	 
    
    

</script>
</head>
<form name="profileForm" method="POST" action="${path}/admin/userManagement">

  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>
<form name="deleteUserForm" method="POST" action="${path}/admin/deleteUser">

  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>
	<div class="mid-box">
	 <div class="register-box clearfix">
	                    <div class="block-title">
	                         <h2 class="heading-box">User List</h2>
	                    </div>
	                    <div id="table-content" class="block-content padBlock">
							<div class="responsive-table">
	                        <table class="table table-border-bottom">
	                            <thead>
	                                <tr>
	                                    <th class="w5">S.No.</th>
	                                    <th class="w10 text-left">User Name</th>
	                                    <th class="w10 text-left">Full Name </th>
	                                    <th class="w5 text-left">Designation</th>
	                                    <th class="w5 text-left">Department</th>
	                                    <!-- <th class="w10 text-left">Email</th> -->
	                                    <th class="w10 text-left">Phone</th>
	                                    <th class="w10 text-left">Last Login</th>
	                                    <th class="w10 text-left actions noPdf">Actions</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach items="${users}" var="user" varStatus="counter">
		                             	<%--<c:forEach items="${user.loginInfoCollection}" var="loginInfo" >
		                             		<c:set var="activeStatus" value="${loginInfo.active}"></c:set>
				                             <c:if test="${fn:containsIgnoreCase(activeStatus,'Y')}"> --%>
				                                <tr>
				                                    <td>${counter.index+1 + param["page"]*10}</td>
				                                    <td>${user.profileId.userName}</td>
				                                    <td>${user.profileId.firstName} ${user.profileId.lastName}</td>
				                                    <td>${user.profileId.basicDetail.designation}</td>
				                                    <td>${user.profileId.departmentId.deptName}</td>
				                                    <%-- <td>${user.profileId.email}</td> --%>
				                                    <td>${user.profileId.phone}</td>
				                                    <td>${user.lastLogin}</td>
				                                    <td>
				                                        <a class='icon edit' href='javascript:createForm(${user.profileId.profileId});'>Edit</a>
				                                        <%-- <a class="icon delete" href="javascript:createDeleteForm(${user.profileId});"></a> --%>
				                                        | <a class="icon delete" href="javascript:showDeleteModal(${user.profileId.profileId});">Delete</a>
				                                    </td>
				                                </tr>
			                               <%--  </c:if>
		                              	</c:forEach>  --%>
	                            	</c:forEach>
								</tbody>
	                        </table>
							</div>
	                        <div aria-label="Page navigation" class="pagination-nav text-center">
	                            <ul class="pagination marB0">
	                                <li class="previous">
	                                    <a href="javascript:void(0)" aria-label="Previous">
	                                        <span aria-hidden="true"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></span>PREV
	                                    </a>
	                                </li>
	                                <c:forEach begin="1" end="${pages}" varStatus="loop">
	                                <li class=""><a href="${path}/admin/getUserList?page=${loop.index-1}">${loop.index}</a></li>
	                                </c:forEach>
	                                <li class="next">
	                                    <a href="javascript:void()" aria-label="Next">
	                                       NEXT <span aria-hidden="true"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></span>
	                                    </a>
	                                </li>
	                            </ul>
	                        </div>
	
	                    </div>
	
	                </div>
	            </div>

<!-- Success  Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="updateConfirmModal" aria-labelledby="updateConfirmModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="confirmUpdateModal">Confirm Update</h4>
			</div>
			<div class="modal-body">
				<p>User has been successfully updated</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Success  Modal -->

<!-- Delete Confirm  Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="deleteConfirmModal" aria-labelledby="confirmDeleteModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="confirmDeleteModal">Confirm Delete</h4>
			</div>
			<div class="modal-body">
				<p>Are you sure that you want to delete this user?</p>
			</div>
			<div class="modal-footer">
				<button type="button" id="deleteBtn" class="btn btn-default">Yes, Delete</button>
	            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Delete Confirm  Modal -->

<script>
function showUpdateConfirmationModal() {
 $('#updateConfirmModal').modal({
 backdrop: 'static',
 keyboard: false
 })
}

 function showDeleteModal(profileId) {
 	$("#deleteBtn").attr("onclick","createDeleteForm("+profileId+");");
    $('#deleteConfirmModal').modal({
        backdrop: 'static',
        keyboard: false
    })
 }
</script>