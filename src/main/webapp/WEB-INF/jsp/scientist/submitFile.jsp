<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="hostURL" value="${initParam.MyServerURL}drdoFiles/"/>
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
	<form name='userFileVO' id="recipientVO" action="${path}/scientist/diary/submitFile" enctype="multipart/form-data" method='POST'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="register-box clearfix" id="senderDiv">
				<div class="content-box">
					<div class="inner-container">
	                     <div class="block-title">
	                         <h3>Submit File</h3>
	                     </div>
	                     
	                     <div class="block-content padBlock">
	                     <div class="col-md-6">
	                     	<c:if test="${diary.diaryType eq 'External'}">
                     		<div class="row marB30">
	                         	<div class="form-group col-xs-12">
	                                 <label for="diaryID" class="control-label"><span style="color:red">*</span>Sender / User name</label>
	                                 <input class="form-control" id="senderName" readonly name="senderName" value="${profile.firstName} ${profile.lastName}" type="text">
                             	</div>
							</div>
							
	                       <div class="row marB30">
                             	<div class="form-group col-xs-12">
                                	<label for="captcha" class="control-label"><span style="color:red">*</span>Recipient(s) name</label>
                                	<ul>
                                	<c:forEach items="${recipientList}" var="recipient">
                                	<li>${recipient.getName()}</li>
                                	</c:forEach>
                                	</ul>
                             	</div>
							</div>
                            </c:if>
                       		<div class="row marB30">
                             	<div class="form-group col-xs-12">
                                	<label for="captcha" class="control-label"><span style="color:red">*</span>Diary Number</label>
                                 	<input class="form-control" id="diaryNumber" readonly name="diaryNumber" value="${diary.dairyNumber}" type="text">
                                 	<input class="form-control" id="diaryId" name="diaryId" value="${diary.diaryId}" type="hidden">
                             	</div>
							</div>
							
							<div class="row marB30">
                             	<div class="form-group col-xs-12">
                                	<label for="captcha" class="control-label"><span style="color:red">*</span>File number</label>
                                 	<input class="form-control" id="fileNumber" readonly name="fileNumber" value="${fileId.fileNumber}" type="text">
                                 	<input class="form-control" id="fileId" name="fileId" value="${fileId.fileId}" type="hidden">
                             	</div>
							</div>
							
							<div class="row marB30">
                             	<div class="form-group col-xs-12">
                                	<label for="captcha" class="control-label"><span style="color:red">*</span>Subject</label>
                                 	<input class="form-control" id="fileName" name="fileName" type="text" value="${fileName}">
                             	</div>
							</div>
                       		
                       		<div class="row marB30">
                             	<div class="form-group col-xs-12">
                                	<label for="captcha" class="control-label"><span style="color:red">*</span>Description</label>
                                 	<textarea class="form-control" name="fileDesc" id="fileDescription">${fileDescription}</textarea>
                                 	<input type="hidden" name="fileDescription" id="filedescHidden" value="${fileDescription}">
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
												| <a class="icon delete" href="javascript:deleteAttachment(${doc.attachmentId});" title="delete"/>Delete</a>
											</td>
										</tr>
									</c:forEach>	
								</tbody>

							</table>
						</div>
							
						</div>
	    			</div>
    			</div>
			</div>
  		</div>
    </form>
	<div class="register-box clearfix" style="margin-top:20px;" id="senderDiv">
		<form name="attachmentVO" id="attachmentVO" class="form-horizontal" action="${path}/diary/saveAttachment" method="POST" enctype="multipart/form-data" novalidate="novalidate">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="diaryId" value="${diary.diaryId}">
			<input type="hidden" name="fileId" value="${fileId.fileId}">	
			<div class="content-box">
				<div class="inner-container">
		            <div class="block-title">
		                <h3>Attach file</h3>
		            </div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">Upload a
							document</label>
						<div class="col-sm-10">
							<input type="file" name="file" id="file" class="marT10">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">Description</label>
						<div class="col-sm-5">
							<input type="text" name="description" id="description" class="form-control w100" aria-describedby="description-error"/>	
							<span id="description-error" class="help-block"></span>
						</div>
						<div class="col-sm-5">
							<button type="button" onclick="javascript:saveAttachment();" class="btn btn-default">Upload</button>
						</div>
					</div>
					<div class="row ">
               		<div class="full-width marT10" style="text-align:right;">
                		<button type="button" id="submitFile" class="btn btn-primary marR10">Submit</button>
            		</div>
               	</div>
	           	</div>
			</div>
		</form>
	</div>
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
		
		$("#fileDescription").on("keyup",function(){
			$("#filedescHidden").val($(this).val());
		});
		
		$("#submitFile").on("click",function(){
			if($("#recipientVO").valid()){
				document.getElementById("recipientVO").submit();
			}
		})
	 });
	function deleteAttachment(doc){
	     $.ajax({
	    url: '${path}/dashboard/delete/'+doc,
	    type: 'DELETE',
	    success: function(result) {
	   		//$("#tr"+doc).find(".icon.delete").tooltip('hide');
			$("#tr"+doc).remove();
			
	    }
		});
    }
	
	function saveAttachment(){
		var formObject = document.forms['attachmentVO'];
		// Create new field
		var newField = document.createElement('input');
		newField.type = 'hidden';
		newField.id = 'fileName';
		newField.name = 'fileName';
		newField.value = $("#fileName").val();
		
		var newField1 = document.createElement('input');
		newField1.type = 'hidden';
		newField1.id = 'fileDescription';
		newField1.name = 'fileDescription';
		newField1.value = $("#fileDescription").val();
		
		// Submit form
		formObject.appendChild(newField);
		formObject.appendChild(newField1);
		document.forms['attachmentVO'].appendChild(newField);
		document.forms['attachmentVO'].appendChild(newField1);
		document.forms['attachmentVO'].submit();
 }
	
</script>
</body>
</html>
