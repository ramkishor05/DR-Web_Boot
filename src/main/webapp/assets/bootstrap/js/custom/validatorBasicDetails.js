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
	

	jQuery("#updateBasicDetailsForm").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	prefix:{
        		required:true
        	},
        	firstName : {
				required : true,
				rangelength: [2, 50],
				lettersonly: true
			},
			lastName : {
				required : true,
				rangelength: [2, 50],
				lettersonly: true
			},
			/*birthDay:{
				reuired: true
			},*/
			designation:{
				required : true,
			},
			mobile:{
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10
			},
			EMAIL_ADDRESS:{
				required : true,
				validEmail : true,
				maxlength : 80
			},
			joiningDate:{
				required : true,
			},
			tillDate:{
				required : true,
			},
			researchArea:{
				required : true,
			},
			interestedResearchArea:{
				required : true,
			},
			qualification:{
				required : true,
			},
			researchPaper:{
				required : true,
			},
			patent:{
				required : true,
			},
			SHIPPING_ADDRESS:{
				required:true
			},
			SHIPPING_ZIP:{
				required:true,
				minlength:6,
				maxlength:6
			},
			SHIPPING_CITY:{
				required:true
			},
			PHONE_NUMBER:{
				required:true
			},
			extension:{
				required:true,
				maxlength:3
			},
			birthDay:{
				required:true
			}
        },

        messages: {
        	prefix:{
        		required:"Please select prefix."
        	},
        	firstName : {
				required : "Please enter the first name.",
				lettersonly: "Please enter letters only."
			},
			lastName : {
				required : "Please enter the last name.",
				lettersonly: "Please enter letters only."
			},
			birthDay:{
				required: "Please enter date of birth."
			},
			designation:{
				required : "Please enter your designation.",
			},
			mobile:{
				required : "Please enter your mobile number.",
			},
			EMAIL_ADDRESS:{
				required : "Please enter your email address.",
			},
			joiningDate:{
				required : "Please enter the joining date.",
			},
			tillDate:{
				required : "Please enter the till date.",
			},
			researchArea:{
				required : "Please enter your research area.",
			},
			interestedResearchArea:{
				required : "Please enter your interested research area.",
			},
			qualification:{
				required : "Please enter your highest qualification.",
			},
			researchPaper:{
				required : "Please enter your research paper.",
			},
			patent:{
				required : "Please enter your patent.",
			},
			SHIPPING_ADDRESS:{
				required:"Please enter address."
			},
			SHIPPING_ZIP:{
				required:"Please enter zip."
			},
			SHIPPING_CITY:{
				required:"Please enter city."
			},
			PHONE_NUMBER:{
				required:"Please enter phone number."
			},
			extension:{
				required:"Please enter extension."
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
