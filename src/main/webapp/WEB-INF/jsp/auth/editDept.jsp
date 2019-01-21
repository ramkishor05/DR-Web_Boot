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
	<form name='departmentVO' id="departmentVO" action="${path}/admin/updateDept" method='POST'>
		<div class="register-box clearfix" id="createDeptDiv">
			<div class="content-box">
				<div class="inner-container">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="departmentId" value="${deptId.departmentId}" />
					<input type="hidden" name="divisionId" value="${deptId.divisionId}" />
                     <div class="block-title">
                         <h3>Create Department</h3>
                     </div>
                     <div class="block-content padBlock">
                        <%-- <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="departmentName" class="control-label">Division Name</label>
                                 <input class="form-control" id="departmentName" name="departmentName" value="${deptId.divisionId}" type="text">
                             </div>
                           </div> --%>
                         <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="departmentName" class="control-label">Department Name</label>
                                 <input class="form-control" id="departmentName" name="departmentName" value="${deptId.departmentName}" type="text">
                             </div>
                           </div>
                          <%--  <div class="row marB30">
                             <div class="form-group col-xs-6">
                                 <label for="deptHead" class="control-label">H.O.D. Name</label>
                                 <input class="form-control" id="deptHead" name="deptHead" value="${deptId.deptHead}" type="text">
                             </div>
                            </div> --%>
                           <div class="row marB30">
                             <div class="form-group col-xs-12">
                                 <label for="deptDescription" class="control-label">Department Description</label>
                                 <textarea class="form-control" name="deptDescription" id="deptDescription">${deptId.deptDescription}</textarea>
                             </div>
                         </div>
                         <div class="row ">
                             <div class="text-center full-width marT10">
				                <button type="button" class="btn btn-secondary" id="next1">Next</button>
				                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/getDeptList'">Cancel</button>
				            </div>
                         </div>
                     </div>
	    	</div>
    	</div>
	</div>

    <%-- <div class="register-box clearfix hidden" id="addUserDiv" style="padding-top:20px;">
        <h2 class="heading-box">Add Users to Department</h2>
        <div class="inner-container">
            <div class="user-controls-wrap">
                <div class="user-controls">
                    <h2 class="heading-box">Available Users</h2>
                    <ul id="availableList">
                    <c:forEach var="user" items="${profile}">
	                    <c:if test="${user.departmentId.deptId ne deptId.departmentId}">
	                    	<li class="availableUser${user.profileId}"><label class="c-box"><input type="checkbox" name="availableUser" value="${user.profileId}"/> ${user.firstName} ${user.lastName}</input></label></li>
	                    </c:if>
                    </c:forEach>
                    </ul>
                </div>

                <div class="user-controls fr">
                    <h2 class="heading-box">Assigned Users</h2>
                    <ul id="assignedList">
                         <c:forEach var="user" items="${userList}">
	                    	<li class="assignedUser${user.profileId}"><label class="c-box"><input type="checkbox" name="assignedUser" value="${user.profileId}"/> ${user.firstName} ${user.lastName}</input></label></li>
	                    </c:forEach>
                    </ul>
                </div>

                <div class="user-actions">
                    <button class="add-user btn btn-primary" type="button" id="addUsers" >Add <span>&raquo;</span></button>
                    <button class="remove-user btn btn-secondary" type="button" id="removeUsers"><span>&laquo;</span> Remove</button>
                </div>
            </div><!--user controls wrap end-->

            <div class="text-center full-width marT10">
                <button type="button" class="btn btn-primary" id="previous1">Previous</button>
                <button type="button" class="btn btn-secondary" id="submitUser">Next</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/getDeptList'">Cancel</button>
            </div>
        </div>                
    </div> --%>
    
    <div class="register-box clearfix hidden" id="reviewDiv" style="padding-top:20px;">
        <h2 class="heading-box">Review</h2>
        <div class="inner-container">
            <div class="user-controls-wrap">
                <p>Please ensure that the information displayed below is correct before saving the department.</p>
                <ul style="">
                	<li><strong>Department Name:</strong> <span id="reviewDeptName"></span></li>
                	<!-- <li><strong>H.O.D. Name:</strong> <span id="reviewDeptHead"></span></li> -->
                	<li><strong>Department Description:</strong> <span id="reviewDescription"></span></li>
                	<!-- <li><strong>Assigned Members:</strong>
                		<ul id="reviewList">
                			
                		</ul>
                	</li> -->
                </ul>
               
            </div><!--user controls wrap end-->

            <div class="text-center full-width marT10">
                <button type="button" class="btn btn-primary" id="previous2">Previous</button>
                <button type="submit" class="btn btn-secondary">Save</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/getDeptList'">Cancel</button>
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
			/* $("#createDeptDiv").addClass("hidden");
			$("#addUserDiv").removeClass("hidden");
			$("#reviewDiv").addClass("hidden"); */
			$("#createDeptDiv").removeClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		$('#next1').on('click',function(){
			if($("#departmentVO").valid()){
				/* $("#createDeptDiv").addClass("hidden");
				$("#addUserDiv").removeClass("hidden");
				$("#reviewDiv").addClass("hidden"); */
				$("#reviewDeptName").text($("#departmentName").val());
				$("#reviewDeptHead").text($("#deptHead").val());
				$("#reviewDescription").text($("#deptDescription").val());
				$("#reviewList").find('li').remove();
				$("#createDeptDiv").addClass("hidden");
				$("#addUserDiv").addClass("hidden");
				$("#reviewDiv").removeClass("hidden");
			}
		});
		
		$("#addUsers").on("click",function(){
			var selected=[];
			$("input[name='availableUser']:checked").each(function(){
				selected.push($(this).val()+":"+$(this).parent().text());
			});
			
			$(selected).each(function(x,y){
				$("#availableList").find(".availableUser"+y.substring(0,y.indexOf(":"))).remove();
				$("#assignedList").append('<li class="assignedUser'+y.substring(0,y.indexOf(":"))+'"><label class="c-box"><input type="checkbox" name="assignedUser" value='+y+'/>'+y.substring(y.lastIndexOf(":")+1,y.length)+' </label></li>')
			})
		});
		
		$("#removeUsers").on("click",function(){
			var selectedUser=[];
			$("input[name='assignedUser']:checked").each(function(){
				selectedUser.push($(this).val() +":"+ $(this).parent().text());
			});
			
			$(selectedUser).each(function(x,y){
				$("#assignedList").find(".assignedUser"+y.substring(0,y.indexOf(":"))).remove();
				$("#availableList").append('<li class="availableUser'+y.substring(0,y.indexOf(":"))+'"><label class="c-box"><input type="checkbox" name="availableUser" value='+y+'/>'+y.substring(y.lastIndexOf(":")+1,y.length)+' </label></li>')
			})
		});
		
		$("#submitUser").on("click",function(){
			var finalSelectedUser=[];
			$("input[name='assignedUser']").each(function(){
				finalSelectedUser.push($(this).val() +":"+ $(this).parent().text());
			});
			$("#reviewDeptName").text($("#departmentName").val());
			$("#reviewDeptHead").text($("#deptHead").val());
			$("#reviewDescription").text($("#deptDescription").val());
			$("#reviewList").find('li').remove();
			$(finalSelectedUser).each(function(x,y){
				$("#reviewList").append('<li><input type="hidden" name="profileId['+x+']" value="'+y.substring(0,y.indexOf(":"))+'">'+y.substring(y.lastIndexOf(":")+1,y.length)+'</li>')
			})
			$("#createDeptDiv").addClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").removeClass("hidden");
		});
		
	 });
	 
</script>
</body>
</html>
