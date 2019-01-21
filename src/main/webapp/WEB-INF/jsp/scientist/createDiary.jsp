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
		<div class="register-box clearfix" id="createDeptDiv">
			<div class="content-box">
				<div class="inner-container">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <div class="block-title">
                         <h3>Create Dairy</h3>
                     </div>
                    
                     <div class="block-content padBlock">
                         <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="departmentName" class="control-label"><span style="color:red">*</span>Owner / User name</label>
                                 <input class="form-control" id="userName" readonly name="userName" type="text" value="${profile.userName}">
                             </div>
                           </div>
                           <div class="row marB30">
                             <div class="form-group col-xs-6">
                                 <label for="deptHead" class="control-label"><span style="color:red">*</span>Date of birth</label>
                                 <input class="form-control" id="dateOfBirth" readonly name="dateOfBirth" type="text" value="${profile.dateOfBirth}">
                             </div>
                            </div>
                           	<div class="row marB30">
                            	<div class="form-group col-md-4">
	                            	<label class="control-label display-block"  style="display:block;"for=""><span style="color:red">*</span>Dairy type</label>
	                             	<label class="radio-inline">
						         		<input type="radio" name="dairyType" value="External" aria-describedby="dairyType-error"> External </label>
						         	<label class="radio-inline">
						         		<input type="radio" name="dairyType" value="Internal" aria-describedby="dairyType-error"> Internal </label>
						         	<span id="dairyTypeError" class="help-block" style="display:none;"></span>
	                         	</div>
                         	</div>
                         	<div class="row ">
                            	<div class="full-width marT10">
				                	<button type="submit" class="btn btn-primary marR10" onclick="javascript:createDiaryID();">Next</button>
				                	<button type="button" class="btn btn-secondary" onclick="location.href='${path}/deptHead/welcomeDeptHead'">Cancel</button>
				            	</div>
                         	</div>
                     	</div>
	    			</div>
    			</div>
			</div>
		<form name='diaryVO' id="diaryVO" action="${path}/scientist/diary/addDiaryUserDetails" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="confirmModal-label">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="confirmModal-label">Diary ID Created</h4>
						</div>
						<div class="modal-body">
							<p>Your diary number is <strong><span id="diaryId"></span></strong></p>
							<input type="hidden" name="diaryId" id="diaryIdHidden" value="">
							<input type="hidden" name="diaryNumber" id="diaryNumberHidden" value="">
						</div>
						<div class="modal-footer">
				            <button type="submit" class="btn btn-default">Close</button>
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
		
		$("input[name='dairyType']").on("click",function(){
			$("#dairyTypeError").text("").parent().removeClass("has-error");
		});
	 });
	 
	function createDiaryID(){
		if($("input[name='dairyType']:checked").val() != undefined){
			$("#dairyTypeError").text("").parent().removeClass("has-error");
			var diaryType = $("input[name='dairyType']:checked").val();
			 $.ajax({
			     type  :   'POST',
			     url   :   '${path}/diary/generateDiaryId/'+diaryType, 
			     success  :  function(res){
			    	$("#diaryId").text(res.dairyNumber);
			    	$("#diaryNumberHidden").val(res.dairyNumber)
			    	$("#diaryIdHidden").val(res.diaryId);
			    	showConfirmModal();
			     },
			     error: function(error){
			     	console.log("BBB",error);
			     }
			});
		}else{
			$("#dairyTypeError").text("Please select a diary type").css("display","block").parent().addClass("has-error");
		}
	}
	
	function showConfirmModal() {
	       $('#confirmModal').modal({
	           backdrop: 'static',
	           keyboard: false
	       })
		}
</script>
</body>
</html>
