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
<c:set var="hostURL" value="${initParam.VideoServerURL}PQ/videos"/>
<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
	})
</script>
</head>
<body>
<div class="container-fluid">
	<div class="main-wrap">
		<div class="main">
             <div class="dashboard-content">
                 <div class="row">
                     <div class="col-lg-12">
                         <div class="bg-white minHeightBlock">
                             <div class="block-title">
                                 <h3>Help</h3>
                             </div>
                             <div class="block-content padBlock">
                                 <p>After answering a question, if the answering person feels that there is any correction needed in his/her response, then he/she can send a note for that question.</p>
                                <div class="video-container marT20">
                                     <video width="700" controls>
								        <source src="${hostURL}/SendNote_flow.mp4" type="video/mp4">
								        <!-- <source src="mov_bbb.ogg" type="video/ogg"> -->
								        Your browser does not support HTML5 video.
								    </video>
                                 </div>
                             </div>
                             
                            <%--  <div class="block-content padBlock">
                                 <p>User can see the changes made to his/her response by upper level users in Answer Activity Log.</p>
                                <div class="video-container marT20">
                                     <video width="700" controls>
								        <source src="${hostURL}/answer.mp4" type="video/mp4">
								        <!-- <source src="mov_bbb.ogg" type="video/ogg"> -->
								        Your browser does not support HTML5 video.
								    </video>
                                 </div>
                             </div> --%>
                             
                              <div class="block-content padBlock">
                                 <p>Admin can create a report format and assign that to lower level users. Same as admin, Zonal Chief Commissioner and Commissioner can also assign the report to their lower levels respectively.</p>
                                <div class="video-container marT20">
                                     <video width="700" controls>
								        <source src="${hostURL}/reportVideo.mp4" type="video/mp4">
								        <!-- <source src="mov_bbb.ogg" type="video/ogg"> -->
								        Your browser does not support HTML5 video.
								    </video>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
	</div>
 </div>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorCreateZone.js"></script>

</body>
</html>

