jQuery(document).ready(function() {
	
	jQuery.validator.addMethod("validEmail", function(value, element) {
		if (value == '')
			return true;
		var temp1;
		temp1 = true;
		var ind = value.indexOf('@');
		var str2 = value.substr(ind + 1);
		var str3 = str2.substr(0, str2.indexOf('.'));
		if (str3.lastIndexOf('-') == (str3.length - 1)
				|| (str3.indexOf('-') != str3.lastIndexOf('-')))
			return false;
		var str1 = value.substr(0, ind);
		if ((str1.lastIndexOf('_') == (str1.length - 1))
				|| (str1.lastIndexOf('.') == (str1.length - 1))
				|| (str1.lastIndexOf('-') == (str1.length - 1))
				|| (str1.length > 64))
			return false;
		str = /\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,6}\b/i;
		temp1 = str.test(value);
		return temp1;
	}, "Please enter a valid email address.");
	
	jQuery("#updateProfileForm").validate(
			{
				onfocusout : function(element) {
					$(element).valid();
				},
	
				rules : {
					firstName : {
						required : true
					},
					lastName : {
						required : true
					},
					birthDay : {
						required : true
					},
					gender : {
						required : true
					},
					SHIPPING_ADDRESS : {
						required : true
					},
					SHIPPING_CITY : {
						required : true
					},
					SHIPPING_STATE : {
						required : true
					},
					SHIPPING_ZIP : {
						required : true
					},
					PHONE_NUMBER : {
						required : true
					},
					EMAIL_ADDRESS : {
						required : true,
						validEmail : true,
						maxlength : 80
					},
					zone : {
						required : true
					},
					status : {
						required : true
					},
					role : {
						required : true
					}
	
				},
	
				messages : {
					firstName : {
						required : "Please enter first name."
					},
					lastName : {
						required : "Please enter last name."
					},
					birthDay : {
						required : "Please enter date of birth."
					},
					gender : {
						required : "Please enter gender."
					},
					SHIPPING_ADDRESS : {
						required : "Please enter address."
					},
					SHIPPING_CITY : {
						required : "Please enter city."
					},
					SHIPPING_STATE : {
						required : "Please enter state."
					},
					SHIPPING_ZIP : {
						required : "Please enter pin code."
					},
					PHONE_NUMBER : {
						required : "Please enter phone number."
					},
					EMAIL_ADDRESS : {
						required : "Please enter email address.",
					},
					zone : {
						required : "Please select a zone."
					},
					status : {
						required : "Please select status."
					},
					role : {
						required : "Please select a role.",
					}
				},
	
				highlight : function(element) {
					var id_attr = "#" + $(element).attr("id") + "1";
					$(element).closest('.form-group').removeClass(
							'has-success').addClass('has-error');
					$(id_attr).removeClass('glyphicon-ok').addClass(
							'glyphicon-remove');
				},
				unhighlight : function(element) {
					var id_attr = "#" + $(element).attr("id") + "1";
					$(element).closest('.form-group').removeClass(
							'has-error');
					$(id_attr).removeClass('glyphicon-remove')
							.addClass('glyphicon-ok');
				},
	
				invalidHandler : function(form, validator) {
					var errors = validator.numberOfInvalids();
					if (errors) {
						validator.errorList[0].element.focus();
					}
				},
	
				errorElement : "span",
				errorClass : "help-block",
				errorPlacement : function(error, element) {
					if (element.parent('.input-group').length > 0) {
						error.appendTo(element.parents(".form-group"));
	
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
