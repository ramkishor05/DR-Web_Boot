<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="icon" href="${path}/assets/images/favicon.ico">
<link href="${path}/assets/css/style.css" rel="stylesheet">
<script src="${path}/assets/bootstrap/js/bootstrap.min.js"></script>
<script>

</script>
 <div class="left-nav">
	 <div class="left-chart">
	     <h2>Organisational Chart</h2>
	     <div class="inner-container">
	     <img id="chartImg" src="${path}/assets/images/inmas-chart.png" style="width: 270px;cursor:pointer;">
	     </div>
	 </div>
 </div>
<div class="modal fade" tabindex="-1" role="dialog" id="chartModal" aria-labelledby="modalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modalLabel">ORGANISATIONAL CHART</h4>
			</div>
			<div class="modal-body text-center">	
                <img src="${path}/assets/images/inmas-chart.png" style="width:800px;">
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#chartImg").on("click",function(){
		$('#chartModal').modal({
	        backdrop: 'static',
	        keyboard: false
	    });
	});
	 
})
</script>