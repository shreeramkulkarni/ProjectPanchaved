<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url var="doctor" value="/admin/doctor"/>
<spring:url var="login" value=""/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Panchaved - Register</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>">
</head>

<body class="bg-gradient-primary">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-xl-6 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class=" card card-body">
            <h4 class="card-title text-center">Register</h4>
            <div class="card">
            <div class="card-body">
            <form:form class="form-signin" method="post" modelAttribute="log">
              <div class="form-label-group">
                <label for="inputUserame"><strong>ID/Mobile Number</strong></label>
                <form:input type="number" path="userID" id="inputID" name="id" class="form-control" placeholder="Mobile Number" value="" required="true"/>
              </div>
				<div id = "someid">
              <div class="form-label-group">
              <label for="securityQ	uestion"><strong>Security Question</strong></label>
                <form:select class=" form-control" name="securityQ" path="securityQuestion">
						<form:option value="What City Were You Born In">What City Were You Born In</form:option>
						<form:option value="What Is Your Favorite Colour">What Is Your Favorite Colour </form:option>
						<form:option value="What Is Your Father's Middle Name">What Is Your Father's Middle Name</form:option>
				</form:select>
              </div>
              
			 <div class="form-label-group">
                <label for="securityAnswer"><strong>Security Answer</strong></label>
                <form:input path = "securityAnswer" type="text" id="secA" class="form-control" placeholder="Security Answer" required="required" />
              </div>

              <div class="form-label-group">
                <label for="inputPassword"><strong>Password</strong></label>
                <form:input path = "password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" />
              </div>
              
              <div class="form-label-group">
                <label for="inputConfirmPassword"><strong>Confirm password</strong></label>
                <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password" required="required" >
              	<span id='message'></span>
              </div>
              
              <div class="form-label-group">
              <label for="handlerType" ><strong>Handler Type</strong></label>
                <form:select class=" form-control" name="handler" path="handlerType">
						<form:option value="Admin">Admin</form:option>
						<form:option value="Doctor">Doctor</form:option>
				</form:select>
              </div>
			</div>
			  <div id="registered" class="text-center"></div>
			  <button class="btn btn-lg btn-primary btn-block my-3" type="button" id="checkDoc">Check Status</button>			
              <button class="btn btn-lg btn-primary btn-block text-uppercase my-3" type="submit" id="reg" >Register</button>
              <a class="d-block text-center mt-2 small" href="/SpringDBMS">Sign In</a>
              <hr class="my-4">
            </form:form>
            
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
  <script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/assets/js/chart.min.js"/>"></script>
  <script src="<c:url value="/assets/js/bs-charts.js"/>"></script>
  <script src="<c:url value="/assets/js/theme.js"/>"></script>
  <script src="<c:url value="/assets/js/jquery.easing.js"/>"></script>
	<script type="text/javascript">
	$(function(){
		$("#reg").prop("disabled",true);
		$('#inputPassword, #inputConfirmPassword').on('keyup', function () {
			  if ($('#inputPassword').val() === $('#inputConfirmPassword').val()) 
			  {  
			    	$('#message').html('Matching').css('color', 'green');
			    	$("#reg").prop("disabled",false);
			  } else {
				  $('#message').html('Not Matching').css('color', 'red');
				    $("#reg").prop("disabled",true);
			  }
				  
			});
		
		
		$("#someid").hide();
		$("#checkDoc").click(function(){
			$.ajax({
				url : "/SpringDBMS/regchk",
				data : "id="+$("#inputID").val(),
				success : function(data) {
					if(data === 'null')
						{
							$("#someid").show();
							$('#reg').prop('disabled',false);
							$('#checkDoc').prop('disabled',true);
						}
					else
						$('#registered').text(data);
				}
			});
			
			
		});
	});
	
	</script>
</body>
</html>