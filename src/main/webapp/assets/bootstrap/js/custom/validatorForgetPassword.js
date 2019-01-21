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
	
		jQuery.validator.addMethod("validateDob", function(date, element) {
		        return this.optional(element) || date.match(/^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$/);
		    }, "Please enter a valid date format (YYYY-MM-DD)");
		 validateDob : true


	jQuery("#resetPasswordForm").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	dob :
            {
              required: true,
              validateDob : true
            },
            userName: {
                required: true,
                validEmail : true,
                maxlength : 80
              }
			
        },

        messages: {
        	dob: {
        		required: "Please enter your date of birth."
            },
            userName: {
            	required: "Please enter your username."
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
