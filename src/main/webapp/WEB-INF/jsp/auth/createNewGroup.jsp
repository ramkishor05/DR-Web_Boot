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
	<form name='groupVO' id="groupVO" action="${path}/admin/saveGroup" method='POST'>
		<div class="register-box clearfix" id="createGroupDiv">
			<div class="content-box">
				<div class="inner-container">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <div class="block-title">
                         <h3>Create Group</h3>
                     </div>
                     <div class="block-content padBlock">
                     	
                     	<div class="row marB30">
                         	<div class="form-group col-xs-6">
                                <label for="groupName" class="control-label"><span style="color:red">*</span> Division Name</label>
                                <select class="form-control" name="divisionId">
	                                <option value="" disabled selected>Select Division</option>
					             	<c:forEach items="${division}" var="divis" varStatus="counter">
										<option value="${divis.divisionId}">${divis.divisionName}</option>
									</c:forEach>
				           		</select>
                             </div>
                         	
                         	<div class="form-group col-xs-6" id="departmentDiv">
                                <label for="groupName" class="control-label"><span style="color:red">*</span> Department Name</label>
                                <select class="form-control" name="departmentId" id="department">
                                	<option value="">Select Department</option>
				           		</select>
                             </div>
                         </div>
                         
                         <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="groupName" class="control-label"><span style="color:red">*</span> Group Name</label>
                                 <input class="form-control" id="groupName" name="groupName" type="text">
                             </div>
                           </div>
                          
                           <div class="row marB30">
                             <div class="form-group col-xs-12">
                                 <label for="comment" class="control-label"><span style="color:red">*</span> Group Description</label>
                                 <textarea class="form-control" name="description" id="description"></textarea>
                             </div>
                         </div>
                         <div class="row ">
                             <div class="text-center full-width marT10">
				                <button type="button" class="btn btn-primary" id="next1">Next</button>
				                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/welcomeAdmin'">Cancel</button>
				            </div>
                         </div>
                     </div>
	    	</div>
    	</div>
	</div>

    <%-- <div class="register-box clearfix hidden" id="addUserDiv" style="padding-top:20px;">
        <h2 class="heading-box">Add Users to Group</h2>
        <div class="inner-container">
            <div class="user-controls-wrap">
                <div class="user-controls">
                    <h2 class="heading-box">Available Users</h2>
                    <ul id="availableList">
                    <c:forEach var="user" items="${profile}">
                    	<li class="availableUser${user.profileId}"><label class="c-box"><input type="checkbox" name="availableUser" value="${user.profileId}"/> ${user.firstName} ${user.lastName}</input></label></li>
                    </c:forEach>
                    </ul>
                </div>

                <div class="user-controls fr">
                    <h2 class="heading-box">Assigned Users</h2>
                    <ul id="assignedList">
                        
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
                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/welcomeAdmin'">Cancel</button>
            </div>
        </div>                
    </div> --%>
    
    <div class="register-box clearfix hidden" id="reviewDiv" style="padding-top:20px;">
        <h2 class="heading-box">Review</h2>
        <div class="inner-container">
            <div class="user-controls-wrap">
                <p>Please ensure that the information displayed below is correct before saving the user group.</p>
                <ul style="">
                	<li><strong>User group name:</strong> <span id="reviewGroupName"></span></li>
                	<li><strong>Group head name:</strong> <span id="reviewGroupHead"></span></li>
                	<li><strong>User group Description:</strong> <span id="reviewDescription"></span></li>
                	<!-- <li><strong>Assigned users:</strong>
                		<ul id="reviewList">
                			
                		</ul>
                	</li> -->
                </ul>
               
            </div><!--user controls wrap end-->

            <div class="text-center full-width marT10">
                <button type="button" class="btn btn-primary" id="previous2">Previous</button>
                <button type="submit" class="btn btn-secondary" id="createGroup">Save</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${path}/admin/welcomeAdmin'">Cancel</button>
            </div>
        </div>                
    </div>
    </form>
</div>

 <script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorCreateGroup.js"></script>
<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
		
		$("select[name='divisionId']").on("change",function(){
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
		
		$('#previous1').on('click',function(){
			$("#createGroupDiv").removeClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		
		$('#previous2').on('click',function(){
			/* $("#createGroupDiv").addClass("hidden");
			$("#addUserDiv").removeClass("hidden");
			$("#reviewDiv").addClass("hidden"); */
			$("#createGroupDiv").removeClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").addClass("hidden");
		});
		$('#next1').on('click',function(){
			if($("#groupVO").valid()){
				/* $("#createGroupDiv").addClass("hidden");
				$("#addUserDiv").removeClass("hidden");
				$("#reviewDiv").addClass("hidden"); */
				$("#reviewGroupName").text($("#groupName").val());
				$("#reviewGroupHead").text($("#groupHead").val());
				$("#reviewDescription").text($("#description").val());
				
				$("#createGroupDiv").addClass("hidden");
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
				selectedUser.push($(this).val() + $(this).parent().text());
			});
			
			$(selectedUser).each(function(x,y){
				$("#assignedList").find(".assignedUser"+y.substring(0,y.indexOf(":"))).remove();
				$("#availableList").append('<li class="availableUser'+y.substring(0,y.indexOf(":"))+'"><label class="c-box"><input type="checkbox" name="availableUser" value='+y+'/>'+y.substring(y.lastIndexOf(":")+1,y.length)+' </label></li>')
			})
		});
		
		$("#submitUser").on("click",function(){
			var finalSelectedUser=[];
			$("input[name='assignedUser']").each(function(){
				finalSelectedUser.push($(this).val() + $(this).parent().text());
			});
			$("#reviewGroupName").text($("#groupName").val());
			$("#reviewGroupHead").text($("#groupHead").val());
			$("#reviewDescription").text($("#description").val());
			$("#reviewList").find('li').remove();
			$(finalSelectedUser).each(function(x,y){
				$("#reviewList").append('<li><input type="hidden" name="profileId['+x+']" value="'+y.substring(0,y.indexOf(":"))+'">'+y.substring(y.lastIndexOf(":")+1,y.length)+'</li>')
			})
			$("#createGroupDiv").addClass("hidden");
			$("#addUserDiv").addClass("hidden");
			$("#reviewDiv").removeClass("hidden");
		});
		
	 });
	 
</script>
</body>
</html>

