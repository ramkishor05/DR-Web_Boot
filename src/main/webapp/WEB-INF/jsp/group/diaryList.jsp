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
	 <div class="register-box clearfix" style="margin-top:50px;">
	                    <div class="block-title">
	                         <h2 class="heading-box">Diary List</h2>
	                    </div>
	                    <div id="table-content" class="block-content padBlock">
							<div class="responsive-table">
	                        <table class="table table-border-bottom">
	                            <thead>
	                                <tr>
	                                    <th class="w5">S.No.</th>
	                                    <th class="w15 text-left">Diary No</th>
	                                    <th class="w10 text-left">Diary Type</th>
	                                    <th class="w10 text-left">File No</th>
	                                    <th class="w10 text-left">Subject</th>
	                                    <th class="w10 text-left">Sender Name</th>
	                                    <th class="w10 text-left actions noPdf">Actions</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:choose>
		                            	<c:when test="${assign.size() ne 0}">
			                            	<c:forEach items="${assign}" var="assignList" varStatus="counter">
				                                <tr>
				                                    <td>${counter.index+1 + param["page"]*10}</td>
				                                    <td>${assignList.diaryNo}</td>
				                                    <td>${assignList.diaryType}</td>
				                                    <td>${assignList.fileNumber}</td>
				                                     <td>${assignList.fileSubject}</td>
				                                     <td>${assignList.senderName}</td>
				                                    <td>
				                                    	<a class="icon edit" href="${path}/group/diary/viewDiaryDetails/${assignList.diaryId}/${assignList.assignmentId}">View Details</a>
				                                    </td>
				                                </tr>
			                            	</c:forEach>
	                            		</c:when>
		                            	<c:otherwise>
		                            		<script>
			                                	$(document).ready(function(){
			                                		$('.no-results').show();
			                                	})
		                                	</script>
		                            	</c:otherwise>
	                            	</c:choose>
								</tbody>
	                        </table>
	                        <div class="no-results text-center" style="display: none;">No results found!</div>
							</div>
	                    </div>
	
	                </div>
	            </div>
<!-- Confirm  Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="confirmModal">Diary Submit Confirmation</h4>
                </div>
                <div class="modal-body">
                	Your diary is successfully submited.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
   <!-- Confirm  Modal -->

 <script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script src="${path}/assets/bootstrap/js/custom/validatorCreateGroup.js"></script>
<script>
	$(document).ready(function(){
		var path = '${path}';
		commonReady(path);
		
		if("${fileSuccess}"==="success"){
			showConfirmModal();
		}
	})

	function showConfirmModal() {
       $('#confirmModal').modal({
           backdrop: 'static',
           keyboard: false
       })
	}
	
	 
</script>
</body>
</html>

