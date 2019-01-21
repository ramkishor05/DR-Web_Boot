<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
</head>
<div class="mid-box">
	<form name='divisionVO' id="divisionVO" action="${path}/admin/updateDivision" method='POST'>
		<div class="register-box clearfix" id="createDeptDiv">
			<div class="content-box">
				<div class="inner-container">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input value="${division.divisionId}" name="divisionId" type="hidden">
                     <div class="block-title">
                         <h3>Edit Division</h3>
                     </div>
                     <div class="block-content padBlock">
                   		
                         <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="departmentName" class="control-label">Division Name</label>
                                 <input class="form-control" id="divisionName" value="${division.divisionName}" name="divisionName" type="text">
                             </div>
                           </div>
                          <!--  <div class="row marB30">
                             <div class="form-group col-xs-6">
                                 <label for="deptHead" class="control-label">H.O.D. Name</label>
                                 <input class="form-control" id="deptHead" name="deptHead" type="text">
                             </div>
                            </div> -->
                           <div class="row marB30">
                             <div class="form-group col-xs-12">
                                 <label for="deptDescription" class="control-label">Division Description</label>
                                 <input class="form-control" type="text" name="divisionComment" value="${division.divisionComment}" id="divisionComment">
                             </div>
                         </div>
                         <div class="row ">
                             <div class="text-center full-width marT10">
				                <button type="button" class="btn btn-secondary" id="next1">Next</button>
				                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/welcomeAdmin'">Cancel</button>
				            </div>
                         </div>
                     </div>
	    	</div>
    	</div>
	</div>

    <div class="register-box clearfix hidden" id="reviewDiv" style="padding-top:20px;">
        <h2 class="heading-box">Review</h2>
        <div class="inner-container">
            <div class="user-controls-wrap">
                <p>Please ensure that the information displayed below is correct before saving the department.</p>
                <ul style="">
                	<li><strong>Division Name:</strong> <span id="reviewDeptName"></span></li>
                	<!-- <li><strong>H.O.D. Name:</strong> <span id="reviewDeptHead"></span></li> -->
                	<li><strong>Division Description:</strong> <span id="reviewDescription"></span></li>
                </ul>
               
            </div><!--user controls wrap end-->

            <div class="text-center full-width marT10">
                <button type="button" class="btn btn-primary" id="previous1">Previous</button>
                <button type="submit" class="btn btn-secondary">Save</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/welcomeAdmin'">Cancel</button>
            </div>
        </div>                
    </div>
    </form>
</div>

 <script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorCreateDepartment.js"></script>
<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
		$('#previous1').on('click',function(){
			$("#createDeptDiv").removeClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		$('#previous2').on('click',function(){
			$("#createDeptDiv").addClass("hidden");
			$("#addUserDiv").removeClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		$('#next1').on('click',function(){
			if($("#divisionVO").valid()){
				$("#reviewDeptName").text($("#divisionName").val());
				$("#reviewDescription").text($("#divisionComment").val());
				$("#createDeptDiv").addClass("hidden");
				$("#addUserDiv").addClass("hidden");
				$("#reviewDiv").removeClass("hidden");
			}
		});
		
	 });
	 
</script>
</body>
</html>
