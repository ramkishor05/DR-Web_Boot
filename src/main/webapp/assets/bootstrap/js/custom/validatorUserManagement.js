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
		str = /\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,6}\b/i; //Accept all domain
		//str = /\b[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(nic|gov|Icegate.gov)\.in$\b/i; //Accept only (nic|gov|Icegate.gov).in 
		temp1 = str.test(value);
		return temp1;
	}, "Please enter a valid email address.");
	
	jQuery("#updateProfileForm").validate(
			{
				onfocusout : function(element) {
					$(element).valid();
				},
	
				rules : {
					prefix:{
						required : true,
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
						required : true,
						number : true,
						maxlength: 6,
						minlength: 6
					},
					PHONE_NUMBER : {
						required : true,
						number : true,
						minlength : 10,
						maxlength : 10
					},
					mobile:{
						required : true,
						number : true,
						minlength : 10,
						maxlength : 10
					},
					EMAIL_ADDRESS : {
						required : true,
						validEmail : true,
						maxlength : 80
					},
					username : {
						/*required : true,
						validEmail : true,
						maxlength : 80*/
					},
					departmentId : {
						required : true
					},
					zone : {
						required : true
					},
					status : {
						required : true
					},
					role : {
						required : true
					},
					password : {
						required : true,
						rangelength: [5, 20],
					},
					extension : {
						required : true,
					},
					mobile : {
						required : true,
					},
					position:{
						required : true,
					},
					role:{
						required : true,
					},
					replaceBy:{
						required : true,
					},
					expirationDate:{
						required : true,
					},
					groupId:{
						required : true,
					},
					'manpowerDetail.jrf':{
						required : true,
						min:0,
						max:10
					},
					'manpowerDetail.srf':{
						required : true,
						min:0,
						max:10
					},
					'manpowerDetail.mts':{
						required : true,
						min:0,
						max:10
					},
					'manpowerDetail.ra':{
						required : true,
						min:0,
						max:10
					},
					'manpowerDetail.projectAssinged':{
						required : true,
						min:0,
						max:10
					}
	
				},
	
				messages : {
					firstName : {
						required : "Please enter the first name.",
						lettersonly: "Please enter letters only."
					},
					lastName : {
						required : "Please enter the last name.",
						lettersonly: "Please enter letters only."
					},
					birthDay : {
						required : "Please enter the date of birth."
					},
					gender : {
						required : "Please select the gender."
					},
					username : {
						required : "Please enter the username.",
						validEmail : "Please enter a valid email in your username."
					},
					SHIPPING_ADDRESS : {
						required : "Please enter the address."
					},
					SHIPPING_CITY : {
						required : "Please enter the city."
					},
					SHIPPING_STATE : {
						required : "Please enter the state."
					},
					SHIPPING_ZIP : {
						required : "Please enter the pin code.",
						number : "Please enter a valid pin code."
					},
					PHONE_NUMBER : {
						required : "Please enter the phone number.",
						number : "Please enter a valid phone number.",
					},
					EMAIL_ADDRESS : {
						required : "Please enter the email address.",
					},
					departmentId : {
						required : "Please select a department."
					},
					zone : {
						required : "Please select a zone."
					},
					status : {
						required : "Please select the status."
					},
					role : {
						required : "Please select a role.",
					},
					password : {
						required : "Please enter the password.",
					},
					extension : {
						required : "Please enter the extension."
					},
					mobile : {
						required : "Please enter the mobile number.",
					},
					position:{
						required : "Please enter the position.",
					},
					role:{
						required : "Please select a role.",
					},
					replaceBy:{
						required : "Please enter the replaced by.",
					},
					expirationDate:{
						required : "Please enter the expiration date.",
					},
					groupId:{
						required : "Please select a group.",
					},
					'manpowerDetail.jrf':{
						required : "Please enter the jrf."
					},
					'manpowerDetail.srf':{
						required : "Please enter the srf."
					},
					'manpowerDetail.mts':{
						required : "Please enter the mts."
					},
					'manpowerDetail.ra':{
						required : "Please enter the ra."
					},
					'manpowerDetail.projectAssinged':{
						required : "Please enter the project assinged."
					}
				},
	
				highlight : function(element) {
					var id_attr = "#" + $(element).attr("id") + "1";
					$(element).closest('.form-group').addClass('has-error');
					$(id_attr).removeClass('glyphicon-ok').addClass('glyphicon-remove');
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
