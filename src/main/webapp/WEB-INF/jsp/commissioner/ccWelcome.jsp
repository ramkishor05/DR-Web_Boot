<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link href="${path}/assets/material-charts/css/material-charts.css"
	type="text/css" rel="stylesheet" media="screen">
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/jquery/jquery.plugin.min.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>
<script>
 function csrfSafeMethod(method) {
      // these HTTP methods do not require CSRF protection
      return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
  	}
		
	$(document).ready(function() {
		var path = '${path}';
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
	});
</script>

<div class="container-fluid">
	<div class="main-wrap">
		<div class="main">
			<div class="dashboard-content">
				<div class="row marB25 equalHeightParent">
					<%-- <div class="col-md-2 equalHeightChild">
						<div class="bg-white questions-counter-block text-center">
							<h2 class="">Total Pending Questions</h2>
							<div class="counter-yellow">
								<figure>
									<img src="${path}/assets/images/ques-bg.png" alt="">
									<span class="count"></span>
								</figure>
							</div>
						</div>
					</div> --%>
					<div class="col-md-6 equalHeightChild">
						<div class="bg-white">
							<div class="block-title">
								<h3>Pending Questions by Zone</h3>
							</div>
							<div class="block-content">
								<table class="table text-center pending-questions-table">
									<thead>
										<tr>
											<th>Sr. No.</th>
											<th>Zone Name</th>
											<th>Count</th>
										</tr>
									</thead>
									<tbody id="pendingByZone-tbody">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-6 alerts-table equalHeightChild">
					<div class="bg-white">
							<div class="block-title">
								<h3>Alerts</h3>
							</div>
							<div class="marL15"><h6>SLA is less than 12 hours</h6></div>
							<div class="block-content">
							<div class="scroll" style="max-height:70px;">
								<table class="table ">
									<tbody id="alert-tbody">
										
									</tbody>
								</table>
								</div>
							</div>
							<!-- ******************* -->
							<div class="marL15"><h6>Recent answers received</h6></div>
							<div class="block-content">
							<div class="scroll" style="max-height:70px;">
								<table class="table ">
									<tbody id="alertAnswer-tbody">
										
									</tbody>
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row marB25">
					<div class="col-md-6 alerts-table">
						<div class="bg-white ">
							<div class="block-title">
								<h3>
									Recent Questions <span class="badge" id="recentQuesCount"></span>
								</h3>
								<span class="plus-minus  show-content"></span>
							</div>
							<div class="block-content" style="display: none;">

								<table class="table ">
									<tbody id="recentQues-tbody"></tbody>
								</table>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
