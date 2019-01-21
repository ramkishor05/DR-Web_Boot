jQuery(document).ready(function () {
	
	jQuery("#groupVO, #updateGroupForm").validate({

		onfocusout: function(element) {
	          $(element).valid();
	        },

        rules: {
        	groupStatus : {
        		required: true,
        	},
        	groupName :
            {
              required: true,
            },
            comment: {
	          required: true,
	        },
            divisionId:{
            	required:true
            },
            departmentId:{
            	required:true
            },
            description:{
            	required:true
            }
        },

        messages: {
        	groupStatus: {
        		required: "Please select group status."
            },
            groupName: {
        		required: "Please enter group name."
            },
            comment: {
            	required: "Please enter comment."
            },
            divisionId:{
            	required:"Please select a division."
            },
            departmentId:{
            	required:"Please select a department."
            },
            description:{
            	required:"Please enter group description."
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
        	departmentId : {
        		required: true,
        	},
        	zone: {
        		required: true,
        	},
        	commissionerateId: {
        		required: true,
        	},
        	divisionName: {
        		required: true,
        	},
        	divisionComment: {
        		required: true,
        	},
        },

        messages: {
        	departmentId: {
        		required: "Please select department name."
            },
            zone: {
        		required: "Please select zone name."
            },
            commissionerateId: {
        		required: "Please select commissionerate name."
        	},
        	divisionName: {
        		required: "Please enter division name."
        	},
        	divisionComment: {
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
	

});
