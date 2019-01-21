<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
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
		<h2 class="heading-box">Diary Closure</h2>
        <div class="inner-container">
			<form name="diaryVO" id="recipientVO" method="POST" action="${path}/scientist/diary/closeUserDiary">
			<input type="hidden" value="${diary.diaryId}" name="diaryId">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 				<div class="row">
                	<div class="form-group col-md-4 col-xs-12">
                       <label class="control-label">Diary number</label>
                       <input type="text" name="dairyNumber" readonly value="${diary.dairyNumber}" class="form-control">
                   </div>
                </div>
                <div class="row">
                	
                    <div class="form-group col-md-6 col-xs-12">
                    	<label class="control-label">Have you received the following for this diary:</label><br>
                       <label class="control-label">
                       <input type="checkbox" name="fax" value="fax" class="" aria-describedby="fax-error"> Fax</label>
                       <span id="fax-error" class="help-block"></span>
                       <label class="control-label">
                       <input type="checkbox" name="mail" value="mail" class=""  aria-describedby="mail-error"> Mail</label>
                       <span id="mail-error" class="help-block"></span>
                   </div>
				</div>
                   
                <div class="row">
                	<div class="form-group col-md-4 col-xs-12">
                       <label class="control-label">Closure Remark</label>
                       <input type="text" name="closureComment" value="" class="form-control">
                   </div>
                </div>
                
				<div class="form-submit">
					<a type="button" role="button" id="closeDiary" class="btn btn-primary marR10">Close Diary</a>
					<a type="button" role="button" class="btn btn-secondary" href="${path}/scientist/diary/getdiaryList">Cancel</a>
                </div>
			</form>
		</div>                
	</div>
</div>
 <script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);

		 $('#closeDiary').on('click',function(){
   			if($("#recipientVO").valid()){
   				document.getElementById("recipientVO").submit();
   			}
		}); 
	});
		
</script>