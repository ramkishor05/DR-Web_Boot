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
<style>
.capt{
	background-color:#d9dcd5;
	width: 200px;
	height:60px;
	margin-left: 10px;
	margin-bottom: 10px;
}

#mainCaptcha{
	position: relative;
	left : 10px;
	top: 10px;
	
}

#refresh{
	position:relative;
	left:210px;
	width:30px;
	height:30px;
	bottom:45px;
	top:-30px;
}

#txtInput, #Button1{
	position: relative;
	left:40px;
	bottom: 40px;
}
</style>
</head>
<body onload="Captcha();">
<div class="mid-box">
			<div class="register-box clearfix" id="senderDiv">
				<div class="content-box">
					<div class="inner-container">
	                     <div class="block-title">
	                         <h3>File number creation</h3>
	                     </div>
	                     <div class="block-content padBlock">
	                     <div class="row marB30">
                         	<div class="form-group col-xs-6">
                                 <label for="diaryNumber" class="control-label"><span style="color:red">*</span>Please enter your 13 digit diary number</label>
                                 <input class="form-control" id="diaryNumber" name="diaryNumber" value="${diaryID.dairyNumber}" type="text">
                             </div>
                           </div>
                           <div class="row marB30">
                            	<div class="capt"> 
								   <h2 type="text" id="mainCaptcha"></h2>
								   <a href="#"> <span class="glyphicon glyphicon-refresh" id="refresh" onclick="Captcha();"></span> </a>
								    
							   </div>
                             <div class="form-group col-xs-6">
                                 <label for="captcha" class="control-label"><span style="color:red">*</span>Enter the code shown above</label>
                                 <input class="form-control" id="captcha" name="captcha" type="text">
                                 <span class="help-block" id="captchaError" style="display:none;"></span>
                             </div>
                            </div>
                            
                         	<div class="row ">
                            	<div class="full-width marT10">
				                	<button type="button" onclick="javascript:ValidCaptcha();" class="btn btn-primary marR10">Next</button>
				            	</div>
                         	</div>
                     	</div>
	    			</div>
    			</div>
			</div>
  	<form name='userFileVO' id="userFileVO" action="${path}/scientist/diary/fileData" method='POST'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="confirmModal-label">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="confirmModal-label">File Generated</h4>
						</div>
						<div class="modal-body">
							<p>Your file number is <strong><span id="fileNumber"></span></strong></p>
							<input type="hidden" name="fileId" id="fileId" value="">
							<input type="hidden" name="diaryId" id="diaryId" value="${diaryID.diaryId}">
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
<script src="${path}/assets/bootstrap/js/custom/validatorCreateDepartment.js"></script>
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
	
	$("#captcha").on("keydown",function(){
		$("#captchaError").text("").css("display","none").parent().removeClass("has-error");
	})
 });
	function createFile(){
		 $.ajax({
		     type  :   'POST',
		     url   :   '${path}/diary/generateFileNumber/'+"${diaryID.diaryId}", 
		     success  :  function(res){
		    	 $("#fileNumber").text(res.fileNumber);
		    	$("#fileId").val(res.fileId); 
		    	showConfirmModal();
		     },
		     error: function(error){
		     	console.log("BBB",error);
		     }
		}); 
	}
	
	function showConfirmModal() {
	       $('#confirmModal').modal({
	           backdrop: 'static',
	           keyboard: false
	       })
		}
	
	 function Captcha(){
	     var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		 	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
	 	    	'0','1','2','3','4','5','6','7','8','9');
	     var i;
	     for (i=0;i<6;i++){
	         var a = alpha[Math.floor(Math.random() * alpha.length)];
	         var b = alpha[Math.floor(Math.random() * alpha.length)];
	         var c = alpha[Math.floor(Math.random() * alpha.length)];
	         var d = alpha[Math.floor(Math.random() * alpha.length)];
	         var e = alpha[Math.floor(Math.random() * alpha.length)];
	         var f = alpha[Math.floor(Math.random() * alpha.length)];
	         var g = alpha[Math.floor(Math.random() * alpha.length)];
	                      }
	         var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
	         document.getElementById("mainCaptcha").innerHTML = code
			 document.getElementById("mainCaptcha").value = code
	       }
	function ValidCaptcha(){
	     var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
	     var string2 =         removeSpaces(document.getElementById('captcha').value);
	     if (string1 == string2){
	    	 	createFile();
	            return true;
	     }else{        
	    	 $("#captchaError").text("Please enter the valid captch code.").css("display","block").parent().addClass("has-error");
	          return false;
	          }
	}
	function removeSpaces(string){
	     return string.split(' ').join('');
	}
</script>
</body>
</html>
