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
		  window.location='${path}/admin/getIPLog?page='+number;
		  }
 		 
		});
		 $( ".previous" ).click(function() {
		  console.log(Number(page),Number(pages));
		  if(Number(page)<Number(pages)){
		  var number= Number(page)-1;
		  if(number<0){
		  }else{
		  window.location='${path}/admin/getIPLog?page='+number;
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
		var data="${auditTrailList}";
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
  			
<body>
	 <div class="container-fluid">
		<div class="main-wrap">
			<div class="main">
	    <div class="dashboard-content">
	
	        <div class="row">
	            <div class="col-md-12">
	                <div class="bg-white">
	                    <div class="block-title">
	                        <h3 id="heading">IP Log List</h3>
	                    </div>
	
	                    <div id="table-content" class="block-content padBlock">
	                    <form name="byDateVO" id="logFilter" method="POST" action="${path}/admin/getIPLog">
	                    <div class="col-md-3">
							<div class="form-group">
	                           <label for="" class="control-label">Filter by date</label>
	                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                           <input type="text" class="form-control datepicker-input" name="filterByDate" value="${loginDate}" id="filterByDate" placeholder="MM/DD/YYYY">
	                       </div>
	                       <script>
	                           $('.datepicker-input').datetimepicker({
	                               format: 'L',
	                           });
	                       </script>
	                       </div>
	                       <div class="col-md-6">
	                       <button class="btn marT25 btn-default" type="button" id="filterBtn">Filter</button>
	                       <a class="btn marT25 btn-default" type="button" href="${path}/admin/getIPLog" id="resetBtn">Reset</a>
	                       </div>
	                        <div class="text-right marT25 col-md-3">
				            	<button id="download-btn" type="button" class="btn btn-default">Download <i class="far fa-file-pdf" style="font-size: 120%;margin-left:3px;"></i></button>
				            </div> 
							<div class="responsive-table">
	                        <table class="table table-border-bottom">
	                            <thead>
	                                <tr>
	                                    <th class="w5">No.</th>
	                                    <th class="w10 text-left">Name</th>
	                                    <th class="w20 text-left">Email</th>
	                                    <th class="w10 text-left">Department</th>
	                                    <th class="w10 text-left">Zone</th>
	                                    <th class="w15 text-left">IP</th>
	                                    <th class="w15 text-left">Date</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                             <c:forEach items="${auditTrailList}" var="audit" varStatus="counter">
	                                <tr>
	                                    <td class="text-center">${counter.index+1 + param["page"]*10}</td>
	                                    <td>${audit.currentlyAssigned}</td>
	                                    <td>${audit.email}</td>
	                                    <td>${audit.departmentName}</td>
	                                    <td>${audit.zone}</td>
	                                    <td>${audit.ipAddress}</td>
	                                    <td>${audit.changedOn}</td>
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
	                                <li class=""><a href="${path}/admin/getIPLog?page=${loop.index-1}">${loop.index}</a></li>
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
				</div>
				</div>
	        </div>
	    </div>
	</div>
</body>

</html>