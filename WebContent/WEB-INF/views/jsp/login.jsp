<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
    
<%-- 
<spring:url var="doctor" value="/admin/doctor"/>
<spring:url var="login" value=""/>

 --%>    
<c:if test="${sessionScope.user!=null}">
<c:redirect url="/"></c:redirect>
</c:if> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
     
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - Login</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/Navigation-Clean.css"/>">
    <link rel="shortcut icon" href="<c:url value="/assets/img/panchaved-logo.png"/>" type="image/x-icon">
    
</head>

<body class="bg-gradient-primary">
	
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10" style="height: 560px;margin: 81px;">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;assets/img/panchaved-logo.png&quot;);background-size: cover;margin-left: 10px;"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-3">
                                    <h4 class="text-dark mb-4" style="text-align:center"><strong>Panchaved Login</strong></h4>
                                   <form class="user"  method="post" id = "loginform">    
                                    <div class="table-responsive">
                              
 
    	<table class="table" style="text-align:center">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2" name="radiob" value="admin" checked><label class="form-check-label" for="formCheck-2">Admin</label></div>
                                                    </th>
                                                    <th>
                                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3" name="radiob" value="doctor" ><label class="form-check-label" for="formCheck-3">Doctor</label></div>
                                                    </th>
												</tr>
                                            </thead>
                                            <tbody>
                                                <tr></tr>
                                                <tr></tr>
                                            </tbody>
                                        </table>
                                    </div>
                                        <div class="form-group"><input class="form-control form-control-user" type="tel" id="InputUserID"  placeholder="UserID(Numeric)" name="userID" pattern="\d*"></div>
                                        <div class="form-group"><input class="form-control form-control-user" type="password" id="InputPassword" placeholder="Password" name="password" ></div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><font color="red">${fail_msg}</font></div>
                                            </div>
                                        </div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                                        <hr>
    </form>
                                    
                                    <div class="text-center"><a class="small" href="/SpringDBMS/forgotPassword">Forgot Password?</a></div>
                                    <div class="text-center"><a class="small" href="/SpringDBMS/register">Register</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="col"></div>
        </div>
        <div class="row justify-content-center">
            <div class="clearfix"></div>
            
        </div>
    </div>
    <script src="<c:url value="assets/js/jquery.min.js"/>"></script>
    <script src="<c:url value="assets/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="assets/js/chart.min.js"/>"></script>
    <script src="<c:url value="assets/js/bs-charts.js"/>"></script>
	<script src="<c:url value="assets/js/theme.js"/>"></script>
    <script src="<c:url value="assets/js/jquery.easing.js"/>"></script>
    
    <script type="text/javascript">  
    $(document).ready(function(){
    	//global vars
    	var form = $("#loginform");
    	var username= $("#InputUserID");
    	var password = $("#InputPassword");

    	//On Submitting
    	form.submit(function(){
    	    if(username.val().length==0 ){
    	                    alert('Please enter the username');
    	        return false;
    	                    }
    	    else
    	    {
    	                if(password.val().length==0)
    	                    {
    	                        alert('Please enter the password');
    	                        return false;
    	                    }

    	                 else   
    	                    return true;
    	    }
    	});
    	});
    </script>
</body>
</html>
