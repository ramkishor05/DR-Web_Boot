jQuery(document).ready(function () {
	
	jQuery.validator.addMethod("validEmail", function(value, element) 
    		{
    		    if(value == '') 
    		        return true;
    		    var temp1;
    		    temp1 = true;
    		    var ind = value.indexOf('@');
    		    var str2=value.substr(ind+1);
    		    var str3=str2.substr(0,str2.indexOf('.'));
    		    if(str3.lastIndexOf('-')==(str3.length-1)||(str3.indexOf('-')!=str3.lastIndexOf('-')))
    		        return false;
    		    var str1=value.substr(0,ind);
    		    if((str1.lastIndexOf('_')==(str1.length-1))||(str1.lastIndexOf('.')==(str1.length-1))||(str1.lastIndexOf('-')==(str1.length-1)) || (str1.length > 64))
    		        return false;
    		    str =/\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,6}\b/i;
    		    temp1 = str.test(value);
    		    return temp1;
    		}, "Please enter a valid email address.");
	

	jQuery("#recipientVO").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	senderName :
            {
              required: true,
            },
        	  userName: {
                required: true
	          },
	          email: {
	            required: true,
	            validEmail: true
	          },
	          designation: {
	            required: true
	          },
	          departmentName: {
	            required: true
	          },
	          mobile: {
	            required: true,
	            number:true,
				minlength : 10,
				maxlength : 10
	          },
	          phone: {
	            required: true,
	            number:true,
				minlength : 10,
				maxlength : 10
	          },
	          extension: {
	            required: true,
	            number:true,
				maxlength : 3
	          },
	          faxNo: {
	            required: true,
	            number:true,
				minlength : 10,
				maxlength : 10
	          },
	          address: {
	            required: true
	          },
	          
	          recipientName: {
	            required: true
	          },
	          recipientDesignation: {
	            required: true
	          },
	          recipientDepartment: {
	            required: true
	          },
	          recipientAddress: {
	            required: true
	          },
	          recipientEmail: {
	            required: true,
	            validEmail: true
	          },
	          officeNumber: {
	            required: true,
	            number:true,
				//minlength : 10,
				maxlength : 10
	          },
	          recipientExt: {
	            required: true,
	            number:true,
				maxlength : 3
	          },
	          fileName:{
	        	  required: true
	          },
	          fileDesc:{
	        	  required: true
	          },
	          approverComment:{
	        	  required: true
	          },
	          approverStatus:{
	        	  required: true
	          },
	          fax:{
	        	  required:true
	          },
	          mail:{
	        	  required:true
	          },
	          closureComment:{
	        	  required:true
	          }
        },

        messages: {
        	senderName :
            {
              required: "Please enter sender's name.",
            },
        	  userName: {
        		  required: "Please enter sender's username.",
	          },
	          email: {
	        	  required: "Please enter sender's email.",
	          },
	          designation: {
	        	  required: "Please enter sender's designation.",
	          },
	          departmentName: {
	        	  required: "Please enter sender's department name.",
	          },
	          mobile: {
	        	  required: "Please enter sender's mobile number.",
	          },
	          phone: {
	        	  required: "Please enter sender's phone number.",
	          },
	          extension: {
	        	  required: "Please enter extension.",
	          },
	          faxNo: {
	        	  required: "Please enter sender's fax number.",
	          },
	          address: {
	        	  required: "Please enter sender's address.",
	          },
	          
	          recipientName: {
	        	  required: "Please enter recipient's name.",
	          },
	          recipientDesignation: {
	        	  required: "Please enter recipient's designation.",
	          },
	          recipientDepartment: {
	        	  required: "Please enter recipient's department.",
	          },
	          recipientAddress: {
	        	  required: "Please enter recipient's address.",
	          },
	          recipientEmail: {
	        	  required: "Please enter recipient's email.",
	          },
	          officeNumber: {
	        	  required: "Please enter recipient's office number.",
	          },
	          recipientExt: {
	        	  required: "Please enter recipient's extension.",
	          },
	          fileName:{
	        	  required: "Please enter file subject."
	          },
	          fileDesc:{
	        	  required: "Please enter file description."
	          },
	          approverComment:{
	        	  required: "Please enter some remark."
	          },
	          approverStatus:{
	        	  required: "Please select one option."
	          },
	          fax:{
	        	  required:"Please confirm if you have received the fax."
	          },
	          mail:{
	        	  required:"Please confirm if you have received the mail"
	          },
	          closureComment:{
	        	  required:"Please enter closure comment."
	          }
        },

        highlight: function (element) {
            var id_attr = "#" + $(element).attr("id") + "1";
            $(element).closest('.form-group').addClass('has-error');
            $(id_attr).removeClass('glyphicon-ok').addClass('glyphicon-remove');
        },
        unhighlight: function (element) {
            var id_attr = "#" + $(element).attr("id") + "1";
            $(element).closest('.form-group').removeClass('has-error');
            $(id_attr).removeClass('glyphicon-remove').addClass('glyphicon-ok');
        },

        invalidHandler: function (form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
                validator.errorList[0].element.focus();
            }
        },

        errorElement: "span",
        errorClass: "help-block",
        errorPlacement: function (error, element) {
            if (element.parent('.input-group').length > 0) {
                error.appendTo(element.parents(".form-group"));

            }  
            else {
                error.insertAfter(element);
            }
        }
    });


});
