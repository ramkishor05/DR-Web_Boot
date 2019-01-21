jQuery(document).ready(function () {
	
	jQuery("#departmentVO").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	divisionId:{
        		required:true
        	},
        	departmentName :
            {
              required: true,
            },
            deptDescription: {
	          required: true,
	        }
        },

        messages: {
        	divisionId: {
        		required: "Please select a division."
            },
            departmentName: {
        		required: "Please enter department name."
            },
            deptDescription: {
            	required: "Please enter department description."
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
	
	jQuery("#commissionerateVO").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	deptId : {
        		required: true,
        	},
	        zoneId: {
        		required: true,
        	},
        	commissionerateName: {
        		required: true,
        	},
        	commissionerateComment: {
        		required: true,
        	},
        },

        messages: {
        	deptId: {
        		required: "Please select department name."
            },
            zoneId: {
        		required: "Please select zone name."
            },
            commissionerateName: {
        		required: "Please enter commissionerate name."
        	},
            commissionerateComment: {
            	required: "Please enter comment."
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

	jQuery("#divisionVO").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	divisionName: {
        		required: true,
        	},
        	divisionComment: {
        		required: true,
        	},
        },

        messages: {
        	divisionName: {
        		required: "Please enter division name."
        	},
        	divisionComment: {
            	required: "Please enter division description."
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
