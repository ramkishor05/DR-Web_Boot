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
	<form name='recipientVO' id="recipientVO" action="${path}/scientist/diary/addDiaryUsers" method='POST'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="register-box clearfix" id="senderDiv">
				<div class="content-box">
					<div class="inner-container">
	                     <div class="block-title">
	                         <h3>Sender Detail</h3>
	                     </div>
	                     <div class="block-content padBlock">
	                     	<div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                            	<p>Diary Id: <strong>${diary.dairyNumber}</strong></p>
	                            	<input type="hidden" name="diaryId" value="${diary.diaryId}">
	                            </div>
                       		</div>
	                         <div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                                 <label for="senderName" class="control-label"><span style="color:red">*</span>Sender name</label>
	                                 <input class="form-control" id="senderName" name="senderName" value="${profile.firstName} ${profile.lastName}" type="text">
	                             </div>
	                         	<div class="form-group col-xs-6">
	                                 <label for="userName" class="control-label"><span style="color:red">*</span>User name</label>
	                                 <input class="form-control" id="userName" name="userName" value="${profile.userName}" type="text">
	                             </div>
                       		</div>
                       		
                       		<div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                                 <label for="email" class="control-label"><span style="color:red">*</span>Email id</label>
	                                 <input class="form-control" id="email" name="email" value="${profile.email}" type="text">
	                             </div>
							</div>
                       		
                       		<div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                                 <label for="designation" class="control-label"><span style="color:red">*</span>Designation</label>
	                                 <input class="form-control" id="designation" name="designation" value="${profile.basicDetail.designation}" type="text">
	                             </div>
                       		
	                         	<div class="form-group col-xs-6">
	                                 <label for="departmentName" class="control-label"><span style="color:red">*</span>Department</label>
	                                 <input class="form-control" id="departmentName" name="departmentName" value="${profile.departmentId.deptName}" type="text">
	                             </div>
							</div>
                       		
                       		<div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                                 <label for="mobile" class="control-label"><span style="color:red">*</span>Mobile no.</label>
	                                 <input class="form-control" id="mobile" name="mobile" value="${profile.mobile}" type="text">
	                             </div>
                       		
	                         	<div class="form-group col-xs-6">
	                                 <label for="phone" class="control-label"><span style="color:red">*</span>Office no.</label>
	                                 <input class="form-control" id="phone" name="phone" value="${profile.phone}" type="text">
	                             </div>
							</div>
                       		
                       		<div class="row marB30">
	                         	<div class="form-group col-xs-6">
	                                 <label for="extension" class="control-label"><span style="color:red">*</span>Ext.</label>
	                                 <input class="form-control" id="extension" name="extension" value="${profile.extension}" type="text">
	                             </div>
                       		
	                         	<div class="form-group col-xs-6">
	                                 <label for="faxNo" class="control-label"><span style="color:red">*</span>Fax no.</label>
	                                 <input class="form-control" id="faxNo" name="faxNo" value="" type="text">
	                             </div>
							</div>
                       		
                       		<div class="row marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="address" class="control-label"><span style="color:red">*</span>Communication Address</label>
	                                 <input class="form-control" id="address" name="address" value="${profile.addressId.addressLine}, ${profile.addressId.addressCity}, ${profile.addressId.addressState}" type="text">
	                             </div>
                       		</div>
                       		
                         	<div class="row ">
                            	<div class="full-width marT10">
                            		<c:choose>
	                            		<c:when test="${diary.diaryType eq 'External'}">
					                		<button type="button" class="btn btn-primary marR10" id="next1">Next</button>
					                	</c:when>
					                	<c:otherwise>
					                		<button type="submit" class="btn btn-primary marR10">Next</button>
					                	</c:otherwise>
				                	</c:choose>
				            	</div>
                         	</div>
                     	</div>
	    			</div>
    			</div>
			</div>
  
  	<!-- Step 3 -->
    	<div class="register-box clearfix hidden" id="recipientDiv">
			<div class="content-box">
				<div class="inner-container">
                     <div class="block-title">
                         <h3>Recipient(s) Detail</h3>
                     </div>
                     <div class="user-controls-wrap">
                     	<div class="row marB30">
                         	<div class="form-group col-xs-6">
                            	<p>Diary Id: <strong>${diary.dairyNumber}</strong></p>
                            </div>
                   		</div>
		                <div class="user-controls">
		                    <div class="marB30">
	                         	<div class="form-group marT10 col-xs-12">
	                                 <label for="recipientName" class="control-label"><span style="color:red">*</span>Recipient name</label>
	                                 <input class="form-control" id="recipientName" name="recipientName" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="recipientDesignation" class="control-label"><span style="color:red">*</span>Designation</label>
	                                 <input class="form-control" id="recipientDesignation" name="recipientDesignation" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="recipientDepartment" class="control-label"><span style="color:red">*</span>Department</label>
	                                 <input class="form-control" id="recipientDepartment" name="recipientDepartment" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="recipientAddress" class="control-label"><span style="color:red">*</span>Communication Address</label>
	                                 <input class="form-control" id="recipientAddress" name="recipientAddress" value="" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="recipientEmail" class="control-label"><span style="color:red">*</span>Email</label>
	                                 <input class="form-control" id="recipientEmail" name="recipientEmail" value="" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="recipientOfficeNo" class="control-label"><span style="color:red">*</span>Office no.</label>
	                                 <input class="form-control" id="recipientOfficeNo" name="officeNumber" type="text">
	                            </div>
	                          </div>
	                          <div class="marB30">
                         		<div class="form-group col-xs-12">
	                                 <label for="recipientExt" class="control-label"><span style="color:red">*</span>Ext.</label>
	                                 <input class="form-control" id="recipientExt" name="recipientExt" type="text">
	                            </div>
	                          </div>
		                	</div>
		
		                	<div class="user-controls fr">
		                    	<h2 class="heading-box">Multiple Recipients</h2>
		                    	<ul id="assignedList">
		                        
		                    	</ul>
		                    	<table class="table">
			                    	<thead>
			                    		<tr>
					                    	<th>Recipient name</th>
					                    	<th>Designation</th>
					                    	<th>&nbsp;</th>
				                    	</tr>
				                    </thead>
			                    	<tbody id="tableBody">
			                    	<c:forEach items="${recipientList}" var="map">
			                    		<tr id="tr${map.recipentId}">
				                    		<td>${map.name}</td>
				                    		<td>${map.designation}</td>
				                    		<td><a href="javascript:deleteRecipient(${map.recipentId});">Delete</a></td>
			                    		</tr>
			                    	</c:forEach>
			                    	</tbody>
		                    	</table>
		                	</div>
		
			                <div class="user-actions">
			                    <button class="add-user btn btn-primary" type="button" id="addRecipient" >Add <span>&raquo;</span></button>
			                </div>
		            	</div>
	                     
                   		<div class="row ">
                           	<div class="full-width marT10">
			                	<button type="button" class="btn btn-primary marR10" id="next2">Next</button>
			                	<button type="button" class="btn btn-secondary" id="back1">Back</button>
			            	</div>
                       	</div>
	    			</div>
    			</div>
			</div>
    </form>
</div>

 <script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorDiary.js"></script>
<script>
	function csrfSafeMethod(method) {
	    // these HTTP methods do not require CSRF protection
	    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
	}
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);

		$("#next1").on("click",function(){
			if($("#recipientVO").valid()){
				$("#senderDiv").addClass("hidden");
				$("#fileDiv").addClass("hidden");
				$("#recipientDiv").removeClass("hidden");
			}
		});
		
		var csrfToken = $("meta[name='_csrf']").attr("content") ? $("meta[name='_csrf']").attr("content") : $("input[name=_csrf]").val();
		var csrfHeader = $("meta[name='_csrf_header']").attr("content"); 
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
		
		
		$("#next2").on("click",function(){
			if($("#tableBody").find("tr").length>0){
				document.getElementById("recipientVO").submit();
			}else{
				if($("#recipientVO").valid()){
				}
			}
		});
		
		$("#back1").on("click",function(){
			$("#senderDiv").removeClass("hidden");
			$("#fileDiv").addClass("hidden");
			$("#recipientDiv").addClass("hidden");
		});
		
		$("#addRecipient").on("click",function(){
			var recipientData = {"name": $("#recipientName").val(),"designation": $("#recipientDesignation").val(),
					"officeNumber": $("#recipientOfficeNo").val(),"ext" : ($("#recipientExt").val()).toString(),"diaryId" : "${diary.diaryId}", "recipientEmail" : $("#recipientEmail").val(), "recipientAddress" : $("#recipientAddress").val() };
			$.ajax({
			     type  :   'POST',
			     url   :   '${path}/diary/addRecipient', 
			     dataType: 'json',
			     contentType: 'application/json; charset=utf-8',
			     data: JSON.stringify(recipientData),
			    
			     success  :  function(recipientId){
			    	$.ajax({
					     type  :   'GET',
					     url   :   '${path}/diary/getRecipientById/'+recipientId, 
					     dataType: 'json',
					     contentType: 'application/json',
					     success  :  function(res){
					    	$("#tableBody").append("<tr id='tr"+res.recipentId+"'><td>"+res.name+"</td><td>"+res.designation+"</td><td><a href='javascript:deleteRecipient("+res.recipentId+");'>Delete</a></td></tr>")
					    	$(".user-controls-wrap").find("input").val("");
					     },
					     error: function(error){
					     	console.log("RRRR",error);
					     }
					}); 
			     },
			     error: function(error){
			     	console.log("BBB",error);
			     }
			}); 
		})
		
	 });
	function deleteRecipient(recipentId){
    	$.ajax({
		     type  :   'DELETE',
		     url   :   '${path}/diary/deleteRecipientById/'+recipentId, 
		     success  :  function(res){
		    	$("#tr"+recipentId).remove();
		     },
		     error: function(error){
		     	console.log("BBBBBBBB",error);
		     }
		}); 
		     
	}
</script>
</body>
</html>
