<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
$(document).ready(function() {
		var path = '${path}';
		commonReady(path);
	});
	
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
</head>
<body>
<div class="container-fluid">
	<div class="main-wrap">
	<div class="main">
	   <div class="dashboard-content">
	   <form name="document" id="updateProfileForm" method="POST" enctype="multipart/form-data" action="${path}/admin/updateInfo" autocomplete="off">
       		<div class="row marB25 equalHeightRow ">
           	<div class="col-lg-3 col-md-6 equalHeightCol">
               <div class="bg-white">
                   <div class="block-title">
                       <h3>Upload Image</h3>
                   </div>
                   <div class="block-content padBlock">
                       <!-- <script src="assets/js/dropzone.js"></script> -->
                      <!-- <form id="my-awesome-dropzone" class="dropzone" action="/file-upload"> -->
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
                             <div class="form-group marB35">
                                 <input type="file" name="file" id="picFile" class="dz-clickable needsclick" onchange="previewFile('${path}')">
                                  <span id="fileError" class="help-block error"> </span>
                             </div>
                        <!--    <button type="button" class="btn btn-block">Upload</button>
                     	 </form> -->
                   </div>

                   <div class="heightEqualizerStrip"></div>
               </div>
           </div>
           
    
           <div class="col-lg-3 col-md-6 equalHeightCol">
           <input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
		<input type="hidden" name="id"	value="${userProfile.profileId}" />
		<input type="hidden" name="addressId"	value="${userProfile.addressId.addressId}" />
               <div class="bg-white">
                   <div class="block-title">
                       <h3>Personal Information</h3>
                   </div>
                   <div class="block-content padBlock">
                       <div class="form-group">
                           <label for="" class="control-label"><span style="color:red">*</span>First Name</label>
                           <input type="text" class="form-control" name="firstName" id="" value="${userProfile.firstName}" placeholder="">
                       </div>
                       <div class="form-group">
                           <label for="" class="control-label"><span style="color:red">*</span>Last Name</label>
                           <input type="text" class="form-control" name="lastName" id="" value="${userProfile.lastName}" placeholder="">
                       </div>
                       <div class="form-group">
                           <label for="" class="control-label"><span style="color:red">*</span>Date of Birth</label>
                           <input type="text" class="form-control datepicker-input" name="birthDay" value="${userProfile.dateOfBirth}" id="birthDay" placeholder="YYYY-MM-DD">
                          
                       </div>
                       <script>
                      		var date=new Date();
                           	$('.datepicker-input').datetimepicker({
                           		useCurrent: false ,
                            	format: 'YYYY-MM-DD',
                              	maxDate: date,
                              	minDate: moment().subtract(65, 'years'),
                           });
                           $(".datepicker-input").val("${userProfile.dateOfBirth}").change();
                       </script>
                       <label class="control-label" for=""><span style="color:red">*</span>Gender</label>
                       <div class="form-group">
                       <c:choose>
	                       <c:when test="${userProfile.gender eq 'MALE'}">
	                           <label class="radio-inline"><input type="radio" checked name="gender" value="MALE">
			                    Male </label>
	                            <label class="radio-inline">
			                    <input type="radio" name="gender" value="FEMALE">
			                    Female </label>
			               </c:when>
			               <c:otherwise>
			               		<label class="radio-inline"><input type="radio"  name="gender" value="MALE">
			                    Male </label>
	                            <label class="radio-inline">
			                    <input type="radio" name="gender" checked value="FEMALE">
			                    Female </label>
			               </c:otherwise>
		               </c:choose>
                        </div>
                      </div>
                      <div class="heightEqualizerStrip"></div>
                  </div>
              </div>
             <div class="col-lg-6 col-md-12 equalHeightCol">
                 <div class="bg-white">
                     <div class="block-title">
                         <h3>Contact Information</h3>
                     </div>
                     <div class="block-content padBlock">
                         <div class="row form-group">
                             <div class="col-md-12">
                             <label for="" class="control-label"><span style="color:red">*</span>Address</label>
                                 <input class="form-control" name="SHIPPING_ADDRESS" value="${userProfile.addressId.addressLine}"></input>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-6 form-group">
                                 <label for="" class="control-label"><span style="color:red">*</span>City</label>
                                 <input class="form-control" id="" name="SHIPPING_CITY" value="${userProfile.addressId.addressCity}" placeholder="" type="text">
                             </div>
                             <div class="col-md-6 form-group">
                                 <label for="" class="control-label"><span style="color:red">*</span>State</label>
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
                                </div>
                           <div class="row">
                               <div class="col-md-6 form-group">
                                   <label for="" class="control-label"><span style="color:red">*</span>Pin code</label>
                                   <input class="form-control" id="" name="SHIPPING_ZIP" value="${userProfile.addressId.addressPin}" placeholder="" type="text">
                               </div>
                               <div class="col-md-6 form-group">
                                   <label for="" class="control-label"><span style="color:red">*</span>Phone Number</label>
                                   <input class="form-control" id="" name="PHONE_NUMBER" value="${userProfile.phone}" placeholder="" type="text">
                               </div>
                           </div>
                           <div class="row form-group">
                               <div class="col-md-6">
                                   <label for="" class="control-label"><span style="color:red">*</span>Email Address</label>
                                   <input class="form-control" id="" name="EMAIL_ADDRESS" value="${userProfile.email}" placeholder="" type="text">
                               </div>
                           </div>
                            <h4>Manpower Details</h4>
                         <input type="hidden" class="form-control" value="${userProfile.manpowerDetail.manpowerId}" id="manpowerId" name="manpowerDetail.manpowerId">
                         <div class="row">
                        
                             <div class="col-md-4 form-group">
                                 <label for="jrf" class="control-label"><span style="color:red">*</span>JRF</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.jrf}" id="jrf" name="manpowerDetail.jrf">
                             </div>
                             
                             <div class="col-md-4 form-group">
                                 <label for="srf" class="control-label"><span style="color:red">*</span>SRF</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.srf}" id="srf" name="manpowerDetail.srf" >
                             </div>
                             <div class="col-md-4 form-group">
                                 <label for="mts" class="control-label"><span style="color:red">*</span>MTS</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.mts}" id="mts" name="manpowerDetail.mts">
                             </div>
                         </div>
                          <div class="row">
                        
                             <div class="col-md-4 form-group">
                                 <label for="ra" class="control-label"><span style="color:red">*</span>RA</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.ra}" id="ra" name="manpowerDetail.ra">
                             </div>
                             
                             <div class="col-md-4 form-group">
                                 <label for="projectAssinged" class="control-label"><span style="color:red">*</span>PROJECT ASSIGNED</label>
                                 <input type="text" class="form-control" value="${userProfile.manpowerDetail.projectAssinged}" id="projectAssinged" name="manpowerDetail.projectAssinged" >
                             </div>
                         </div>
                          <div class="row">
                           <div class="col-md-1 marT20">
                            <h4 class="marT10">
                            Project</h4>
                            </div>
                          <div class="col-md-2 marB20">
                             <%--  <input id='${userProfile.userProject.userProjectId}' 
                                 type="hidden" value="${userProfile.userProject.userProjectId}" name="userProject.userProjectId"> --%>
	                          <select id="userProject" class="form-control" name="userProject.name" >
	                         	 <option value="Intramural" <c:if test="${userProfile.userProject.name eq 'Intramural'}">selected</c:if>>Intramural</option>
	                          	 <option value="Extramural" <c:if test="${userProfile.userProject.name eq 'Extramural'}">selected</c:if>>Extramural</option>
	                          </select>
                          </div>
                          <div class="row col-md-12" id="Intramural">
                            <c:if test="${userProfile.userProject.name eq 'Intramural'}">
                             <c:forEach items="${userProfile.userProject.userProjectDetails}" var="projectDetail" varStatus ="loop">
                               <div class="col-md-4 form-group">
                               <%--  <input id='Extramural_${projectDetail.userProjectDetailId}_Id' 
                                 type="hidden" value="${projectDetail.userProjectDetailId}" name="userProject.userProjectDetails[${loop.index}].userProjectDetailId"> --%>
                                 <label class="control-label">
                                  <input id='Intramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Name' 
                                 type="checkbox" value="${projectDetail.name}" name="userProject.userProjectDetails[${loop.index}].name" checked="checked">${projectDetail.name}</label>
                                 <label class="control-label">
                                 <input id='Intramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Desc' 
                                 type="text" class="form-control" value="${projectDetail.description}" name="userProject.userProjectDetails[${loop.index}].description">
                                 </label>
                            	</div>
                             </c:forEach>
                             </c:if>
                         </div>
                          <div class="row col-md-12 hide" id="Extramural">
                           <c:if test="${userProfile.userProject.name eq 'Extramural'}">
                             <c:forEach items="${userProfile.userProject.userProjectDetails}" var="projectDetail" varStatus ="loop">
                              <%--  <input id='Extramural_${projectDetail.userProjectDetailId}_Id' 
                                 type="hidden" value="${projectDetail.userProjectDetailId}" name="userProject.userProjectDetails[${loop.index}].userProjectDetailId"> --%>
                             <div class="col-md-4 form-group">
                                 <label class="control-label">
                                    <input id='Extramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Name' 
                                 type="checkbox" value="${projectDetail.name}" name="userProject.userProjectDetails[${loop.index}].name" checked="checked">${projectDetail.name}</label>
                                 <label class="control-label">
                                 <input id='Extramural_${projectDetail.name.replaceAll("\\[", "_").replaceAll("\\]","_").replaceAll("\\(","_").replaceAll("\\)","_").replaceAll("\\&","_")}_Desc' 
                                 type="text" class="form-control" value="${projectDetail.description}" name="userProject.userProjectDetails[${loop.index}].description">
                                 </label>
                            	</div>
                            </c:forEach>
                           </c:if>
                         </div>
                         </div>
                          <div class="row">
                           <div class="col-md-1 marT20">
                            <h4 class="marT10">Awards</h4>
                          </div>
                          <div class="col-md-2 marT20">
	                          <select id="AwardOption" class="form-control" >
	                          <c:forEach  begin = "1" end = "30" var="award" varStatus ="loop">
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
												id="Award_${loop.index}_description" name='awards[${loop.index}].description' 
												value="${userAward.description}" type="text" class="form-control">
												<input id='Award_${loop.index}_id'
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
                       <div class="heightEqualizerStrip"></div>
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="col-md-12">
                   <div class="bg-white">
                       <div class="block-content padBlock">
                           <div class="row">
                               <div class="col-md-12 text-right">
                               		<a type="button" role="button" class="btn btn-default" href="${path}/admin/welcomeAdmin">Cancel</a>
                                   	<button type="button" id="updateMyProfileBtn" class="btn btn-default">Submit</button>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               
           </div>
         </form>
       </div>
       </div>
       </div>
   </div>
    <script src="${path}/assets/js/bootstrap.min.js"></script>
	<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
    <script src="${path}/assets/bootstrap/js/custom/validatorUserManagement.js"></script>
    <script>
    	$(document).ready(function(){
    		$('#updateMyProfileBtn').on('click',function(){
    			if(!$("#picFile").hasClass("imageError")){
	    			if($("#updateProfileForm").valid()){
	    				document.getElementById("updateProfileForm").submit();
	    			}
    			}
    		});
    		

   		 function loadingProject(id,isClear){
   			 $('#'+id).children('option').each( function(key,option){            
   				 $("#"+option.value).addClass("hide");
   				 $('#'+option.value+' input[type=checkbox]').each(function () {
   					 if(isClear){
   						 this.checked=false;
   					 }
   					 $("#"+this.id).trigger('change');
   				 });
   	        });
   			 $("#"+$('#'+id).val()).removeClass("hide");
   		 }
   		 loadingProject('userProject',false);
   		
   		 $('#userProject').on('change',function(){
   			 loadingProject(this.id,true);
   		}); 
   		 
   		 function loadingProjectDetails(id,array){
   			 for(detail in array){
   				 var value=array[detail];
   				 var val=value.replace("\[","_").replace("\[","_").replace("\(","_").replace("\)","_").replace("\&","_");
   				 var desc=id+'_'+val+'_Desc';
   				 var name=id+'_'+val+'_Name';
   				 if($("#"+name).length == 0){
   					 var view=""
   					 view+='<div class="col-md-4 form-group">';
   					 view+='<label class="control-label"><input id="'+name+'" type="checkbox" value="'+value+'" >'+value+'</label>';
   					 view+='<label class="control-label"><input id="'+desc+'" type="text" class="form-control"></label>';
   					 view+='</div>';
   					 $("#"+id).append(view);
   				 }
   			  }
   		 }
   		 
   		 var intramural=["TD","MM","S&T","IF","MM(UT)","MM(PS)","TASK","CARS"];
   		 loadingProjectDetails("Intramural",intramural);
   		 var extramural=['S&T'];
   		 loadingProjectDetails("Extramural",extramural)
   		 
   		 
   		 $("#Intramural input[type='checkbox']").change(function() {
   			  var index=0;
   			  $('#Intramural input[type=checkbox]').each(function () {
   				  var desc=this.id.replace("_Name","_Desc");
   				  if (this.checked) {
   					  this.name="userProject.userProjectDetails["+index+"].name";
   					  $("#"+desc).prop('name',"userProject.userProjectDetails["+index+"].description");
   					  index++;
   				  }else{
   					  this.name="";
   					  $("#"+desc).prop('name',"");
   				  }
   			  });
   		 });
   		 
   		 $("#Extramural input[type='checkbox']").change(function() {
   			  var index=0;
   			  $('#Extramural input[type=checkbox]').each(function () {
   				  var desc=this.id.replace("_Name","_Desc");
   				  if (this.checked) {
   					  this.name="userProject.userProjectDetails["+index+"].name";
   					  $("#"+desc).prop('name',"userProject.userProjectDetails["+index+"].description");
   					  index++;
   				  }else{
   					  this.name="";
   					  $("#"+desc).prop('name',"");
   				  }
   			  });
   		 });
   		 var award=$('#AwardOption');
   		 var lengthDP=parseInt('${userProfile.userAwards.size()}');
   		 var lengthOP=award.length;
   		 award.children('[value="'+lengthDP+'"]').attr('selected', true);
   		 buildAwardView(lengthDP,lengthOP);
   		 
   		 $("#AwardOption").change(function() {
   			 var lengthOP=parseInt($(this).val());
   			 buildAwardView(lengthDP,lengthOP);
   		 });
   		 
   		 function buildAwardView(lengthDP,lengthOP){
   			 var awardViewOP=$('#AwardViewOP');
   			 awardViewOP.empty();
   			  var html="";
   			  for (var c = lengthDP; c < lengthOP; c++) {
   				  html+= '<div class="col-md-4 form-group">';
   				  html+= '<label class="control-label"><input id="Award_'+c+'_description" name="awards['+c+'].description" type="text" class="form-control"></label>';
   				  html+= '</div>';
   			  }
   			  awardViewOP.html(html);
   		 }
    	})
    	
    </script>
</body>
</html>

