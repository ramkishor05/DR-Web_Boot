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
	<%-- <div class="clearfix">
		<a href="${path}/admin/createGroup">+ Add User Group</a>
	</div> --%>
	 <div class="register-box clearfix" style="margin-top:50px;">
	                    <div class="block-title">
	                         <h2 class="heading-box">Group List</h2>
	                    </div>
	                    <div id="table-content" class="block-content padBlock">
							<div class="responsive-table">
	                        <table class="table table-border-bottom">
	                            <thead>
	                                <tr>
	                                    <th class="w5">S.No.</th>
	                                    <th class="w15 text-left">Group Name</th>
	                                    <!-- <th class="w10 text-left">Group Head </th> -->
	                                    <th class="w10 text-left">Group Description</th>
	                                    <th class="w10 text-left">Number of Users</th>
	                                    <th class="w10 text-left actions noPdf">Actions</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:choose>
		                            	<c:when test="${deptList.size() ne 0}">
			                            	<c:forEach items="${groupList}" var="group" varStatus="counter">
						                                <tr>
						                                    <td>${counter.index+1 + param["page"]*10}</td>
						                                    <td>${group.groupName}</td>
						                                    <%-- <td>${group.status}</td> --%>
						                                     <td>${group.comment}</td>
						                                     <td>
						                                     	<a href="javascript:getGroupMembers(${group.groupId});"><span id="num${counter.index}"></span>
							                                     <script>
								                                     $.ajax({
								                            		     type  :   'GET',
								                            		     url   :   '${path}/dashboard/getGroupMemberCount/'+'${group.groupId}', 
								                            		     success  :  function(res){
								                            		    	var count = "${counter.index}";
								                            		    	$("#num"+count).text(res);
								                            		     },
								                            		     error: function(error){
								                            		     	console.log(error);
								                            		     }
								                            		}); 
							                                     </script>
							                                    </a>
						                                     </td>
						                                    <td>
						                                    	<a class="icon edit" href="${path}/admin/editGroup/${group.groupId}">Edit</a>
						                                        | <a class="icon delete" href="javascript:showDeleteModal(${group.groupId});">Delete</a>
						                                    </td>
						                                </tr>
			                            	</c:forEach>
	                            		</c:when>
		                            	<c:otherwise>
		                            		<script>
			                                	$(document).ready(function(){
			                                		$('.no-results').show();
			                                	})
		                                	</script>
		                            	</c:otherwise>
	                            	</c:choose>
								</tbody>
	                        </table>
	                        <div class="no-results text-center" style="display: none;">No results found!</div>
							</div>
	                    </div>
	
	                </div>
	            </div>
<!-- Confirm  Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="confirmModal"></h4>
                </div>
                <div class="modal-body">
                ${message}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
   <!-- Confirm  Modal -->
   
   <!-- Delete Confirm  Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="deleteConfirmModal" aria-labelledby="confirmDeleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="confirmDeleteModal">Confirm Delete</h4>
				</div>
				<div class="modal-body">
					<p>Are you sure that you want to delete this group?</p>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" id="deleteBtn" class="btn btn-default">Yes, Delete</button> -->
					<a href="" class="btn btn-default" id="deleteBtn">Yes, Delete</a>
		            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<!-- Delete Confirm  Modal -->

 <!-- Member  Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="groupMemberModal" aria-labelledby="groupMemberModal-label">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="groupMemberModal-label">Group Members</h4>
				</div>
				<div class="modal-body">
					<ul id="memberList">
					
					</ul>
				</div>
				<div class="modal-footer">
		            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<!-- Member  Modal -->
 <script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorCreateGroup.js"></script>
<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
		
		$('#createGroup').on('click',function(){
			if($("#groupVO").valid()){
				document.getElementById("groupVO").submit();
			}
		});
		if("${confirmGroupStatus}"==="SUCCESS"){
			showConfirmModal();
		}
		
	})
	function showConfirmModal() {
       $('#confirmModal').modal({
           backdrop: 'static',
           keyboard: false
       })
	}
	
	function showMemberModal() {
       $('#groupMemberModal').modal({
           backdrop: 'static',
           keyboard: false
       })
	}
	
	 function showDeleteModal(groupId) {
		 $("#deleteBtn").attr("href","<c:url value='/admin/delete-group-"+groupId+"'/>");
	    $('#deleteConfirmModal').modal({
	        backdrop: 'static',
	        keyboard: false
	    })
	 }
	 
	 function getGroupMembers(groupId){
		 $.ajax({
		     type  :   'GET',
		     url   :   '${path}/dashboard/getGroupMember/'+groupId, 
		     success  :  function(res){
		    	 $("#memberList").find("li").remove();
		    	$.each(res,function(x,y){
		    		var count=x+1;
		    		$("#memberList").append("<li>"+count+". "+y.email_ADDRESS+"</li>")
		    	})
		    	showMemberModal();
		     },
		     error: function(error){
		     	console.log(error);
		     }
		}); 
	 }
	 
</script>
</body>
</html>

