<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Forgot Password - Panchaved Clinic</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="assets/css/Navigation-Clean.css"/>">
	<link rel="stylesheet" href="<c:url value="assets/css/animate.min.css"/>">
</head>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5 mt-4">
                    <div class="card-body p-0" align="center">
                        
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-2">Forgot Your Password?</h4>
                                        <p class="mb-4">We get it, stuff happens. Just enter your userID and Security Answer below and we'll get your password!</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                        	<input class="form-control form-control-user" type="text" id="userID" placeholder="Enter UserID..." name="userID">
                                    	<button id="securityQuestion" class="btn btn-primary btn-block text-white btn-user" type="button">Get Security Question</button>
                                    	</div>
                                    	<font color="green"><label id="question"></label></font>
                                    	<input class="form-control form-control-user mt-2" type="text" id="securityAnswer" placeholder="Enter Security Answer..." name="secAnswer">
                                        <button id = "forgotPassword" class="btn btn-primary btn-block text-white btn-user" type="button">Get Password</button>
                                   		<input class="form-control form-control-user mt-2" type="text" id="getpassword" name="password" >  
                                   		
                                    </form>
                                    <div class="text-center"><a class="small" href="/SpringDBMS/">Login</a></div>          
                                </div>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="assets/js/jquery.min.js"/>"></script>
    <script src="<c:url value="assets/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="assets/js/chart.min.js"/>"></script>
    <script src="<c:url value="assets/js/bs-charts.js"/>"></script>
	<script src="<c:url value="assets/js/theme.js"/>"></script>
    <script src="<c:url value="assets/js/jquery.easing.js"/>"></script>
    <script src="<c:url value="assets/js/search.js"/>"></script>
    <script src="<c:url value="assets/js/forgotPassword.js"/>"></script>

</body>

</html>