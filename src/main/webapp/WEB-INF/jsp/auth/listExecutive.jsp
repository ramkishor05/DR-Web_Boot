<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="stylesheet" href="${path}/assets/datatable/css/jquery.dataTables.css">
<link rel="stylesheet" href="${path}/assets/datatable/css/jquery.dataTables_themeroller.css">
<script src="${path}/assets/jquery/jquery.min.js"></script>
<script src="${path}/assets/bootstrap/js/jquery.validate.min.js"></script>
<script src="${path}/assets/bootstrap/js/additional-methods.js"></script>
<script type="text/javascript" src="${path}/assets/datatable/js/jquery.dataTables.js"></script>
<<script type="text/javascript">

$( document ).ready(function() {
	$("#orderTable").dataTable({
        "sPaginationType": "full_numbers",
        "bJQueryUI": false,
        "bSort" : false
    });
	
	$("#historyButton").click(function() {
		if(!$('#calFrom').valid()){
			 $("#calFrom").css('border-color', 'red');
		}
		if(!$('#calTo').valid()){
			$("#calTo").css('border-color', 'red');
		}
		if($('#calFrom').valid() && $('#calTo').valid()){
			document.getElementById("historyForm").submit();
		}
	});
	
});
</script>
<section class="container" style="max-width: 1170px; border: 0; outline: 0; font-size: 100%;vertical-align: center;background: white; margin-bottom: 20px;">
<div class="container" style="top-margin:10px">
      <div class="row" style="top-margin:10px">
        <div class="col-sm-3">
          <section class="boxP15 marT20">
          <form action="${path}/searchorderbydate.html" id="historyForm" method="post" modelAttribute="orderRequest">
            <div class="form-group">
              <label for="calFrom" class="control-label">Search From</label>
              <input type="text" value="${fromDate}" required="required" aria-required="true"  placeholder="MM/DD/YYYY" name=fromDate class="form-control inline" id="calFrom">
              <span class="glyphicon form-control-feedback" id="calFrom1"></span>
            </div>
            <div class="form-group">
              <label for="calTo" class="control-label">To</label>
              <input type="text" value="${toDate}" required="required" aria-required="true" placeholder="MM/DD/YYYY" name="toDate" class="form-control inline" id="calTo">
              <span class="glyphicon form-control-feedback" id="calTo1"></span>
            </div>
            <div class="btnBar padB10" style="float: right;">
              <a type="button" class="navbar-btn btn btn-gradient-blue" am-latosans="bold" href="">Submit</a>
            </div>
            </form>
          </section>
        </div>
        <div class="col-sm-9 table-responsive">
          <section class="boxP15 marT20">
            <fieldset>
              <legend class="noBor">Sales Executive List</legend>
              <table id="orderTable" class="table table-condensed table-bordered table-striped f14 thFill table-striped">
                <thead>
                  <tr>
                    <th><a href="#" style="color: #5782a2;">Executive ID</a></th>
                    <th><a href="#" style="color: #5782a2;">Name</a></th>
                    <th><a href="#" style="color: #5782a2;">Phone No</a></th>
                    <th><a href="#" style="color: #5782a2;">Email ID</a></th>
                    <th><a href="#" style="color: #5782a2;">Number of Pending Order</a></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="executive" items="${executives}">
                  <tr>
                    <td><a style="color: #5782a2;" title="${executive.id}" href="javascript:searchExecutive('${executive.id}');">EMP${executive.id} </a></td>
                    <td>${executive.firstName} ${executive.lastName}</td>
                    <td>${executive.PHONE_NUMBER}</td>
                    <td>${executive.EMAIL_ADDRESS}</td>
                    <td>100</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </fieldset>
          </section>
        </div>
      </div>
    </div>
    </section>
    <form name="empNumberForm" method="POST" action="terminateExecutive">
  	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
  </form>
  
  <script>
  
  function searchExecutive(id){
		console.log('ABHA');
		var formObject = document.forms['empNumberForm'];
		var i = 0;

		// Create new field
		var newField = document.createElement('input');
		newField.type = 'hidden';
		newField.id='idNumber';
		newField.name = 'id';
		newField.value = id;
		// Submit form
		formObject.appendChild(newField);
		document.forms['empNumberForm'].appendChild(newField);
		document.forms['empNumberForm'].submit();

		}
  </script>