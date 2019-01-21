<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="hostURL" value="${initParam.MyServerURL}drdoFiles/"/>
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorDiary.js"></script>
	<div class="mid-box">
            <div class="register-box clearfix">
                <h2 class="heading-box">Diary Details</h2>
                <div class="inner-container">
               <form name="assignmentVO" id="recipientVO" method="POST" action="${path}/group/diary/submitFile">
	 			<div class="col-md-6">
	 				<div class="row">
                        <div class="form-group col-xs-12">
                            <label class="control-label">Diary number</label>
                            <input type="text" name="dairyNumber" readonly value="${diary.dairyNumber}" class="form-control">
                        </div>
                     </div>
                     <div class="row">
                        <div class="form-group col-xs-12">
                            <label for="EMAIL_ADDRESS" class="control-label">File number</label>
                            <input class="form-control" id="fileNumber" name="fileNumber" value="${file.fileNumber}" readonly type="text">
                        </div>
                     </div>
                     <div class="row">
                         <div class="form-group col-xs-12">
                            <label class="control-label">Sender name</label>
                            <input type="text" name="senderName" readonly value="${diary.senderName}" class="form-control">
                        </div>
                      </div>
                     <div class="row">
                        <div class="form-group col-xs-12">
                            <label for="fileName" class="control-label">Subject</label>
                            <input class="form-control" id="fileName" value="${file.fileName}" readonly name="fileName" type="text">
                        </div>
                      </div>
                     <div class="row">
                       <div class="form-group col-xs-12">
                            <label class="control-label">Description</label>
                            <textarea class="form-control" readonly id="fileDescription">${file.fileDescription}</textarea>
                        </div>
                    </div>
                    
                    <c:if test="${diary.diaryType eq 'external'}">
	                    <div class="row marB30">
	                       	<div class="form-group col-xs-12">
	                          	<label for="captcha" class="control-label"><span style="color:red">*</span>Recipient(s)</label>
	                          	<ul>
		                          	<c:forEach items="${recipientList}" var="recipient">
		                          		<li>${recipient.getName()}</li>
		                          	</c:forEach>
	                          	</ul>
	                       	</div>
						</div>
					</c:if>
					
                    <div class="row">
	                    <div class="form-group col-xs-12">
	                    	<label class="control-label display-block" style="display:block;"for=""><span style="color:red">*</span> Approval Status</label>
	                        <label class="radio-inline">
			         			<input type="radio" name="approverStatus" value="Y" aria-describedby="approvalStatus-error"> Approved </label>
			         		<label class="radio-inline">
			         			<input type="radio" name="approverStatus" value="N" aria-describedby="approvalStatus-error"> Not Approved </label>
			         		<span id="approvalStatus-error" class="help-block" style="display:none;"></span>
	                    </div>
                    </div>
                    
                    <div class="row">
                       <div class="form-group col-xs-12">
                            <label class="control-label"><span style="color:red">*</span> Remarks</label>
                            <input class="form-control" id="approverComment" value="" name="approverComment" type="text">
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
									<%-- <td>
									<input type="hidden" name="attachmentId[${counter.index}]"	value="<c:out value='${doc.attachmentId}' />" />
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
                    
			<div class="form-submit">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="diaryId"	value="${diary.diaryId}" />
				<input type="hidden" name="assignmentId" value="${assignmentId}" />
				<button type="submit" class="btn btn-primary marR10">Submit</button>
				<a type="button" role="button" class="btn btn-secondary" href="${path}/group/diary/getdiaryList">Cancel</a>
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