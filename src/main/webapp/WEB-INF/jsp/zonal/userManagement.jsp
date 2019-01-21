<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<div class="mid-box">
            <div class="register-box clearfix">
                <h2 class="heading-box">Edit User Details</h2>
                <div class="inner-container">
           <p> All required fields are marked with asterisk (<span style="color:red">*</span>)</p>
               <form name="document" id="updateProfileForm" method="POST" enctype="multipart/form-data" action="${path}/deptHead/updateInfo" autocomplete="off">
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
                               		<img id="imageLoad" src="data:image/jpg;base64,${pic}" alt="Profile Image"/>
                           		</c:when>
                           		<c:otherwise>
                           			<img id="imageLoad" src="${path}/assets/images/camera-icon.png" alt="Default Image" >
                           		</c:otherwise>
                       		</c:choose>
                      	</div>
                    </div>
                    <!-- this is were the previews should be shown. -->
                    <div class="form-group" style="margin-top:15px;">
                    	<input type="file" name="file" id="picFile" class="dz-clickable needsclick" onchange="previewFile()" >
                        <span id="fileError" class="help-block error"> </span>
                     </div> 
              </div>
              </div><div class="form-group col-md-4 col-xs-12">
	    	<span style="color:red">*</span><label class="control-label">Prefix</label>
	        <select name="prefix" id="prefix" class="form-control">
	        	<option value="" selected disabled>Select prefix</option>
	        	<option value="MR" <c:if test="${userProfile.prefix eq 'MR'}">selected</c:if> >Mr.</option>
	        	<option value="MRS" <c:if test="${userProfile.prefix eq 'MRS'}">selected</c:if>>Mrs.</option>
	        	<option value="MS" <c:if test="${userProfile.prefix eq 'MS'}">selected</c:if>>Ms.</option>
	        	<option value="DR" <c:if test="${userProfile.prefix eq 'DR'}">selected</c:if>>Dr.</option>
	        </select>
	     </div>
		<div class="form-group col-md-4 col-xs-12">
	    	<span style="color:red">*</span><label class="control-label">First name</label>
	        <input name="firstName" id="firstName" value="${userProfile.firstName}" type="text" class="form-control">
	     </div>
         <div class="form-group col-md-4 col-xs-12">
             <label class="control-label">Middle name</label>
             <input type="text" name="middleName" value="${userProfile.middleName}" class="form-control">
         </div>
		<div class="form-group col-md-4 col-xs-12">
              <span style="color:red">*</span><label class="control-label">Last name</label>
              <input name="lastName" id="lastName" value="${userProfile.lastName}" type="text" class="form-control">
        </div>
        <div class="form-group col-md-4 col-xs-12">
	        <span style="color:red">*</span><label class="control-label">D.O.B.</label>
	        <input type="text" class="form-control datepicker-input" value="${userProfile.dateOfBirth}" name="birthDay" id="birthDay" placeholder="YYYY-MM-DD">
	    </div>
		 <script>
            var date=new Date();
           	$('.datepicker-input').datetimepicker({
               format: 'YYYY-MM-DD',
               maxDate: date,
               minDate: moment().subtract(65, 'years'),
           });
         </script>
	           
		<div class="form-group col-md-4">
           <label class="control-label display-block"  style="display:block;"for=""><span style="color:red">*</span>Gender</label>
           <c:choose>
           		<c:when test="${userProfile.gender eq 'MALE'}">
                      <label class="radio-inline"><input type="radio" checked name="gender" id="inlineRadio2" value="MALE">
                 	Male </label>
                       <label class="radio-inline">
                 	<input type="radio" name="gender" value="FEMALE">
                 	Female </label>
            	</c:when>
            	<c:otherwise>
            		<label class="radio-inline"><input type="radio" name="gender" id="inlineRadio2" value="MALE">
                 	Male </label>
                       <label class="radio-inline">
                 	<input type="radio" name="gender" checked value="FEMALE">
                 	Female </label>
            	</c:otherwise>
           </c:choose>
	        <span id="gender-error" class="help-block" style="display:none;"></span>
	    </div>
	    </div>
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
	             
	 				<div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">User name</label>
                            <input type="text" name="username" readonly value="${userProfile.userName}" class="form-control">
                        </div>
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label for="EMAIL_ADDRESS" class="control-label">Email Address</label>
                            <input class="form-control" id="EMAIL_ADDRESS" value="${userProfile.email}" name="EMAIL_ADDRESS" type="text">
                        </div>
                        <%-- <div class="form-group col-md-4">
	                        <label for="designation" class="control-label">Department</label>
	                         <select name="department" id="department" class="form-control">
					        	<option value="" selected disabled>Select department</option>
					        	<c:forEach items="${department}" var="dept">
					        		<option value="${dept.deptId}" <c:if test="${dept.deptId eq userProfile.departmentId.deptId}">selected</c:if>>${dept.deptName}</option>
					        	</c:forEach>
					        </select>
	                    </div> --%>
                    </div>
                    
					<h4>Contact Information</h4>
                  <div class="row">
                        <div class="form-group col-md-12 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Address</label>
                            <input type="text" name="SHIPPING_ADDRESS" value="${userProfile.addressId.addressLine}" id="SHIPPING_ADDRESS" value="" class="form-control">
                        </div>
                            </div>
                    
                  <div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">City</label>
                            <input type="text" class="form-control" value="${userProfile.addressId.addressCity}" id="SHIPPING_CITY" name="SHIPPING_CITY">
                        </div>
						
						<div class="col-md-4 form-group">
                                 <span style="color:red">*</span><label for="SHIPPING_STATE" class="control-label">State</label>
                                <select class="form-control" name="SHIPPING_STATE">
						            <option value="Andaman and Nicobar Islands" <c:if test="${userProfile.addressId.addressState eq 'Andaman and Nicobar Islands'}">selected</c:if>>Andaman and Nicobar Islands</option>
						            <option value="Andhra Pradesh" <c:if test="${userProfile.addressId.addressState eq 'Andhra Pradesh'}">selected</c:if>>Andhra Pradesh</option>
						            <option value="Arunachal Pradesh" <c:if test="${userProfile.addressId.addressState eq 'Arunachal Pradesh'}">selected</c:if>>Arunachal Pradesh</option>
						            <option value="Assam" <c:if test="${userProfile.addressId.addressState eq 'Assam'}">selected</c:if>>Assam</option>
						            <option value="Bihar" <c:if test="${userProfile.addressId.addressState eq 'Bihar'}">selected</c:if>>Bihar</option>
						            <option value="Chandigarh" <c:if test="${userProfile.addressId.addressState eq 'Chandigarh'}">selected</c:if>>Chandigarh</option>
						            <option value="Chhattisgarh" <c:if test="${userProfile.addressId.addressState eq 'Chhattisgarh'}">selected</c:if>>Chhattisgarh</option>
						            <option value="Dadra and Nagar Haveli" <c:if test="${userProfile.addressId.addressState eq 'Dadra and Nagar Haveli'}">selected</c:if>>Dadra and Nagar Haveli</option>
						            <option value="Daman and Diu" <c:if test="${userProfile.addressId.addressState eq 'Daman and Diu'}">selected</c:if>>Daman and Diu</option>
						            <option value="Delhi" <c:if test="${userProfile.addressId.addressState eq 'Delhi'}">selected</c:if>>Delhi</option>
						            <option value="Goa" <c:if test="${userProfile.addressId.addressState eq 'Goa'}">selected</c:if>>Goa</option>
						            <option value="Gujarat" <c:if test="${userProfile.addressId.addressState eq 'Gujarat'}">selected</c:if>>Gujarat</option>
						            <option value="Haryana" <c:if test="${userProfile.addressId.addressState eq 'Haryana'}">selected</c:if>>Haryana</option>
						            <option value="Himachal Pradesh" <c:if test="${userProfile.addressId.addressState eq 'Himachal Pradesh'}">selected</c:if>>Himachal Pradesh</option>
						            <option value="Jammu and Kashmir" <c:if test="${userProfile.addressId.addressState eq 'Jammu and Kashmir'}">selected</c:if>>Jammu and Kashmir</option>
						            <option value="Jharkhand" <c:if test="${userProfile.addressId.addressState eq 'Jharkhand'}">selected</c:if>>Jharkhand</option>
						            <option value="Karnataka" <c:if test="${userProfile.addressId.addressState eq 'Karnataka'}">selected</c:if>>Karnataka</option>
						            <option value="Kerala" <c:if test="${userProfile.addressId.addressState eq 'Kerala'}">selected</c:if>>Kerala</option>
						            <option value="Lakshadweep" <c:if test="${userProfile.addressId.addressState eq 'Lakshadweep'}">selected</c:if>>Lakshadweep</option>
						            <option value="Madhya Pradesh" <c:if test="${userProfile.addressId.addressState eq 'Madhya Pradesh'}">selected</c:if>>Madhya Pradesh</option>
						            <option value="Maharashtra" <c:if test="${userProfile.addressId.addressState eq 'Maharashtra'}">selected</c:if>>Maharashtra</option>
						            <option value="Manipur" <c:if test="${userProfile.addressId.addressState eq 'Manipur'}">selected</c:if>>Manipur</option>
						            <option value="Meghalaya" <c:if test="${userProfile.addressId.addressState eq 'Meghalaya'}">selected</c:if>>Meghalaya</option>
						            <option value="Mizoram" <c:if test="${userProfile.addressId.addressState eq 'Mizoram'}">selected</c:if>>Mizoram</option>
						            <option value="Nagaland" <c:if test="${userProfile.addressId.addressState eq 'Nagaland'}">selected</c:if>>Nagaland</option>
						            <option value="Orissa" <c:if test="${userProfile.addressId.addressState eq 'Orissa'}">selected</c:if>>Orissa</option>
						            <option value="Pondicherry" <c:if test="${userProfile.addressId.addressState eq 'Pondicherry'}">selected</c:if>>Pondicherry</option>
						            <option value="Punjab" <c:if test="${userProfile.addressId.addressState eq 'Punjab'}">selected</c:if>>Punjab</option>
						            <option value="Rajasthan" <c:if test="${userProfile.addressId.addressState eq 'Rajasthan'}">selected</c:if>>Rajasthan</option>
						            <option value="Sikkim" <c:if test="${userProfile.addressId.addressState eq 'Sikkim'}">selected</c:if>>Sikkim</option>
						            <option value="Tamil Nadu" <c:if test="${userProfile.addressId.addressState eq 'Tamil Nadu'}">selected</c:if>>Tamil Nadu</option>
						            <option value="Telangana" <c:if test="${userProfile.addressId.addressState eq 'Telangana'}">selected</c:if>>Telangana</option>
						            <option value="Tripura" <c:if test="${userProfile.addressId.addressState eq 'Tripura'}">selected</c:if>>Tripura</option>
						            <option value="Uttaranchal" <c:if test="${userProfile.addressId.addressState eq 'Uttaranchal'}">selected</c:if>>Uttaranchal</option>
						            <option value="Uttar Pradesh" <c:if test="${userProfile.addressId.addressState eq 'Uttar Pradesh'}">selected</c:if>>Uttar Pradesh</option>
						            <option value="West Bengal" <c:if test="${userProfile.addressId.addressState eq 'West Bengal'}">selected</c:if>>West Bengal</option>
					       		</select>
                             </div>
							 
							 <div class="col-md-4 form-group">
                                 <span style="color:red">*</span><label for="SHIPPING_ZIP" class="control-label">Pin code</label>
                                 <input type="text" class="form-control" value="${userProfile.addressId.addressPin}" id="SHIPPING_ZIP" name="SHIPPING_ZIP">
                             </div>
                      </div>
                    
                  <div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label for="PHONE_NUMBER" class="control-label">Phone Number</label>
                            <input type="text" name="PHONE_NUMBER" class="form-control" value="${userProfile.phone}" id="PHONE_NUMBER">
                        </div>
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Ext.</label>
                            <input type="text" name="extension" value="${userProfile.extension}" class="form-control" id="extension">
                        </div>
						<div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Mobile</label>
                            <input type="text" name="mobile" class="form-control" value="${userProfile.mobile}" id="mobile">
                        </div>
                    </div>
                    <h4>Other Information</h4>
					<div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Position</label>
                            <input type="text" name="position" value="${userProfile.position}" class="form-control" id="position">
                        </div>
                        <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Role</label>
                            <select class="form-control" name="role">
	                    	<option value="" disabled >Select Role</option>
				             	<c:forEach items="${roles}" var="rol" varStatus="counter">
								<option value="${rol.userRoleId}" <c:if test="${rol.userRoleId eq userProfile.roleId.userRoleId}">selected</c:if>><c:choose><c:when test="${rol.userRoleName eq 'ROLE_ADMIN'}">Admin</c:when><c:otherwise>User</c:otherwise></c:choose></option>
								</c:forEach>
	         			</select>
                        </div>
						<div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Replaced by</label>
                            <input type="text" name="replaceBy" class="form-control" value="${userProfile.replaceBy}" id="replaceBy">
                        </div>
                        </div>
                      <div class="row">
						<div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Expiration date</label>
                            <input type="text" name="expirationDate" value="${userProfile.expirationDate}" class="form-control datepicker-input" id="expirationDate">
                        </div>
                        <script>
                            var date=new Date();
                           	$('.datepicker-input').datetimepicker({
                           		format: 'YYYY-MM-DD',
                               maxDate: date,
                               minDate: moment().subtract(65, 'years'),
                           });
                         </script>
                         <input type="hidden" value="${userProfile.groupId.groupId}" name="groupId">
                      <!--  <div class="form-group col-md-4 col-xs-12">
                            <span style="color:red">*</span><label class="control-label">Assign Group</label>
                            <select class="form-control" name="groupId">
	                          <option value="" disabled selected>Select Group</option>
					           	<c:forEach items="${groupList}" var="grp" varStatus="counter">
									<option value="${grp.groupId}" <c:if test="${grp.groupId eq userProfile.groupId.groupId}">selected</c:if>>${grp.groupName}</option>
								</c:forEach>
					         </select>
                        </div>-->
                    </div>
					
					<h4>Basic Details</h4>
					<div class="row">
            		<div class="form-group col-md-4">
                        <label for="designation" class="control-label"><span style="color:red">*</span>Designation</label>
                        <input type="text" name="designation" id="designation" value="${userProfile.basicDetail.designation}" class="form-control" placeholder="">
                    </div>
                     
                    <div class="form-group col-md-4">
                        <label for="joiningDate" class="control-label"><span style="color:red">*</span>INMAS joining date</label>
                        <input type="text" class="form-control mydate datepicker-input" value="${userProfile.basicDetail.joiningDate}" name="joiningDate" id="joiningDate" placeholder="MM/dd/yyyy">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="tillDate" class="control-label"><span style="color:red">*</span>To till date</label>
                        <input type="text" class="form-control mydate datepicker-input" value="${userProfile.basicDetail.tillDate}" name="tillDate" id="tillDate" placeholder="MM/dd/yyyy">
                    </div>
                    <script>
                       var date=new Date();
                      	$('.mydate').datetimepicker({
                          //format: 'MM/DD/YYYY',
                          format: 'YYYY-MM-DD',
                         // maxDate: date,
                          //minDate: moment().subtract(65, 'years'),
                      });
                    </script>
                     </div>
             
                    
                         <div class="row ">
                             <div class="col-md-4 form-group">
                             	<label for="assignedResearchArea" class="control-label"><span style="color:red">*</span>Research area assigned</label>
                                 <input class="form-control" name="researchArea" value="${userProfile.basicDetail.researchArea}" id="assignedResearchArea" value=""></input>
                             </div>
                             <div class="col-md-4 form-group">
                             	<label for="interestedResearchArea" class="control-label"><span style="color:red">*</span>Interested Research area</label>
                                 <input class="form-control" name="interestedResearchArea" value="${userProfile.basicDetail.interestedResearchArea}" id="interestedResearchArea" value=""></input>
                             </div>
                         
                             <div class="col-md-4 form-group">
                                 <label for="qualification" class="control-label"><span style="color:red">*</span>Qualification</label>
                                 <input type="text" class="form-control" value="${userProfile.basicDetail.qualification}" id="qualification" name="qualification" >
                             </div>
						</div>
                        <div class="row">
                        
                             <div class="col-md-4 form-group">
                                 <label for="researchPaper" class="control-label"><span style="color:red">*</span>Research paper</label>
                                 <input type="text" class="form-control" value="${userProfile.basicDetail.researchPaper}" id="researchPaper" name="researchPaper">
                             </div>
                             
                             <div class="col-md-4 form-group">
                                 <label for="patent" class="control-label"><span style="color:red">*</span>Patent</label>
                                 <input type="text" class="form-control" value="${userProfile.basicDetail.patent}" id="patent" name="patent" >
                             </div>
                         </div>
                          <h4>Manpower Details</h4>
                         <div class="row">
                        
                             <div class="col-md-4 form-group">
                                 <label for="jrf" class="control-label"><span style="color:red">*</span>JRF</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.jrf}" id="jrf" name="jrf">
                             </div>
                             
                             <div class="col-md-4 form-group">
                                 <label for="srf" class="control-label"><span style="color:red">*</span>SRF</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.srf}" id="srf" name="srf" >
                             </div>
                             <div class="col-md-4 form-group">
                                 <label for="mts" class="control-label"><span style="color:red">*</span>MTS</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.mts}" id="mts" name="mts">
                             </div>
                         </div>
                          <div class="row">
                        
                             <div class="col-md-4 form-group">
                                 <label for="ra" class="control-label"><span style="color:red">*</span>RA</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.ra}" id="ra" name="ra">
                             </div>
                             
                             <div class="col-md-4 form-group">
                                 <label for="projectAssinged" class="control-label"><span style="color:red">*</span>PROJECT ASSIGNED</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.projectAssinged}" id="projectAssinged" name="projectAssinged" >
                             </div>
                         </div>
                    <div class="form-submit">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="id"	value="${userProfile.profileId}" />
						<input type="hidden" name="addressId"	value="${userProfile.addressId.addressId}" />
						<button type="button" id="updateMyProfileBtn" class="btn btn-primary marR10">Submit</button>
						<a type="button" role="button" class="btn btn-secondary" href="${path}/admin/welcomeAdmin">Cancel</a>
                    </div>
                    </form>
                </div>                
            </div>
        </div>
 <script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);

		 $('#updateMyProfileBtn').on('click',function(){
			if(!$("#picFile").hasClass("imageError")){
    			if($("#updateProfileForm").valid()){
    				document.getElementById("updateProfileForm").submit();
    			}
   			}
		}); 
	});
		
</script>