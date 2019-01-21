<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<section class="container" style="max-width: 1170px; border: 0; outline: 0; font-size: 100%;vertical-align: center;background: white; margin-bottom: 20px;">
          <fieldset>
            <legend>Order ID: OD1232423</legend>
            <div class="row">
              <div class="col-md-3">
                <div class="form-group has-feedback">
                  <label class="control-label" for="firstName">First Name</label>
                  <input type="text" name="firstName" id="firstName" class="form-control" required="required" value="" aria-required="true"><span class="glyphicon form-control-feedback" id="firstName1"></span>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group has-feedback">
                  <label class="control-label">Last Name</label>
                  <input type="text" name="lastName" id="lastName" class="form-control" required="" maxlength="30" value="" aria-required="true"><span class="glyphicon form-control-feedback" id="lastName1"></span>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group has-feedback">
                  <label for="birthDay" class="control-label">Date of Birth</label>
                   <input type="text" name="birthDay" id="birthDay" class="form-control" value="" placeholder="MM/DD/YYYY">
	                 <span class="glyphicon form-control-feedback" id="birthDay1"></span>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group has-feedback">
                  <label for="birthDay" class="control-label">Order Type</label>
                  
                  
	               
	               <div>
				    <input type="radio" name="gender" checked=""  value="MALE"> Male 
	              	<input type="radio" name="gender" value="FEMALE" > Female
	              	</div>
				  
				  
	               
                </div>
              </div>
            </div>
          </fieldset>
        
          <fieldset class="addressInitial">
            <legend> Client Information</legend>
            <div class="row">
              <div class="col-md-8">
               <div class="col-md-5">
                <div class="form-group has-feedback">
                  <label class="control-label" for="SHIPPING_ADDRESS">Company Name</label>
                  <input type="text" name="SHIPPING_ADDRESS" required="" id="SHIPPING_ADDRESS" value="" class="form-control" aria-required="true">
                  <span class="glyphicon form-control-feedback" id="SHIPPING_ADDRESS1"></span>
                </div>
                </div>
              <div class="col-md-7">
                <div class="form-group has-feedback">
                  <label class="control-label" for="SHIPPING_ADDRESS">Address</label>
                  <input type="text" name="SHIPPING_ADDRESS" required="" id="SHIPPING_ADDRESS" value="" class="form-control" aria-required="true">
                  <span class="glyphicon form-control-feedback" id="SHIPPING_ADDRESS1"></span>
                </div>
                </div>
                <div class="row">
                  <div class="col-md-5">
                    <div class="form-group has-feedback">
                      <label class="control-label" for="SHIPPING_CITY">City</label>
                      <input type="text" id="SHIPPING_CITY" required="" name="SHIPPING_CITY" value="Elkhorn" class="form-control" aria-required="true">
                      <span class="glyphicon form-control-feedback" id="SHIPPING_CITY1"></span>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label class="control-label" for="SHIPPING_STATE">State</label>
                      <select id="SHIPPING_STATE" name="SHIPPING_STATE" required="" class="form-control" aria-required="true">
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Puducherry">Puducherry</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group has-feedback">
                      <label class="control-label" for="SHIPPING_ZIP">Pin Code</label>
                      <input type="text" id="SHIPPING_ZIP" size="5" name="SHIPPING_ZIP" required="" value="" class="form-control" aria-required="true">
                      <span class="glyphicon form-control-feedback" id="SHIPPING_ZIP1"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="well well-sm">
                  <div class="form-group has-feedback">
                    <label class="control-label" for="PHONE_NUMBER">Contact Person Name</label>
                    <input type="text" id="PHONE_NUMBER" name="PHONE_NUMBER" value="" class="form-control"><span class="glyphicon form-control-feedback" id="PHONE_NUMBER1"></span>
                  </div>
                  <div class="form-group has-feedback">
                    <label class="control-label" for="EMAIL_ADDRESS">Contact Person Number</label>
                    <input type="email" id="EMAIL_ADDRESS" name="EMAIL_ADDRESS" value="" class="form-control"><span class="glyphicon form-control-feedback" id="EMAIL_ADDRESS1"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-horizontal">
              <div class="form-group">
                <label class="control-label col-sm-8">Show all additional comments or instructions?</label>
                <div class="col-sm-4">
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-default" id="additionalComments">
                    <input type="radio" id="yesComments" name="comments" value="I have additional comments" autocomplete="off"> Yes </label>
                    <label class="btn btn-default" id="noAdditionalComments">
                    <input type="radio" required="" id="noComments" name="comments" value="No additional comments" autocomplete="off" aria-required="true"> No </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-10 col-md-offset-2">
                <div class="form-group hidden" id="comments">
                  <label class="explain">Show all comments and remarks.</label>
                  <textarea class="form-control" name="commentsDetails" id="commentsDetails" rows="2"></textarea>
                  <span class="help-block text-warning" id="commentsDetailsCount"></span>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 table-responsive" >
            <iframe src = "https://maps.google.com/maps?q=10.305385,77.923029&hl=es;z=14&amp;output=embed" height="300" width="100%"></iframe>
            </div>
            </div>
            <button id="terms" type="button" class="navbar-btn btn btn-gradient-blue" style="float:right;   data-toggle="button" aria-pressed="false" autocomplete="off"><i class="glyphicon"></i> Pass Bill</button>
            <button id="terms" type="button" class="navbar-btn btn btn-gradient-blue" style="float:right;  margin-left: 5px;" data-toggle="button" aria-pressed="false" autocomplete="off"><i class="glyphicon"></i> Reject Bill</button>
          </fieldset>
        </section>
          </section>