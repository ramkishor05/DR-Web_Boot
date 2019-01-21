jQuery(document).ready(function () {

jQuery("#logFilter").validate(
				{
					onfocusout : function(element) {
						$(element).valid();
					},

					ignore : ":hidden:not(#agree)",

					rules : {
						filterByDate : {
							required:true
						}
					},

					messages : {
						filterByDate : {
							required : "Please select a date."
						}

					},
					

					highlight : function(element) {
						var id_attr = "#"
								+ $(element).attr("id")
								+ "1";
						$(element).closest('.form-group')
								.removeClass('has-success')
								.addClass('has-error');
						$(id_attr).removeClass(
								'glyphicon-ok').addClass(
								'glyphicon-remove');
					},
					unhighlight : function(element) {
						var id_attr = "#"
								+ $(element).attr("id")
								+ "1";
						$(element).closest('.form-group')
								.removeClass('has-error')
								.addClass('has-success');
						$(id_attr).removeClass(
								'glyphicon-remove')
								.addClass('glyphicon-ok');
					},

					invalidHandler : function(form,
							validator) {
						var errors = validator
								.numberOfInvalids();
						if (errors) {
							validator.errorList[0].element
									.focus();
						}
					},

					errorElement : "span",
					errorClass : "help-block",
					errorPlacement : function(error,
							element) {
						if (element.parent('.input-group').length > 0) {
							error
									.appendTo(element
											.parents(".form-group"));

						} else if (element.prop('type') === 'radio') {
							error.insertAfter(element
									.parents(".btn-group"));

						} else if (element.attr("name") == "cardExpMonth"
								|| element.attr("name") == "cardExpYear") {
							error
									.appendTo(element
											.parents(".form-group"));
						} else {
							error.insertAfter(element);
						}
					}
				});

				});
