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
});
</script>
 <div class="left-nav">
      <ul>                
         <li><a href="${path}/division/welcomeDivision">Home</a></li>
         <li><a href="${path}/division/resetPassword.html">Reset Password</a></li>
         <li><a href="${path}/division/userManagement">Profile</a></li>
         <li><a href="${path}/division/diary/getdiaryList">Diary Management</a></li>
         <li><a href="javascript:formSubmit()">Logout</a></li>
      </ul>
</div>