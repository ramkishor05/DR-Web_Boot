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
		//var flag="${showModal}";
		//if(flag){
			showModal();
		//}
		
		$('#updateMyProfileBtn').on('click',function(){
   			if($("#updateBasicDetailsForm").valid()){
   				document.getElementById("updateBasicDetailsForm").submit();
   			}
		});
		loadCurrentThought(path);
		
		function showModal() {
			if("${columnFlag}"==="false"){
				 $('#basicDetailModal').modal({
			        backdrop: 'static',
			        keyboard: false
			    })
			}
		 }
	});
</script>

<div class="mid-box">
	<div class="inner-page clearfix">
		<h2 class="heading-box capitalize">
			Welcome <span> <c:choose>
					<c:when test="${profile.prefix eq 'MR'}">Mr.</c:when>
					<c:when test="${profile.prefix eq 'MRS'}">Mrs.</c:when>
					<c:when test="${profile.prefix eq 'MS'}">Ms.</c:when>
					<c:when test="${profile.prefix eq 'DR'}">Dr.</c:when>
				</c:choose> ${profile.firstName} ${profile.lastName}
			</span>
		</h2>
		<div class="inner-container welcome-msg">
			<h2>
				<fmt:formatDate type="time" var="time" value="${today}" pattern="H" />
				<fmt:formatDate type="time" var="day" value="${today}" pattern="E" />
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
				</c:choose>
			</h2>
			<p>Thanks for visiting DRDO INMAS Online Portal.</p>
			<div>
				<p>
					<br>
					<br>
				<h4>Today's Thought</h4>
				<div style="font-size: 16px;">
					<span style="font-size: 24px;"></span>
					<div id="thought_view"></div>
					<span style="font-size: 24px;"></span>
				</div>
				<br>
				<h1>
					<c:if test="${day eq 'Fri' ||day eq 'Sat' || day eq 'Sun'}">Happy weekend.</c:if>
				</h1>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" tabindex="-1" role="dialog"
	id="basicDetailModal" aria-labelledby="modalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="modalLabel">Basic Details</h4>
			</div>
			<form name="welcomeProfileBean" id="updateBasicDetailsForm" method="POST"
				action="${path}/scientist/updateBasicDetails">
				<input name="profileId" value="${profile.profileId}" type="hidden"
					class="form-control">
				<input name="address.addressId" value="${profile.addressId.addressId}" type="hidden"
					class="form-control">
				<input name="basicDetail.basicDetailId" value="${profile.basicDetail.basicDetailId}" type="hidden"
					class="form-control">
				<div class="modal-body">
					<p>Please verify your information and update it if needed.</p>
					<h4>Personal Information</h4>
					<div class="row">
						<div class="form-group col-md-3 col-xs-12">
							<span style="color: red">*</span><label class="control-label">Prefix</label>
							<select name="prefix" id="prefix" class="form-control">
								<option value="" selected disabled>Select prefix</option>
								<option value="MR"
									<c:if test="${profile.prefix eq 'MR'}">selected</c:if>>Mr.</option>
								<option value="MRS"
									<c:if test="${profile.prefix eq 'MRS'}">selected</c:if>>Mrs.</option>
								<option value="MS"
									<c:if test="${profile.prefix eq 'MS'}">selected</c:if>>Ms.</option>
								<option value="DR"
									<c:if test="${profile.prefix eq 'DR'}">selected</c:if>>Dr.</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<label for="firstName" class="control-label"><span
								style="color: red">*</span>First Name</label> <input name="firstName"
								id="firstName" value="${profile.firstName}" type="text"
								class="form-control">
						</div>
						<div class="form-group col-md-3">
							<label for="lastName" class="control-label">Middle Name</label> <input
								type="text" name="middleName" value="${profile.middleName}"
								id="middleName" class="form-control" placeholder="">
						</div>
						<div class="form-group col-md-3">
							<label for="lastName" class="control-label"><span
								style="color: red">*</span>Last Name</label> <input type="text"
								name="lastName" value="${profile.lastName}" id="lastName"
								class="form-control" placeholder="">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-4 col-xs-12">
							<span style="color: red">*</span><label class="control-label">D.O.B.</label>
							<input type="text" class="form-control datepicker-input"
								autocomplete="off" name="dateOfBirth"
								value="<fmt:formatDate value="${profile.dateOfBirth}" pattern="yyyy-MM-dd" />" id="birthDay"
								placeholder="YYYY-MM-DD">
						</div>
						<div class="form-group col-md-4">
							<label class="control-label display-block"
								style="display: block;" for=""><span style="color: red">*</span>Gender</label>
							<c:choose>
								<c:when test="${profile.gender eq 'MALE'}">
									<label class="radio-inline"><input type="radio" checked
										name="gender" id="inlineRadio2" value="MALE"> Male </label>
									<label class="radio-inline"> <input type="radio"
										name="gender" value="FEMALE">Female
									</label>
								</c:when>
								<c:otherwise>
									<label class="radio-inline"><input type="radio"
										name="gender" id="inlineRadio2" value="MALE"> Male </label>
									<label class="radio-inline"> <input type="radio"
										name="gender" checked value="FEMALE">Female
									</label>
								</c:otherwise>
							</c:choose>
							<span id="gender-error" class="help-block" style="display: none;"></span>
						</div>
						<div class="col-md-4 form-group">
							<label for="EMAIL_ADDRESS" class="control-label"><span
								style="color: red">*</span>Email Address</label> <input
								class="form-control" value="${profile.email}" id="EMAIL_ADDRESS"
								name="email" type="text">
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-4">
							<label for="designation" class="control-label"><span
								style="color: red">*</span>Designation</label> <input type="text"
								name="basicDetail.designation" id="designation"
								value="${profile.userDesignation.designation}"
								class="form-control" placeholder="" readonly="readonly">
						</div>
						<div class="form-group col-md-4">
							<label for="designation" class="control-label"><span
								style="color: red">*</span>Grade</label> <input type="text"
							    id="grade"
								value="${profile.userDesignation.grade}" class="form-control"
								placeholder="" readonly="readonly">
						</div>
					</div>
					<h4>Contact Information</h4>
					<div class="row">
						<div class="form-group col-md-12 col-xs-12">
							<span style="color: red">*</span><label class="control-label">Address</label>
							<input type="text" name="address.addressLine" id="SHIPPING_ADDRESS"
								value="${profile.addressId.addressLine}" class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-4 col-xs-12">
							<span style="color: red">*</span><label class="control-label">City</label>
							<input type="text" class="form-control" id="SHIPPING_CITY"
								value="${profile.addressId.addressCity}" name="address.addressCity">
						</div>

						<div class="col-md-4 form-group">
							<span style="color: red">*</span><label for="SHIPPING_STATE"
								class="control-label">State</label> <select class="form-control"
								name="address.addressState">
								<option value="Andaman and Nicobar Islands"
									<c:if test="${profile.addressId.addressState eq 'Andaman and Nicobar Islands'}">selected</c:if>>Andaman
									and Nicobar Islands</option>
								<option value="Andhra Pradesh"
									<c:if test="${profile.addressId.addressState eq 'Andhra Pradesh'}">selected</c:if>>Andhra
									Pradesh</option>
								<option value="Arunachal Pradesh"
									<c:if test="${profile.addressId.addressState eq 'Arunachal Pradesh'}">selected</c:if>>Arunachal
									Pradesh</option>
								<option value="Assam"
									<c:if test="${profile.addressId.addressState eq 'Assam'}">selected</c:if>>Assam</option>
								<option value="Bihar"
									<c:if test="${profile.addressId.addressState eq 'Bihar'}">selected</c:if>>Bihar</option>
								<option value="Chandigarh"
									<c:if test="${profile.addressId.addressState eq 'Chandigarh'}">selected</c:if>>Chandigarh</option>
								<option value="Chhattisgarh"
									<c:if test="${profile.addressId.addressState eq 'Chhattisgarh'}">selected</c:if>>Chhattisgarh</option>
								<option value="Dadra and Nagar Haveli"
									<c:if test="${profile.addressId.addressState eq 'Dadra and Nagar Haveli'}">selected</c:if>>Dadra
									and Nagar Haveli</option>
								<option value="Daman and Diu"
									<c:if test="${profile.addressId.addressState eq 'Daman and Diu'}">selected</c:if>>Daman
									and Diu</option>
								<option value="Delhi"
									<c:if test="${profile.addressId.addressState eq 'Delhi'}">selected</c:if>>Delhi</option>
								<option value="Goa"
									<c:if test="${profile.addressId.addressState eq 'Goa'}">selected</c:if>>Goa</option>
								<option value="Gujarat"
									<c:if test="${profile.addressId.addressState eq 'Gujarat'}">selected</c:if>>Gujarat</option>
								<option value="Haryana"
									<c:if test="${profile.addressId.addressState eq 'Haryana'}">selected</c:if>>Haryana</option>
								<option value="Himachal Pradesh"
									<c:if test="${profile.addressId.addressState eq 'Himachal Pradesh'}">selected</c:if>>Himachal
									Pradesh</option>
								<option value="Jammu and Kashmir"
									<c:if test="${profile.addressId.addressState eq 'Jammu and Kashmir'}">selected</c:if>>Jammu
									and Kashmir</option>
								<option value="Jharkhand"
									<c:if test="${profile.addressId.addressState eq 'Jharkhand'}">selected</c:if>>Jharkhand</option>
								<option value="Karnataka"
									<c:if test="${profile.addressId.addressState eq 'Karnataka'}">selected</c:if>>Karnataka</option>
								<option value="Kerala"
									<c:if test="${profile.addressId.addressState eq 'Kerala'}">selected</c:if>>Kerala</option>
								<option value="Lakshadweep"
									<c:if test="${profile.addressId.addressState eq 'Lakshadweep'}">selected</c:if>>Lakshadweep</option>
								<option value="Madhya Pradesh"
									<c:if test="${profile.addressId.addressState eq 'Madhya Pradesh'}">selected</c:if>>Madhya
									Pradesh</option>
								<option value="Maharashtra"
									<c:if test="${profile.addressId.addressState eq 'Maharashtra'}">selected</c:if>>Maharashtra</option>
								<option value="Manipur"
									<c:if test="${profile.addressId.addressState eq 'Manipur'}">selected</c:if>>Manipur</option>
								<option value="Meghalaya"
									<c:if test="${profile.addressId.addressState eq 'Meghalaya'}">selected</c:if>>Meghalaya</option>
								<option value="Mizoram"
									<c:if test="${profile.addressId.addressState eq 'Mizoram'}">selected</c:if>>Mizoram</option>
								<option value="Nagaland"
									<c:if test="${profile.addressId.addressState eq 'Nagaland'}">selected</c:if>>Nagaland</option>
								<option value="Orissa"
									<c:if test="${profile.addressId.addressState eq 'Orissa'}">selected</c:if>>Orissa</option>
								<option value="Pondicherry"
									<c:if test="${profile.addressId.addressState eq 'Pondicherry'}">selected</c:if>>Pondicherry</option>
								<option value="Punjab"
									<c:if test="${profile.addressId.addressState eq 'Punjab'}">selected</c:if>>Punjab</option>
								<option value="Rajasthan"
									<c:if test="${profile.addressId.addressState eq 'Rajasthan'}">selected</c:if>>Rajasthan</option>
								<option value="Sikkim"
									<c:if test="${profile.addressId.addressState eq 'Sikkim'}">selected</c:if>>Sikkim</option>
								<option value="Tamil Nadu"
									<c:if test="${profile.addressId.addressState eq 'Tamil Nadu'}">selected</c:if>>Tamil
									Nadu</option>
								<option value="Telangana"
									<c:if test="${profile.addressId.addressState eq 'Telangana'}">selected</c:if>>Telangana</option>
								<option value="Tripura"
									<c:if test="${profile.addressId.addressState eq 'Tripura'}">selected</c:if>>Tripura</option>
								<option value="Uttaranchal"
									<c:if test="${profile.addressId.addressState eq 'Uttaranchal'}">selected</c:if>>Uttaranchal</option>
								<option value="Uttar Pradesh"
									<c:if test="${profile.addressId.addressState eq 'Uttar Pradesh'}">selected</c:if>>Uttar
									Pradesh</option>
								<option value="West Bengal"
									<c:if test="${profile.addressId.addressState eq 'West Bengal'}">selected</c:if>>West
									Bengal</option>
							</select>
						</div>

						<div class="col-md-4 form-group">
							<span style="color: red">*</span><label for="SHIPPING_ZIP"
								class="control-label">Pin code</label> <input type="text"
								class="form-control" value="${profile.addressId.addressPin}"
								id="SHIPPING_ZIP" name="address.addressPin">
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-4 col-xs-12">
							<span style="color: red">*</span><label for="PHONE_NUMBER"
								class="control-label">Phone Number</label> <input type="text"
								name="phone" class="form-control"
								value="${profile.phone}" id="PHONE_NUMBER">
						</div>
						<div class="form-group col-md-4 col-xs-12">
							<span style="color: red">*</span><label class="control-label">Ext.</label>
							<input type="text" name="extension" class="form-control"
								value="${profile.extension}" id="extension">
						</div>
						<div class="form-group col-md-4 col-xs-12">
							<span style="color: red">*</span><label class="control-label">Mobile</label>
							<input type="text" name="mobile" class="form-control"
								value="${profile.mobile}" id="mobile">
						</div>
					</div>

					<h4>Other Information</h4>
					<div class="row">
						<div class="form-group col-md-4">
							<label for="joiningDate" class="control-label"><span
								style="color: red">*</span>INMAS joining date</label> 
								<input type="text"
								class="form-control datepicker-input" autocomplete="off"
								value="${profile.basicDetail.joiningDate}" name="basicDetail.joiningDate"
								id="joiningDate" placeholder="YYYY-MM-DD">
						</div>

						<div class="col-md-4 form-group">
							<label for="assignedResearchArea" class="control-label"><span
								style="color: red">*</span>Research area assigned</label> <input
								class="form-control" name="basicDetail.researchArea"
								value="${profile.basicDetail.researchArea}"
								id="assignedResearchArea" value=""></input>
						</div>
						<div class="col-md-4 form-group">
							<label for="interestedResearchArea" class="control-label"><span
								style="color: red">*</span>Interested Research area</label> <input
								class="form-control" name="basicDetail.interestedResearchArea"
								value="${profile.basicDetail.interestedResearchArea}"
								id="interestedResearchArea" value=""></input>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 form-group">
							<label for="qualification" class="control-label"><span
								style="color: red">*</span>Qualification</label> <input type="text"
								class="form-control"
								value="${profile.basicDetail.qualification}" id="qualification"
								name="basicDetail.qualification">
						</div>
						<div class="col-md-4 form-group">
							<label for="researchPaper" class="control-label"><span
								style="color: red">*</span>Research paper</label> <input type="text"
								class="form-control"
								value="${profile.basicDetail.researchPaper}" id="researchPaper"
								name="basicDetail.researchPaper">
						</div>
						<div class="col-md-4 form-group">
							<label for="patent" class="control-label"><span
								style="color: red">*</span>Patent</label> <input type="text"
								class="form-control" value="${profile.basicDetail.patent}"
								id="patent" name="basicDetail.patent">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" id="updateMyProfileBtn"
						class="btn btn-primary">Update Information</button>
				</div>
			</form>
		</div>
	</div>
</div>
 <script>
	var date=new Date();
	$('.datepicker-input').datetimepicker({
    	useCurrent: false ,
     	format: 'YYYY-MM-DD',
       	maxDate: date,
       	minDate: moment().subtract(65, 'years'),
    });
</script>
