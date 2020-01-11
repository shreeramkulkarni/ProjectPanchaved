<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Map,java.util.Set" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:url var="doctor" value="/admin/doctor"/>
<spring:url var="login" value=""/>
<c:if test="${sessionScope.user==null}">

<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - CPS</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/SpringDBMS/doctor">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>Panchaved</span></div>
                </a>
                <hr class="sidebar-divider my-0">
               <!--  <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a href="/SpringDBMS/doctor/bill"><button type = "button" class="btn btn-secondary" >Bill </button></a></li>
                </ul> -->
               <ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"></li>

					<li class="nav-item" role="presentation"><a class="nav-link "
						href="/SpringDBMS/doctor"><i class="fas fa-procedures"></i><span>Manage
								Patient</span></a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="/SpringDBMS/doctor/update?doctorId=${user}"><i class="far fa-user-circle"></i><span>Manage Me</span></a></li>
					<li class="nav-item" role="presentation"><a class ="nav-link active" href="/SpringDBMS/doctor/setCost"><i class="fas fa-wrench"></i><span>Set Cost per Sitting</span></a></li>
					<li class="nav-item" role="presentation"><a class ="nav-link" href="/SpringDBMS/logout"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
						
					
					<li class="nav-item" role="presentation"></li>
				</ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <h3 class="text-dark my-4" style="text-align:center">Cost Per Sitting</h3>
                    <br> <p style="color:red">${cpsStatus}</p>
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                               <form  action="/SpringDBMS/doctor/setCost" method="POST"  >
                               <table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Description <a href="#"><span id="addCps" style="color:blue" class="fa fa-plus" aria-hidden="true"></span></a></th>
                                            <th>Cost</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
										</tbody>
                                    <tfoot>
                                        <tr></tr>
                                    </tfoot>
                                </table>
                                
                                </form>
                                <div class="text-right"><button type="button" class="btn btn-primary my-2" id="saveChanges" onclick="save()" > Save changes</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright Panchved &copy; Clinic 2019</span></div>
                </div>
            </footer>
        </div>
    </div>
    <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/js/chart.min.js"/>"></script>
	<script src="<c:url value="/assets/js/bs-charts.js"/>"></script>
	<script src="<c:url value="/assets/js/theme.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.easing.js"/>">	</script>
	<script src="<c:url value="/assets/js/costPerSitting.js"/>"></script>
	
</body>

</html>