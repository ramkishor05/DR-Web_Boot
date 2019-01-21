$( window ).resize(function() {
	
  if( $( window ).width() < 769){
	  $("#orderTable_length").hide();
	  $("#footer").css("max-height", "200px");
	  $("#innerFooter").css("max-height", "200px");
	  if($('#homeLink')){
		  $('#homeLink').css("display","none");
		  $('#homeHeader').css("display","block");
		  
	  }
	  if($('.navbar-inverse')){
		  $('.navbar-inverse').css("margin-left", "4%"); 
	  }
	  if($('#socialSite')){
		  $('#socialSite').css("float","");
	  }
  }else{
	  $("#orderTable_length").show();
	  $("#footer").css("max-height", "60px");
	  $("#innerFooter").css("max-height", "60px");
	  if($('#homeLink')){
		  $('#homeLink').css("display","block");
		  $('#homeHeader').css("display","none");
	  }
	  $('.navbar-inverse').css("margin-left", "0%");
  }
});
$(window).load(function() {
	
	
	if( $( window ).width() < 769){
		 $("#orderTable_length").hide();
		$("#footer").css("max-height: 200px");
		$("#innerFooter").css("max-height", "200px");
		  if($('.navbar-inverse')){
			  $('.navbar-inverse').css("margin-left", "4%"); 
		  }
		  if($('#homeLink')){
			  $('#homeLink').css("display","none");
			  $('#homeHeader').css("display","block");
		  }
		  if($('#socialSite')){
			  $('#socialSite').css("float","");
		  }
	  }else{
		  $("#orderTable_length").show();
		  $("#footer").css("max-height", "60px");
		  $("#innerFooter").css("max-height", "60px");
		  if($('#homeLink')){
			  $('#homeLink').css("display","block");
			  $('#homeHeader').css("display","none");
		  }
		  $('.navbar-inverse').css("margin-left", "0%");
	  }
});
$(document).ready(function(){

	$.ajaxSetup({
	    error:function(jqXHR, timeout, message){
	    var contentType = jqXHR.getResponseHeader("Content-Type");
	    if (jqXHR.status === 0 || jqXHR.status === 301 || jqXHR.status === 302 || jqXHR.status === 200) {
	                hide();
	        // assume that our login has expired - reload our current page
	        
	                window.location.href="/";
	    }
	        
	    }
	});


	});
