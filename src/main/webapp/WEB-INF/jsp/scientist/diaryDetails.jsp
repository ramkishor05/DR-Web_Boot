<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />

    <link href="${path}/assets/css/progress_bar.css" rel="stylesheet">
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
	<div class="mid-box">
            <div class="register-box clearfix">
                <h2 class="heading-box">Diary Details</h2>
                <div class="inner-container">
               <form name="assignmentVO" id="assignmentVO" method="POST" action="${path}/scientist/diary/submitFile">
               <div class="col-md-6">
	 				<div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <label class="control-label">Diary number</label>
                            <input type="text" name="dairyNumber" readonly value="${diary.dairyNumber}" class="form-control">
                        </div>
                     </div>
                     <div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <label for="EMAIL_ADDRESS" class="control-label">File number</label>
                            <input class="form-control" id="fileNumber" readonly value="${file.fileNumber}" name="fileNumber" type="text">
                        </div>
                     </div>
                     <div class="row">
                         <div class="form-group col-md-4 col-xs-12">
                            <label class="control-label">Sender name</label>
                            <input type="text" name="senderName" readonly value="${diary.senderName}" class="form-control">
                        </div>
                      </div>
                     <div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <label for="fileName" class="control-label">Subject</label>
                            <input class="form-control" id="fileName" readonly value="${file.fileName}" name="fileName" type="text">
                        </div>
                      </div>
                     <div class="row">
                       <div class="form-group col-md-12 col-xs-12">
                            <label class="control-label">Description</label>
                            <textarea class="form-control" readonly id="fileDescription">${file.fileDescription}</textarea>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-6">
						<h4 class="c-black">List of Documents</h4>
						<div class="responsive-table">
							<table class="table table-border-bottom">
								<thead>
									<tr>
										<th class="w5">No.</th>
										<th class="w20 text-left">File Name</th>
										<th class="w20 text-left">Type</th>
										<th class="w20 text-left">Description</th>
										<th class="w15 actions">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${documents}" var="doc" varStatus="counter">
										<tr id="tr${doc.attachmentId}">
											<td class="text-center">${counter.index + 1}</td>
											<td style="word-break:break-all;">${doc.fileName}</td>
											<td class="breakWord">${doc.type}</td>
											<td>${doc.description}</td>
											 <td>
											<a class="icon download" target="_blank" href="${hostURL}${doc.diaryId.diaryId}/${doc.fileName}" title="download"/>Download</a>
											</td>
											<%--	<input type="hidden" name="attachmentId[${counter.index}]"	value="<c:out value='${doc.attachmentId}' />" />
											<a class="icon download" href="<c:url value='/download-document-${doc.attachmentId}' />"></a>
											<a class="icon download" target="_blank" href="${hostURL}${doc.attachmentId}/${doc.fileName}" title="download"/>aa</a>
											<a class="icon delete" href="javascript:deleteQuestionDoc(${doc.attachmentId});" title="delete"/></a>
											</td> --%>
										</tr>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="col-md-12 marB30">
						<h4 class="c-black">Progress Status</h4>
						<ol class="progtrckr" data-progtrckr-steps="5">
						    <li id="groupLi" class="">Group Head</li>
						    <li id="deptLi" class="">Department Head</li>
						    <li id="divisionLi" class="">Division Head</li>
						    <li id="adminLi" class="">Admin</li>
						    <li id="approvedLi" class="">Approved</li>
						</ol>
					</div>
					
                    <div class="form-submit">
						<a type="button" role="button" class="btn btn-secondary marR10" href="${path}/scientist/diary/getdiaryList">Cancel</a>
                    </div>
                    </form>
                </div>                
            </div>
        </div>
 <script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
		var diaryStatus = '${diary.getDiaryStatus()}';
		var approvalStatus='${diary.getApproverStatus()}';
		//diaryStatus='ROLE_ADMIN';
		//approvalStatus='Y';
        if(diaryStatus==='ROLE_SCIENTIST'){
        	$("#groupLi").addClass("progtrckr-process");
        	$("#deptLi").addClass("progtrckr-todo");
        	$("#divisionLi").addClass("progtrckr-todo");
        	$("#adminLi").addClass("progtrckr-todo");
        	$("#approvedLi").addClass("progtrckr-todo");
        }else if(diaryStatus==='ROLE_GROUPHEAD'){
        	if(approvalStatus=="N"){
        		$("#groupLi").addClass("progtrckr-reject");
        	} else if(approvalStatus=="Y"){
        		$("#groupLi").addClass("progtrckr-done");
        	} else{
        		$("#groupLi").addClass("progtrckr-process");
        	}
        	$("#deptLi").addClass("progtrckr-todo");
        	$("#divisionLi").addClass("progtrckr-todo");
        	$("#adminLi").addClass("progtrckr-todo");
        	$("#approvedLi").addClass("progtrckr-todo");
        } else  if(diaryStatus==='ROLE_DEPTHEAD'){
        	$("#groupLi").addClass("progtrckr-done");
        	if(approvalStatus=="N"){
        		$("#deptLi").addClass("progtrckr-reject");
        	}else if(approvalStatus==='Y'){
        		$("#deptLi").addClass("progtrckr-done");
        	}else{
        		$("#deptLi").addClass("progtrckr-process");
        	}
        	$("#divisionLi").addClass("progtrckr-todo");
        	$("#adminLi").addClass("progtrckr-todo");
        	$("#approvedLi").addClass("progtrckr-todo");
        } else if(diaryStatus==='ROLE_DIVISION_OFFICIER'){
        	$("#groupLi").addClass("progtrckr-done");
        	$("#deptLi").addClass("progtrckr-done");
        	if(approvalStatus=="N"){
        		$("#divisionLi").addClass("progtrckr-reject");
        	}else if(approvalStatus==='Y'){
        		$("#divisionLi").addClass("progtrckr-done")
        	}else{
        		$("#divisionLi").addClass("progtrckr-process")
        	}
        	$("#adminLi").addClass("progtrckr-todo");
        	$("#approvedLi").addClass("progtrckr-todo");
        } else if(diaryStatus==='ROLE_ADMIN'){
        	$("#groupLi").addClass("progtrckr-done");
        	$("#deptLi").addClass("progtrckr-done");
        	$("#divisionLi").addClass("progtrckr-done");
        	if(approvalStatus==='N'){
        		$("#adminLi").addClass("progtrckr-reject");
        	}else if(approvalStatus==='Y'){
        		$("#adminLi").addClass("progtrckr-done");
        		$("#approvedLi").addClass("progtrckr-done");
        	}else{
        		$("#adminLi").addClass("progtrckr-todo");
        		$("#approvedLi").addClass("progtrckr-todo");
        	}
        }
       
		 $('#updateMyProfileBtn').on('click',function(){
			if(!$("#picFile").hasClass("imageError")){
    			if($("#updateProfileForm").valid()){
    				document.getElementById("updateProfileForm").submit();
    			}
   			}
		}); 
	});
		
</script>