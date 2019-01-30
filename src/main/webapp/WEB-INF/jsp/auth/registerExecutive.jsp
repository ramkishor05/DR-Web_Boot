<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorUserManagement.js"></script>
<script>
  function previewFile(path){
  var preview = document.getElementById('imageLoad'); //selects the query named img
    var file;
    if(document.querySelector('input[type=file]')){
	    file    = document.querySelector('input[type=file]').files[0]; //sames as here
	    var reader  = new FileReader();
	
	    reader.onloadend = function () {
	        preview.src = reader.result;
	    }
	    if (file) {
	     var val = file.name.toLowerCase(),
	        regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
	
	     if (!(regex.test(val))) {
	        $(this).val('');
	        $("#picFile").addClass("imageError");
	        preview.src = preview.src = path+"/assets/images/camera-icon.png";
	        $("#fileError").text('Please choose correct file format');
	    }else{
	     	reader.readAsDataURL(file);
	    	$("#picFile").removeClass("imageError");
	    	$("#fileError").html('');
	    }
	    }else{
	    	preview.src = preview.src = path+"/assets/images/camera-icon.png";
	    }
    }
}
  previewFile();  //calls the function named previewFile()
  </script>
  <script>
		$(function () {
		    $('#picFile').change(function () {
		        var val = $(this).val().toLowerCase(),
		            regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
		
		         if (!(regex.test(val))) {
		            $(this).val('');
		            $(this).addClass("imageError");
		            $("#fileError").text('Please choose correct file format');
		        }else{
		        	$(this).removeClass("imageError");
		        	$("#fileError").html('');
		        }
		    });
		});
	</script>
	<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);

		 $('#updateMyProfileBtn').on('click',function(){
    		document.getElementById("updateProfileForm").submit();
		}); 
		 
		$("#previous").on('click',function(){
			$("#mainForm").removeClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		 
		$("#EMAIL_ADDRESS").on("focusout",function(){
			if($("#EMAIL_ADDRESS").valid()){
				var username=$("#EMAIL_ADDRESS").val();
				$("#username").val(username);
			}
		});
	
		$('#gotoReview').on('click',function(){
			if(!$("#picFile").hasClass("imageError")){
    			if($("#updateProfileForm").valid()){
    				$("#mainForm").addClass("hidden");
    				$("#reviewDiv").removeClass("hidden");
    				$("#reviewName").text($("#prefix").val()+" "+$("#firstName").val()+" "+$("#middleName").val()+" "+$("#lastName").val());
    				$("#reviewUsername").text($("#username").val());
    				$("#reviewEmail").text($("#EMAIL_ADDRESS").val());
    				var gender = $("input[name='profile.gender']:checked").val()==="MALE" ? "Male" : "Female";
    				$("#reviewGender").text(gender);
    				$("#reviewRole").text($("select[name='role'] option:selected").text());
    				$("#reviewImageLoad").attr("src",$("#imageLoad").attr('src'));
    			}
   			}
		});
		
		$("select[id='role']").on("change",function(){
			if($(this).val()==='1'){
				$("#divisionDiv").addClass("hidden");
				$("#departmentDiv").addClass("hidden");
				$("#groupDiv").addClass("hidden");
			}else if($(this).val()==='2'){
				$("#divisionDiv").removeClass("hidden");
				$("#departmentDiv").addClass("hidden");
				$("#groupDiv").addClass("hidden");
			}else if($(this).val()==='3'){
				$("#divisionDiv").removeClass("hidden");
				$("#departmentDiv").removeClass("hidden");
				$("#groupDiv").addClass("hidden");
			}else if($(this).val()==='4'){
				$("#divisionDiv").removeClass("hidden");
				$("#departmentDiv").removeClass("hidden");
				$("#groupDiv").removeClass("hidden");
			}else{
				$("#divisionDiv").removeClass("hidden");
				$("#departmentDiv").removeClass("hidden");
				$("#groupDiv").removeClass("hidden");
			}
		});
		$("#divisionId").on("change",function(){
			var divisionId=$(this).val();
			 $.ajax({
			     type  :   'GET',
			     url   :   '${path}/dashboard/getDeptByDivisionId/'+divisionId, 
			     success  :  function(res){
			    	$("#department").html("");
			    	$("#department").append("<option selected disabled>Select Department</option>");
			    	$.each(res,function(x,y){
			    		$("#department").append("<option value="+y.departmentId+">"+y.departmentName+"</option>")
			    	})
			     },
			     error: function(error){
			    	 $("#department").html("");
			     	console.log(error);
			     }
			}); 
		});
		
		$("select[id='department']").on("change",function(){
			var deptId=$(this).val();
			 $.ajax({
			     type  :   'GET',
			     url   :   '${path}/dashboard/getGroupByDeptId/'+deptId, 
			     success  :  function(res){
			    	$("#groupId").html("");
			    	$("#groupId").append("<option selected disabled>Select Group</option>");
			    	$.each(res,function(x,y){
			    		$("#groupId").append("<option value="+y.groupId+">"+y.groupName+"</option>")
			    	})
			     },
			     error: function(error){
			    	 $("#groupId").html("");
			     }
			}); 
		});
		$("#designation").on("change",function(){
			var designation=$(this).val();
			$("#designation").children('option').each(function () {
				var div=$(this).val();
				if(div!=""){
					$('div .'+div).addClass("hidden");
				}
			});
			if(designation!=""){
				$('div .'+designation).removeClass("hidden");
			}
		});
	});
		
</script>
<div class="mid-box">
	<form name='registerLoginBean' id="updateProfileForm"
		action="${path}/admin/executive.html?${_csrf.parameterName}=${_csrf.token}"
		method='POST' enctype="multipart/form-data">
		<div class="register-box clearfix" id="mainForm">
			<h2 class="heading-box">Register User</h2>
			<div class="inner-container">
				<p>
					All required fields are marked with asterisk (<span
						style="color: red">*</span>)
				</p>

				<h4>Personal Information</h4>
				<div class="row">
					<div class="col-md-4">
						<label class="control-label">Upload Image</label>
						<div class="block-content padBlock">
							<!-- <script src="assets/js/dropzone.js"></script> -->
							<div class="dropzone-previews marB35">
								<div class="img-loaded">
									<c:choose>
										<c:when test="${not empty userProfile.profilePic}">
											<img id="imageLoad" src="data:image/jpg;base64,${pic}"
												alt="Profile Image" />
										</c:when>
										<c:otherwise>
											<img id="imageLoad"
												src="${path}/assets/images/camera-icon.png"
												alt="Default Image">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<!-- this is were the previews should be shown. -->
							<div class="form-group" style="margin-top: 15px;">
								<input type="file" name="file" id="picFile"
									class="dz-clickable needsclick" onchange="previewFile()">
								<span id="fileError" class="help-block error"> </span>
							</div>
						</div>
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">Prefix</label>
						<select name="profile.prefix" id="prefix" class="form-control">
							<option value="" selected disabled>Select prefix</option>
							<option value="MR">Mr</option>
							<option value="MRS">Mrs</option>
							<option value="MS">Ms</option>
							<option value="DR">Dr</option>
						</select>
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">First
							name</label> <input name="profile.firstName" id="firstName" type="text"
							class="form-control">
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<label class="control-label">Middle name</label> <input
							type="text" name="profile.middleName" id="middleName"
							class="form-control">
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">Last
							name</label> <input name="profile.lastName" id="lastName" type="text"
							class="form-control">
					</div>

					<div class="form-group col-md-4">
						<label class="control-label display-block" style="display: block;"
							for=""><span style="color: red">*</span>Gender</label> <label
							class="radio-inline"> <input type="radio" name="profile.gender"
							value="MALE" aria-describedby="gender-error" checked="checked"> Male
						</label> <label class="radio-inline"> <input type="radio"
							name="profile.gender" value="FEMALE" aria-describedby="gender-error">
							Female
						</label> <span id="gender-error" class="help-block" style="display: none;"></span>
					</div>
				</div>


				<h4>Other Information</h4>
				<div class="row">
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label for="EMAIL_ADDRESS"
							class="control-label">Email Address</label> <input
							class="form-control" id="EMAIL_ADDRESS" name="profile.email"
							type="text">
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">User
							name</label> <input type="text" name="userName" readonly id="username"
							class="form-control">
					</div>
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">Password</label>
						<input type="text" name="password" id="password"
							class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">Role</label>
						<select class="form-control" name="role" id="role">
							<option value="" disabled selected>Select Role</option>
							<c:forEach items="${role}" var="rol" varStatus="counter">
								<option value="${rol.userRoleId}">
									<c:choose>
										<c:when test="${rol.userRoleName eq 'ROLE_ADMIN'}">Admin</c:when>
										<c:when test="${rol.userRoleName eq 'ROLE_DIVISION_OFFICIER'}">Division Head</c:when>
										<c:when test="${rol.userRoleName eq 'ROLE_DEPTHEAD'}">Department Head</c:when>
										<c:when test="${rol.userRoleName eq 'ROLE_GROUPHEAD'}">Group Head</c:when>
										<c:when test="${rol.userRoleName eq 'ROLE_SCIENTIST'}">Scientist</c:when>
										<c:otherwise>${rol.userRoleName}</c:otherwise>
									</c:choose>
								</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group col-md-4 col-xs-12 hidden" id="divisionDiv">
						<span style="color: red">*</span><label class="control-label">Division</label>
						<select class="form-control" id="divisionId" name="profile.formation.divisionId">
							<option value="" disabled selected>Select Division</option>
							<c:forEach items="${division}" var="divi" varStatus="counter">
								<option value="${divi.divisionId}">${divi.divisionName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group col-md-4 col-xs-12 hidden"
						id="departmentDiv">
						<span style="color: red">*</span><label class="control-label">Department</label>
						<select class="form-control" name="profile.formation.departmentId" id="department">
							<option value="" disabled selected>Select Department</option>
						</select>
					</div>

					<div class="form-group col-md-4 col-xs-12 hidden" id="groupDiv">
						<span style="color: red">*</span><label class="control-label">Group</label>
						<select class="form-control" name="profile.formation.groupId" id="groupId">
							<option value="" disabled selected>Select Group</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4 col-xs-12">
						<span style="color: red">*</span><label class="control-label">Designation</label> 
						<select class="form-control" name="profile.designation.designation"
							id="designation">
							<option value="" disabled selected>Select Designation</option>
							<option value="Scientist">Scientist</option>
							<option value="Director">Director</option>
							<option value="TechnicalOfficer">Technical
								Officer</option>
							<option value="SrTechnicalAssistant">Sr.
								Technical Assistant</option>
						</select>

					</div>
					<div class="form-group col-md-12 col-xs-12">
						<div class="hidden Scientist Director">
							<div class="col-md-2 form-group">
								<label for="B" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="B">B
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="C" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="C">C
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="D" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="D">D
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="E" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="E">E
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="F" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="F">F
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="G" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="G">G
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="H" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="H">H
								</label>
							</div>
						</div>
						<div class="hidden TechnicalOfficer SrTechnicalAssistant">
							<div class="col-md-2 form-group">
								<label for="A" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="A">A
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="B" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="B">B
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="C" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="C">C
								</label>
							</div>
							<div class="col-md-2 form-group">
								<label for="D" class="control-label"> <input
									type="radio" name="profile.designation.grade" value="D">D
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="form-submit">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" id="gotoReview"
						class="btn btn-primary marR10">Next</button>
					<a type="button" role="button" class="btn btn-secondary"
						href="${path}/admin/welcomeAdmin">Cancel</a>
				</div>
			</div>
		</div>


		<div class="register-box clearfix hidden" id="reviewDiv">
			<h2 class="heading-box">Register User</h2>
			<div class="inner-container">
				<div class="row marB15">
					<div class="col-md-8">
						<ul>
							<li><strong>Name:</strong> <span id="reviewName"></span></li>
							<li><strong>Username:</strong> <span id="reviewUsername"></span></li>
							<li><strong>Email address:</strong> <span id="reviewEmail"></span></li>
							<li><strong>Gender:</strong> <span id="reviewGender"></span></li>
							<li><strong>Role:</strong> <span id="reviewRole"></span></li>
						</ul>
					</div>
					<div class="col-md-4">
						<div class="block-content padBlock">
							<!-- <script src="assets/js/dropzone.js"></script> -->
							<div class="dropzone-previews marB35">
								<div class="img-loaded">
									<img id="reviewImageLoad" src="data:image/jpg;base64,${pic}"
										alt="Profile Image" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-submit">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" id="previous" class="btn btn-primary marR10">Previous</button>
					<button type="button" id="updateMyProfileBtn"
						class="btn btn-primary marR10">Submit</button>
					<a type="button" role="button" class="btn btn-secondary"
						href="${path}/admin/welcomeAdmin">Cancel</a>
				</div>
			</div>
		</div>
	</form>
</div>
