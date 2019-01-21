<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/js/jspdf.min.js"></script>
<script src="${path}/assets/js/jspdf.plugin.autotable.min.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/moment-with-locales.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/jquery.marquee.min.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorLog.js"></script>
<script>
var page = '${param["page"]}';
var pages = '${pages}'
function createForm(profileId) {
	var formObject = document.forms['profileForm'];
	// Create new field
	var newField = document.createElement('input');
	newField.type = 'hidden';
	newField.id = 'profileId';
	newField.name = 'profileId';
	newField.value = profileId;
	document.forms['profileForm'].appendChild(newField);
	document.forms['profileForm'].submit();
}
function csrfSafeMethod(method) {
      // these HTTP methods do not require CSRF protection
      return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  	}
	$(document).ready(function() {
    	var path = '${path}';
    	var a_elements = $("#table-content").find("li");
    	for (var i = 0, len = a_elements.length; i < len; i++ ) {
    	if(Number(page)===i){
    	console.log($(a_elements[ Number(page)+1 ]).addClass('active'));
    	}
   		}
    	console.log(path,page,pages);
		commonReady(path);
		
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
		  $( ".next" ).click(function() {
		  console.log(Number(page)>Number(pages));
		  if(Number(page)<Number(pages)-1){
		  var number= Number(page)+1;
		  window.location='${path}/admin/getLoginLog?page='+number;
		  }
 		 
		});
		 $( ".previous" ).click(function() {
		  console.log(Number(page),Number(pages));
		  if(Number(page)<Number(pages)){
		  var number= Number(page)-1;
		  if(number<0){
		  }else{
		  window.location='${path}/admin/getLoginLog?page='+number;
		  }
		  }
 		 
		}); 
		$("#download-btn").on('click',function(){
			var head = $("#heading").text();
			pdfFromHTML(head);
		});
		
		$('#filterBtn').on('click',function(){
			if($("#logFilter").valid()){
				document.getElementById("logFilter").submit();
			}
		});
		var data="${loginLog}";
		if(data.length<3){
			$("ul.pagination").hide();
			$(".no-results").show();
		}else {
			showHidePagination();
			$(".no-results").hide();
		}
		
    });
</script>
</head>


	<div class="mid-box">
	 <div class="register-box clearfix">
                <h2 class="heading-box">Login Summary</h2>
	                    <div id="table-content" class="block-content padBlock">
	                    <br>
	                    <form name="byDateVO" id="logFilter" method="POST" action="${path}/admin/getLoginLog">
		                    <div class="col-md-3">
							<div class="form-group">
	                           <label for="" class="control-label">Filter by date</label>
	                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                           <input type="text" class="form-control datepicker-input" name="filterByDate" value="${loginDate}" id="" placeholder="MM/DD/YYYY">
	                       </div>
	                       <script>
	                           $('.datepicker-input').datetimepicker({
	                               format: 'L',
	                           });
	                       </script>
	                       </div>
	                       <div class="col-md-6">
	                       <button class="btn btn-default" style="margin-top:25px;" type="button" id="filterBtn">Filter</button>
	                       <a class="btn btn-default" style="margin-top:25px;" type="button" href="${path}/admin/getLoginLog" id="resetBtn">Reset</a>
	                       </div>
	                        <div class="text-right col-md-3" style="margin-top:25px;" >
				            	<button id="download-btn" type="button" class="btn btn-default">Download <i class="far fa-file-pdf" style="font-size: 120%;margin-left:3px;"></i></button>
				            </div> 
							<div class="responsive-table">
	                        <table class="table table-border-bottom">
	                            <thead>
	                                <tr>
	                                    <th class="w5">No.</th>
	                                    <th class="w15 text-left">User name</th>
	                                    <th class="w15 text-left">Name</th>
	                                    <th class="w20 text-left">Email</th>
	                                    <th class="w15 text-left">Last Login</th>
	                                    <th class="w15 text-left">Logout time</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items="${loginLog}" var="audit" varStatus="counter">
	                                <tr>
	                                    <td class="text-center">${counter.index+1 + param["page"]*50}</td>
	                                    <td>${audit.username}</td>
	                                    <td>${audit.name}</td>
	                                    <td>${audit.email}</td>
	                                    <td>${audit.loginAt}</td>
	                                    <td>${audit.logoutAt}</td>
	                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                        <div class="no-results text-center" style="display: none;">No results found!</div>
							</div>
	                        <nav aria-label="Page navigation" class="pagination-nav text-center">
	                            <ul class="pagination marB0">
	                                <li class="previous">
	                                    <a href="javascript:void()" aria-label="Previous">
	                                        <span aria-hidden="true"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></span>PREV
	                                    </a>
	                                </li>
	                                <c:forEach begin="1" end="${pages}" varStatus="loop">
	                                <li class=""><a href="${path}/admin/getLoginLog?page=${loop.index-1}">${loop.index}</a></li>
	                                </c:forEach>
	                                <li class="next">
	                                    <a href="javascript:void()" aria-label="Next">
	                                       NEXT <span aria-hidden="true"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></span>
	                                    </a>
	                                </li>
	                            </ul>
	                        </nav>
	                        </form>
	                    </div>
	                </div>
	            	</div>
