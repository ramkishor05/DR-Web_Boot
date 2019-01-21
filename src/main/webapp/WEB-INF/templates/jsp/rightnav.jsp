<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<c:set var="date" value="<%= (new java.util.Date()).toLocaleString()%>" />
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="icon" href="${path}/assets/images/favicon.ico">
<link href="${path}/assets/css/style.css" rel="stylesheet">
<script>

</script>
 <div class="right-box">
      <div class="notice-board">
          <h2>Chart</h2>
          <div class="inner-container">
              <img class="chartImg" src="${path}/assets/images/inmas-chart.png" style="width: 270px;cursor:pointer;">
          </div>
      </div>

      <div class="notice-board">
          <h2>Notice Board</h2>
          <div class="inner-container">
              <ul>
                  <li><a href="#/">List of Provisionally Shortlisted Candidates for Graduate ApprenticeshipTraining (2018-19) at GTRE, Bengaluru </a></li>
                  <li><a href="#/">Defence Science Journal, Vol. 68, No 5, September 2018 </a></li>
                  <li><a href="#/">CEPTAM-09 Advt.: Notice Board  </a></li>
                  <li><a href="#/">DESIDOC Journal of Library and Information Technology, Vol 38, No 5, September 2018 </a></li>
                  
              </ul>
          </div>
      </div>

       <div class="date-time">
           ${date}             
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
		$(".chartImg").on("click",function(){
			$('#chartModal').modal({
		        backdrop: 'static',
		        keyboard: false
		    });
		});
		 
	})
</script>