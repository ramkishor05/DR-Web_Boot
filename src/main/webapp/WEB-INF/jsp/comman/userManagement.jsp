<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>
	All required fields are marked with asterisk (<span style="color: red">*</span>)
</p>
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#Personal_Information">Personal</a></li>
	<li><a data-toggle="tab" href="#Contact_Information">Contact </a></li>
	<li><a data-toggle="tab" href="#Other_Information">Other Detail</a></li>
	<li><a data-toggle="tab" href="#Basic_Details">Basic Detail</a></li>
	<li><a data-toggle="tab" href="#Manpower_Details">Manpower</a></li>
	<li><a data-toggle="tab" href="#Project_Details">Projects</a></li>
	<li><a data-toggle="tab" href="#Award_Details">Awards</a></li>
</ul>
<div class="tab-content">
	<div id="Personal_Information" class="tab-pane fade in active">
		<h3>Personal Information</h3>
		<div class="row">
			<div class="col-md-4">
				<label class="control-label">Upload Image</label>
				<div class="block-content padBlock">
					<!-- <script src="assets/js/dropzone.js"></script> -->
					<div class="dropzone-previews marB35">
						<div class="img-loaded">
							<c:choose>
								<c:when test="${pic ne null}">
									<img id="imageLoad" src="data:image/jpg;base64,${pic}"
										alt="Profile Image" />
								</c:when>
								<c:otherwise>
									<img id="imageLoad" src="${path}/assets/images/camera-icon.png"
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
				<input type="hidden" name="id" value="${userProfile.profileId}" />
				<span style="color: red">*</span><label class="control-label">Prefix</label>
				<select name="prefix" id="prefix" class="form-control">
					<option value="" selected disabled>Select prefix</option>
					<option value="MR"
						<c:if test="${userProfile.prefix eq 'MR'}">selected</c:if>>Mr.</option>
					<option value="MRS"
						<c:if test="${userProfile.prefix eq 'MRS'}">selected</c:if>>Mrs.</option>
					<option value="MS"
						<c:if test="${userProfile.prefix eq 'MS'}">selected</c:if>>Ms.</option>
					<option value="DR"
						<c:if test="${userProfile.prefix eq 'DR'}">selected</c:if>>Dr.</option>
				</select>
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">First
					name</label> <input name="firstName" id="firstName"
					value="${userProfile.firstName}" type="text" class="form-control">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<label class="control-label">Middle name</label> <input type="text"
					name="middleName" value="${userProfile.middleName}"
					class="form-control">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Last
					name</label> <input name="lastName" id="lastName"
					value="${userProfile.lastName}" type="text" class="form-control">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">D.O.B.</label>
				<input type="text" class="form-control datepicker-input"
					value="${userProfile.dateOfBirth}" name="birthDay" id="birthDay"
					placeholder="YYYY-MM-DD">
			</div>
			<div class="form-group col-md-4">
				<label class="control-label display-block" style="display: block;"
					for=""><span style="color: red">*</span>Gender</label>
				<c:choose>
					<c:when test="${userProfile.gender eq 'MALE'}">
						<label class="radio-inline"><input type="radio" checked
							name="gender" id="inlineRadio2" value="MALE"> Male </label>
						<label class="radio-inline"> <input type="radio"
							name="gender" value="FEMALE"> Female
						</label>
					</c:when>
					<c:otherwise>
						<label class="radio-inline"><input type="radio"
							name="gender" id="inlineRadio2" value="MALE"> Male </label>
						<label class="radio-inline"> <input type="radio"
							name="gender" checked value="FEMALE"> Female
						</label>
					</c:otherwise>
				</c:choose>
				<span id="gender-error" class="help-block" style="display: none;"></span>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">User
					name</label> <input type="text" name="username" readonly
					value="${userProfile.userName}" class="form-control">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label for="EMAIL_ADDRESS"
					class="control-label">Email Address</label> <input
					class="form-control" id="EMAIL_ADDRESS"
					value="${userProfile.email}" name="EMAIL_ADDRESS" type="text">
			</div>
			<%-- 
	<div class="form-group col-md-4">
		<label for="designation" class="control-label">Department</label> <select
			name="department" id="department" class="form-control">
			<option value="" selected disabled>Select department</option>
			<c:forEach items="${department}" var="dept">
				<option value="${dept.deptId}"
					<c:if test="${dept.deptId eq userProfile.departmentId.deptId}">selected</c:if>>${dept.deptName}</option>
			</c:forEach>
		</select>
	</div> --%>
		</div>
	</div>
	<div id="Contact_Information" class="tab-pane fade">
		<h4>Contact Information</h4>
		<div class="row">
			<div class="form-group col-md-12 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Address</label>
				<input type="text" name="SHIPPING_ADDRESS"
					value="${userProfile.address.addressLine}" id="SHIPPING_ADDRESS"
					value="" class="form-control">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">City</label>
				<input type="text" class="form-control"
					value="${userProfile.address.addressCity}" id="SHIPPING_CITY"
					name="SHIPPING_CITY">
			</div>

			<div class="col-md-4 form-group">
				<span style="color: red">*</span><label for="SHIPPING_STATE"
					class="control-label">State</label> <select class="form-control"
					name="SHIPPING_STATE">
					<option value="Andaman and Nicobar Islands"
						<c:if test="${userProfile.address.addressState eq 'Andaman and Nicobar Islands'}">selected</c:if>>Andaman
						and Nicobar Islands</option>
					<option value="Andhra Pradesh"
						<c:if test="${userProfile.address.addressState eq 'Andhra Pradesh'}">selected</c:if>>Andhra
						Pradesh</option>
					<option value="Arunachal Pradesh"
						<c:if test="${userProfile.address.addressState eq 'Arunachal Pradesh'}">selected</c:if>>Arunachal
						Pradesh</option>
					<option value="Assam"
						<c:if test="${userProfile.address.addressState eq 'Assam'}">selected</c:if>>Assam</option>
					<option value="Bihar"
						<c:if test="${userProfile.address.addressState eq 'Bihar'}">selected</c:if>>Bihar</option>
					<option value="Chandigarh"
						<c:if test="${userProfile.address.addressState eq 'Chandigarh'}">selected</c:if>>Chandigarh</option>
					<option value="Chhattisgarh"
						<c:if test="${userProfile.address.addressState eq 'Chhattisgarh'}">selected</c:if>>Chhattisgarh</option>
					<option value="Dadra and Nagar Haveli"
						<c:if test="${userProfile.address.addressState eq 'Dadra and Nagar Haveli'}">selected</c:if>>Dadra
						and Nagar Haveli</option>
					<option value="Daman and Diu"
						<c:if test="${userProfile.address.addressState eq 'Daman and Diu'}">selected</c:if>>Daman
						and Diu</option>
					<option value="Delhi"
						<c:if test="${userProfile.address.addressState eq 'Delhi'}">selected</c:if>>Delhi</option>
					<option value="Goa"
						<c:if test="${userProfile.address.addressState eq 'Goa'}">selected</c:if>>Goa</option>
					<option value="Gujarat"
						<c:if test="${userProfile.address.addressState eq 'Gujarat'}">selected</c:if>>Gujarat</option>
					<option value="Haryana"
						<c:if test="${userProfile.address.addressState eq 'Haryana'}">selected</c:if>>Haryana</option>
					<option value="Himachal Pradesh"
						<c:if test="${userProfile.address.addressState eq 'Himachal Pradesh'}">selected</c:if>>Himachal
						Pradesh</option>
					<option value="Jammu and Kashmir"
						<c:if test="${userProfile.address.addressState eq 'Jammu and Kashmir'}">selected</c:if>>Jammu
						and Kashmir</option>
					<option value="Jharkhand"
						<c:if test="${userProfile.address.addressState eq 'Jharkhand'}">selected</c:if>>Jharkhand</option>
					<option value="Karnataka"
						<c:if test="${userProfile.address.addressState eq 'Karnataka'}">selected</c:if>>Karnataka</option>
					<option value="Kerala"
						<c:if test="${userProfile.address.addressState eq 'Kerala'}">selected</c:if>>Kerala</option>
					<option value="Lakshadweep"
						<c:if test="${userProfile.address.addressState eq 'Lakshadweep'}">selected</c:if>>Lakshadweep</option>
					<option value="Madhya Pradesh"
						<c:if test="${userProfile.address.addressState eq 'Madhya Pradesh'}">selected</c:if>>Madhya
						Pradesh</option>
					<option value="Maharashtra"
						<c:if test="${userProfile.address.addressState eq 'Maharashtra'}">selected</c:if>>Maharashtra</option>
					<option value="Manipur"
						<c:if test="${userProfile.address.addressState eq 'Manipur'}">selected</c:if>>Manipur</option>
					<option value="Meghalaya"
						<c:if test="${userProfile.address.addressState eq 'Meghalaya'}">selected</c:if>>Meghalaya</option>
					<option value="Mizoram"
						<c:if test="${userProfile.address.addressState eq 'Mizoram'}">selected</c:if>>Mizoram</option>
					<option value="Nagaland"
						<c:if test="${userProfile.address.addressState eq 'Nagaland'}">selected</c:if>>Nagaland</option>
					<option value="Orissa"
						<c:if test="${userProfile.address.addressState eq 'Orissa'}">selected</c:if>>Orissa</option>
					<option value="Pondicherry"
						<c:if test="${userProfile.address.addressState eq 'Pondicherry'}">selected</c:if>>Pondicherry</option>
					<option value="Punjab"
						<c:if test="${userProfile.address.addressState eq 'Punjab'}">selected</c:if>>Punjab</option>
					<option value="Rajasthan"
						<c:if test="${userProfile.address.addressState eq 'Rajasthan'}">selected</c:if>>Rajasthan</option>
					<option value="Sikkim"
						<c:if test="${userProfile.address.addressState eq 'Sikkim'}">selected</c:if>>Sikkim</option>
					<option value="Tamil Nadu"
						<c:if test="${userProfile.address.addressState eq 'Tamil Nadu'}">selected</c:if>>Tamil
						Nadu</option>
					<option value="Telangana"
						<c:if test="${userProfile.address.addressState eq 'Telangana'}">selected</c:if>>Telangana</option>
					<option value="Tripura"
						<c:if test="${userProfile.address.addressState eq 'Tripura'}">selected</c:if>>Tripura</option>
					<option value="Uttaranchal"
						<c:if test="${userProfile.address.addressState eq 'Uttaranchal'}">selected</c:if>>Uttaranchal</option>
					<option value="Uttar Pradesh"
						<c:if test="${userProfile.address.addressState eq 'Uttar Pradesh'}">selected</c:if>>Uttar
						Pradesh</option>
					<option value="West Bengal"
						<c:if test="${userProfile.address.addressState eq 'West Bengal'}">selected</c:if>>West
						Bengal</option>
				</select>
			</div>

			<div class="col-md-4 form-group">
				<span style="color: red">*</span><label for="SHIPPING_ZIP"
					class="control-label">Pin code</label> <input type="text"
					class="form-control" value="${userProfile.address.addressPin}"
					id="SHIPPING_ZIP" name="SHIPPING_ZIP">
			</div>
			<input type="hidden" name="addressId"
				value="${userProfile.address.addressId}" />
		</div>

		<div class="row">
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label for="PHONE_NUMBER"
					class="control-label">Phone Number</label> <input type="text"
					name="PHONE_NUMBER" class="form-control"
					value="${userProfile.phone}" id="PHONE_NUMBER">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Ext.</label>
				<input type="text" name="extension" value="${userProfile.extension}"
					class="form-control" id="extension">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Mobile</label>
				<input type="text" name="mobile" class="form-control"
					value="${userProfile.mobile}" id="mobile">
			</div>
		</div>
	</div>
	<div id="Other_Information" class="tab-pane fade">
		<h4>Other Information</h4>
		<div class="row">
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Position</label>
				<input type="text" name="position" value="${userProfile.position}"
					class="form-control" id="position">
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Role</label>
				<select class="form-control" name="role">
					<option value="" disabled>Select Role</option>
					<c:forEach items="${roles}" var="rol" varStatus="counter">
						<option value="${rol.userRoleId}"
							<c:if test="${rol.userRoleId eq userProfile.roleId.userRoleId}">selected</c:if>><c:choose>
								<c:when test="${rol.userRoleName eq 'ROLE_ADMIN'}">Admin</c:when>
								<c:when test="${rol.userRoleName eq 'ROLE_DIVISION_OFFICIER'}">Division Head</c:when>
								<c:when test="${rol.userRoleName eq 'ROLE_DEPTHEAD'}">Department Head</c:when>
								<c:when test="${rol.userRoleName eq 'ROLE_GROUPHEAD'}">Group Head</c:when>
								<c:when test="${rol.userRoleName eq 'ROLE_SCIENTIST'}">Scientist</c:when>
								<c:otherwise>${rol.comment }</c:otherwise>
							</c:choose>
						</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Replaced
					by</label> <input type="text" name="replaceBy" class="form-control"
					value="${userProfile.replaceBy}" id="replaceBy">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-4 col-xs-12">
				<span style="color: red">*</span><label class="control-label">Expiration
					date</label> <input type="text" name="expirationDate"
					value="${userProfile.expirationDate}"
					class="form-control datepicker-input" id="expirationDate">
			</div>
			<%-- <div class="form-group col-md-4 col-xs-12">
		<span style="color: red">*</span><label class="control-label">Assign
			Group</label> <select class="form-control" name="groupId">
			<option value="" disabled selected>Select Group</option>
			<c:forEach items="${groupList}" var="grp" varStatus="counter">
				<option value="${grp.groupId}"
					<c:if test="${grp.groupId eq userProfile.groupId.groupId}">selected</c:if>>${grp.groupName}</option>
			</c:forEach>
		</select>
	</div> --%>
		</div>
	</div>
	<div id="Basic_Details" class="tab-pane fade">
		<h4>Basic Details</h4>
		<div class="row">
			<div class="form-group col-md-4">
				<label for="designation" class="control-label"><span
					style="color: red">*</span>Designation</label> <input type="text"
					name="designation" id="designation"
					value="${userProfile.basicDetail.designation}" class="form-control"
					placeholder="">
			</div>

			<div class="form-group col-md-4">
				<label for="joiningDate" class="control-label"><span
					style="color: red">*</span>INMAS joining date</label> <input type="text"
					class="form-control mydate datepicker-input"
					value="${userProfile.basicDetail.joiningDate}" name="joiningDate"
					id="joiningDate" placeholder="MM/dd/yyyy">
			</div>
			<div class="form-group col-md-4">
				<label for="tillDate" class="control-label"><span
					style="color: red">*</span>To till date</label> <input type="text"
					class="form-control mydate datepicker-input"
					value="${userProfile.basicDetail.tillDate}" name="tillDate"
					id="tillDate" placeholder="MM/dd/yyyy">
			</div>
		</div>
		<div class="row ">
			<div class="col-md-4 form-group">
				<label for="assignedResearchArea" class="control-label"><span
					style="color: red">*</span>Research area assigned</label> <input
					class="form-control" name="researchArea"
					value="${userProfile.basicDetail.researchArea}"
					id="assignedResearchArea" value=""></input>
			</div>
			<div class="col-md-4 form-group">
				<label for="interestedResearchArea" class="control-label"><span
					style="color: red">*</span>Interested Research area</label> <input
					class="form-control" name="interestedResearchArea"
					value="${userProfile.basicDetail.interestedResearchArea}"
					id="interestedResearchArea" value=""></input>
			</div>

			<div class="col-md-4 form-group">
				<label for="qualification" class="control-label"><span
					style="color: red">*</span>Qualification</label> <input type="text"
					class="form-control"
					value="${userProfile.basicDetail.qualification}" id="qualification"
					name="qualification">
			</div>
		</div>
		<div class="row">

			<div class="col-md-4 form-group">
				<label for="researchPaper" class="control-label"><span
					style="color: red">*</span>Research paper</label> <input type="text"
					class="form-control"
					value="${userProfile.basicDetail.researchPaper}" id="researchPaper"
					name="researchPaper">
			</div>

			<div class="col-md-4 form-group">
				<label for="patent" class="control-label"><span
					style="color: red">*</span>Patent</label> <input type="text"
					class="form-control" value="${userProfile.basicDetail.patent}"
					id="patent" name="patent">
			</div>
		</div>
		<div class="row">

			<div class="col-md-4 form-group">
				<label for="researchPaper" class="control-label"><span
					style="color: red">*</span>Copyright</label> <input type="text"
					class="form-control" value="${userProfile.basicDetail.copyright}"
					id="copyright" name="copyright">
			</div>

			<div class="col-md-4 form-group">
				<label for="patent" class="control-label"><span
					style="color: red">*</span>ToT</label> <input type="text"
					class="form-control" value="${userProfile.basicDetail.tot}"
					id="tot" name="tot">
			</div>
		</div>
	</div>
	<div id="Manpower_Details" class="tab-pane fade">
		<h4>Manpower Details</h4>
		<input type="hidden" class="form-control"
			value="${userProfile.manpower.manpowerId}" id="manpowerId"
			name="manpower.manpowerId">
		<div class="row">

			<div class="col-md-4 form-group">
				<label for="jrf" class="control-label"><span
					style="color: red">*</span>JRF</label> <input type="text"
					class="form-control" value="${userProfile.manpower.jrf}" id="jrf"
					name="manpower.jrf">
			</div>

			<div class="col-md-4 form-group">
				<label for="srf" class="control-label"><span
					style="color: red">*</span>SRF</label> <input type="text"
					class="form-control" value="${userProfile.manpower.srf}" id="srf"
					name="manpower.srf">
			</div>
			<div class="col-md-4 form-group">
				<label for="mts" class="control-label"><span
					style="color: red">*</span>MTS</label> <input type="text"
					class="form-control" value="${userProfile.manpower.mts}" id="mts"
					name="manpower.mts">
			</div>
		</div>
		<div class="row">

			<div class="col-md-4 form-group">
				<label for="ra" class="control-label"><span
					style="color: red">*</span>RA</label> <input type="text"
					class="form-control" value="${userProfile.manpower.ra}" id="ra"
					name="manpower.ra">
			</div>

			<div class="col-md-4 form-group">
				<label for="projectAssinged" class="control-label"><span
					style="color: red">*</span>PROJECT ASSIGNED</label> <input type="text"
					class="form-control"
					value="${userProfile.manpower.projectAssinged}"
					id="projectAssinged" name="manpower.projectAssinged">
			</div>
		</div>
	</div>
	<div id="Project_Details" class="tab-pane fade">
		<div class="row">
			<div class="col-md-1 marT20">
				<h4 class="marT10">Project</h4>
			</div>
			<div class="col-md-2 marB20">
				<%-- 
		<input id='${userProfile.userProject.userProjectId}' type="hidden"
			value="${userProfile.userProject.userProjectId}"
			name="userProject.userProjectId">  --%>
				<select id="userProject" class="form-control"
					name="userProject.name">
					<option value="Intramural"
						<c:if test="${userProfile.userProject.name eq 'Intramural'}">selected</c:if>>Intramural</option>
					<option value="Extramural"
						<c:if test="${userProfile.userProject.name eq 'Extramural'}">selected</c:if>>Extramural</option>
				</select>
			</div>
			<div class="row col-md-12" id="Intramural">
				<c:if test="${userProfile.userProject.name eq 'Intramural'}">
					<c:forEach items="${userProfile.userProject.userProjectDetails}"
						var="projectDetail" varStatus="loop">
						<div class="col-md-4 form-group">
							<%--  <input id='Extramural_${projectDetail.userProjectDetailId}_Id' 
                                 type="hidden" value="${projectDetail.userProjectDetailId}" name="userProject.userProjectDetails[${loop.index}].userProjectDetailId"> --%>
							<label class="control-label"> <input
								id='Intramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Name'
								type="checkbox" value="${projectDetail.name}"
								name="userProject.userProjectDetails[${loop.index}].name"
								checked="checked">${projectDetail.name}</label> <label
								class="control-label"> <input
								id='Intramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Desc'
								type="text" class="form-control"
								value="${projectDetail.description}"
								name="userProject.userProjectDetails[${loop.index}].description">
							</label>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="row col-md-12 hide" id="Extramural">
				<c:if test="${userProfile.userProject.name eq 'Extramural'}">
					<c:forEach items="${userProfile.userProject.userProjectDetails}"
						var="projectDetail" varStatus="loop">
						<%--  <input id='Extramural_${projectDetail.userProjectDetailId}_Id' 
                                 type="hidden" value="${projectDetail.userProjectDetailId}" name="userProject.userProjectDetails[${loop.index}].userProjectDetailId"> --%>
						<div class="col-md-4 form-group">
							<label class="control-label"> <input
								id='Extramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Name'
								type="checkbox" value="${projectDetail.name}"
								name="userProject.userProjectDetails[${loop.index}].name"
								checked="checked">${projectDetail.name}</label> <label
								class="control-label"> <input
								id='Extramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Desc'
								type="text" class="form-control"
								value="${projectDetail.description}"
								name="userProject.userProjectDetails[${loop.index}].description">
							</label>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>

	<div id="Award_Details" class="tab-pane fade">
		<div class="row">
			<div class="col-md-1 marT20">
				<h4 class="marT10">Awards</h4>
			</div>
			<div class="col-md-2 marT20">
				<select id="AwardOption" class="form-control">
					<c:forEach begin="1" end="30" var="award" varStatus="loop">
						<option value="${award}">${award}</option>
					</c:forEach>
				</select>
			</div>
			<div class="row">
				<div class="col-md-12" id="AwardViewDB">
					<c:forEach items="${userProfile.userAwards}" var="userAward"
						varStatus="loop">
						<div class="col-md-4 form-group">
							<label class="control-label"> <input
								id="Award_${loop.index}_description"
								name='awards[${loop.index}].description'
								value="${userAward.description}" type="text"
								class="form-control"> <input id='Award_${loop.index}_id'
								name='awards[${loop.index}].id' value="${userAward.id}"
								type="hidden" class="form-control">
							</label>
						</div>
					</c:forEach>
					<div id="AwardViewOP"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						var path = '${path}';
						commonReady(path);
						function previewFile(path) {
							var preview = document.getElementById('imageLoad'); //selects the query named img
							var file;
							if (document.querySelector('input[type=file]')) {
								file = document
										.querySelector('input[type=file]').files[0]; //sames as here
								var reader = new FileReader();

								reader.onloadend = function() {
									preview.src = reader.result;
								}
								if (file) {
									var val = file.name.toLowerCase(), regex = new RegExp(
											"(.*?)\.(jpg|jpeg|png)$");

									if (!(regex.test(val))) {
										$(this).val('');
										$("#picFile").addClass("imageError");
										preview.src = preview.src = path
												+ "/assets/images/camera-icon.png";
										$("#fileError")
												.text(
														'Please choose correct file format');
									} else {
										reader.readAsDataURL(file);
										$("#picFile").removeClass("imageError");
										$("#fileError").html('');
									}
								} else {
									preview.src = preview.src = path
											+ "/assets/images/camera-icon.png";
								}
							}
						}
						$(function() {
							$('#picFile')
									.change(
											function() {
												var val = $(this).val()
														.toLowerCase(), regex = new RegExp(
														"(.*?)\.(jpg|jpeg|png)$");

												if (!(regex.test(val))) {
													$(this).val('');
													$(this).addClass(
															"imageError");
													$("#fileError")
															.text(
																	'Please choose correct file format');
												} else {
													$(this).removeClass(
															"imageError");
													$("#fileError").html('');
												}
												previewFile(path);
											});
						});
						var date = new Date();
						$('.mydate').datetimepicker({
							useCurrent : false,
							format : 'YYYY-MM-DD',
						});
						var date = new Date();
						$('.datepicker-input').datetimepicker({
							useCurrent : false,
							format : 'YYYY-MM-DD',
							maxDate : date,
							minDate : moment().subtract(65, 'years'),
						});

						$('#updateMyProfileBtn').on(
								'click',
								function() {
									if (!$("#picFile").hasClass("imageError")) {
										if ($("#updateProfileForm").valid()) {
											document.getElementById(
													"updateProfileForm")
													.submit();
										}
									}
								});

						function loadingProject(id, isClear) {
							$('#' + id)
									.children('option')
									.each(
											function(key, option) {
												$("#" + option.value).addClass(
														"hide");
												$(
														'#'
																+ option.value
																+ ' input[type=checkbox]')
														.each(
																function() {
																	if (isClear) {
																		this.checked = false;
																	}
																	$(
																			"#"
																					+ this.id)
																			.trigger(
																					'change');
																});
											});
							$("#" + $('#' + id).val()).removeClass("hide");
						}
						loadingProject('userProject', false);

						$('#userProject').on('change', function() {
							loadingProject(this.id, true);
						});

						function loadingProjectDetails(id, array) {
							for (detail in array) {
								var value = array[detail];
								var val = value.replace("\[", "_").replace(
										"\[", "_").replace("\(", "_").replace(
										"\)", "_").replace("\&", "_");
								var desc = id + '_' + val + '_Desc';
								var name = id + '_' + val + '_Name';
								if ($("#" + name).length == 0) {
									var view = ""
									view += '<div class="col-md-4 form-group">';
									view += '<label class="control-label"><input id="'+name+'" type="checkbox" value="'+value+'" >'
											+ value + '</label>';
									view += '<label class="control-label"><input id="'+desc+'" type="text" class="form-control"></label>';
									view += '</div>';
									$("#" + id).append(view);
								}
							}
						}

						var intramural = [ "TD", "MM", "S&T", "IF", "MM(UT)",
								"MM(PS)", "TASK", "CARS" ];
						loadingProjectDetails("Intramural", intramural);
						var extramural = [ 'S&T' ];
						loadingProjectDetails("Extramural", extramural)

						$("#Intramural input[type='checkbox']")
								.change(
										function() {
											var index = 0;
											$(
													'#Intramural input[type=checkbox]')
													.each(
															function() {
																var desc = this.id
																		.replace(
																				"_Name",
																				"_Desc");
																if (this.checked) {
																	this.name = "userProject.userProjectDetails["
																			+ index
																			+ "].name";
																	$(
																			"#"
																					+ desc)
																			.prop(
																					'name',
																					"userProject.userProjectDetails["
																							+ index
																							+ "].description");
																	index++;
																} else {
																	this.name = "";
																	$(
																			"#"
																					+ desc)
																			.prop(
																					'name',
																					"");
																}
															});
										});

						$("#Extramural input[type='checkbox']")
								.change(
										function() {
											var index = 0;
											$(
													'#Extramural input[type=checkbox]')
													.each(
															function() {
																var desc = this.id
																		.replace(
																				"_Name",
																				"_Desc");
																if (this.checked) {
																	this.name = "userProject.userProjectDetails["
																			+ index
																			+ "].name";
																	$(
																			"#"
																					+ desc)
																			.prop(
																					'name',
																					"userProject.userProjectDetails["
																							+ index
																							+ "].description");
																	index++;
																} else {
																	this.name = "";
																	$(
																			"#"
																					+ desc)
																			.prop(
																					'name',
																					"");
																}
															});
										});
						var award = $('#AwardOption');
						var lengthDP = parseInt('${userProfile.userAwards.size()}');
						var lengthOP = award.length;
						award.children('[value="' + lengthDP + '"]').attr(
								'selected', true);
						buildAwardView(lengthDP, lengthOP);

						$("#AwardOption").change(function() {
							var lengthOP = parseInt($(this).val());
							buildAwardView(lengthDP, lengthOP);
						});

						function buildAwardView(lengthDP, lengthOP) {
							var awardViewOP = $('#AwardViewOP');
							awardViewOP.empty();
							var html = "";
							for (var c = lengthDP; c < lengthOP; c++) {
								html += '<div class="col-md-4 form-group">';
								html += '<label class="control-label"><input id="Award_'+c+'_description" name="awards['+c+'].description" type="text" class="form-control"></label>';
								html += '</div>';
							}
							awardViewOP.html(html);
						}
					});
</script>