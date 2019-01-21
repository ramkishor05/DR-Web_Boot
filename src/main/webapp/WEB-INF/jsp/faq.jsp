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
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/material-charts/js/material-charts.js"></script>
<script src="${path}/assets/bootstrap/js/common.js"></script>
<script src="${path}/assets/js/commonAjax.js"></script>

<script>
$(document).ready(function() {
		var path = '${path}';
		commonReady(path);
	});
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
                               <h3>FAQs</h3>
                           </div>
                           <div class="block-content padBlock">
                             <ul class="accordion">
                                 <li class="accord-item">
                                   <div class="accord-head open">
                                       <h3>What is the purpose of Send  Note? </h3>
                                   </div>
                                   <div class="accord-content" style="display:block ;">
                                       <p>Purpose of Send Note is to ensure any correction/modification for answer given by current user to higher level user.</p>
                                       <p>For example, a Division officer has submitted an answer for any particular question, after submitting his answer, he cannot modify it.</p>
                                       <p>So, if he wants to send a kind of note for any modification or correction to the user where that question has currently assigned then he can send a note for that particular question by going to "send note" section from left navigation.</p>
                                   </div>
                                 </li>

                                 <li class="accord-item">
                                     <div class="accord-head">
                                         <h3>How to check whether my answer has been modified?</h3>
                                     </div>
                                     <div class="accord-content" style="display:none ;">
                                         <p>To modify an answer, user can send a Note (from Send Note section) for a particular answer of a question to the user to whom that question is currently assigned to.</p>
                                         <p>Once the user read out the note then he has two options, first simply close the window after reading the notes and don't do anything with answer provided. Second he can send acknowledgement to the user who has given the answer or sent a note.</p>
                                         <p>A user can ensure that his Note has been read out by going to Send Note section and if note is removed from there means note has been read out else if it is available there means it has not been read out yet.
                                         </p>
                                     </div>
                                 </li>
                                 <li class="accord-item">
                                     <div class="accord-head">
                                         <h3>How to assign a question to once peer?</h3>
                                     </div>
                                     <div class="accord-content" style="display:none ;">
                                         <p>You can assign a question by going to "View question assignment -> Pending assignment" section.</p>
                                     	<p>Simply choose your peer from dropdown there and assign it by clicking on "Assign" button.</p>
                                     </div>
                                 </li>
                                 <li class="accord-item">
                                     <div class="accord-head">
                                         <h3>How to publish a answer without doing any changes to existing answer?</h3>
                                     </div>
                                     <div class="accord-content" style="display:none;">
                                         <p>Go to "View & Edit Answer -> Pending Answer", you can see list of questions whose answers are pending with you.</p>
                                         <p>Simply click on "Publish Answer" button for a particular row, you will land on the screen where question and answer are given. Simply click on "Publish Answer without Change" button to publish this question.
                                         </p>
                                     </div>
                                 </li>
                             </ul>
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

