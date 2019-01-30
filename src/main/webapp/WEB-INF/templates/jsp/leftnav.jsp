<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="icon" href="${path}/assets/images/favicon.ico">
<link href="${path}/assets/css/style.css" rel="stylesheet">
<script src="${path}/assets/bootstrap/js/bootstrap.min.js"></script>
<script>

$(document).ready(function(){
    if($('.left-nav').length > 0)
	{       					
        $(".accordion-container:eq(0)").slideDown();
        $('.accordion-wrap:eq(0)').addClass('active');	

		$('.left-nav .has-child > a').on('click', function(){
            
            if($(this).hasClass('active')){
                $(this).removeClass('active');
                $(this).parent().find('ul').slideUp();
            }else{
                $(this).addClass('active');
                $(this).parent().find('ul').slideDown();
            }         
		})
    }
    $.ajax({
	     type  :   'GET',
	     url   :   '${path}/diary/totaldiaryList', 
	     success  :  function(totaldiaryList){
	    	 if(totaldiaryList!=''){
	    		 $("#pendingDairy").html('<span class="badge">'+totaldiaryList+'</span>');
	    	 }else{
	    		 $("#pendingDairy").html("");
	    	 }
	     },
	     error: function(error){
	     	console.log(error);
	     }
	}); 
    
});
</script>
<div class="left-nav">
	<ul>                
		<li><a href="${path}/admin/welcomeAdmin">Home</a></li>
		<li class="has-child"><a href="javascript:void(0);">User Management</a>
			<ul>
				<li><a href="${path}/admin/registerUser">Register new user</a></li>
				<li><a href="${path}/admin/getUserList">User Information</a></li>
				<li><a href="${path}/admin/resetPassword.html">Reset Password</a></li>
			</ul>
		</li>
		
		<li class="has-child"><a href="javascript:void(0);">Division Management</a>
			<ul>
				<li><a href="${path}/admin/createDivision">Add New Division</a></li>
				<li><a href="${path}/admin/getDivisionList">Division List</a></li>
			</ul>
		</li>
		
		<li class="has-child"><a href="javascript:void(0);">Department Management</a>
			<ul>
				<li><a href="${path}/admin/createDepartment">Add New Department</a></li>
				<li><a href="${path}/admin/getDeptList">Department List</a></li>
			</ul>
		</li>
		
		<li class="has-child"><a href="javascript:void(0);">Group Management</a>
			<ul>
				<li><a href="${path}/admin/createGroup">Add New Group</a></li>
				<li><a href="${path}/admin/getGroupList">Group List</a></li>
			</ul>
		</li>
		
		<li class="has-child"><a href="javascript:void(0);">Diary Management<span id="pendingDairy"></span></a>
			<ul>
				<li><a href="${path}/admin/diary/getdiaryList">Diary List</a></li>
				<li><a href="${path}/admin/diary/getApprovedDiary">Approved Diary</a></li>
				<li><a href="${path}/admin/diary/getClosedDiary">Closed Diary</a></li>
			</ul>
		</li>
		<li><a href="${path}/admin/getLoginLog">Login Summary</a></li>
		<li><a href="javascript:formSubmit()">Logout</a></li>
	</ul>
</div>