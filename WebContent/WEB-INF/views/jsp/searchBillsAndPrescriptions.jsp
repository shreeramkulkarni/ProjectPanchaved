<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:url var="login" value="" />
<c:if test="${sessionScope.user==null}">

	<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
<style type="text/css">
span:hover{
color:blue;
cursor:pointer;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Panchaved - Search</title>
<link rel="stylesheet"
	href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/Navigation-Clean.css"/>">
</head>



<body>
	<div id="wrapper">
		<nav
			class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="/SpringDBMS/admin">
					<div class="sidebar-brand-icon rotate-n-15"></div>
					<div class="sidebar-brand-text mx-3"
						style="margin: 0px; padding: 0px; background-size: auto; background-position: left;">
						<span style="padding: 0px; margin-right: 0px;">Panchaved</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"></li>
				</ul>
				<div class="text-center d-none d-md-inline"></div>
			</div>
		</nav>
		
		
			<div class="d-flex flex-column" id="content-wrapper">
		<h2 class="text-center">Search Bills / Prescriptions</h2>
		<div class="container text-center">
		        <input class="form-control" type="text" id="patientId" inputmode="numeric" required="" autofocus="" placeholder="Patient ID"/>
		        <button class = "btn btn-primary mt-3 mb-3" onclick="getBillsAndPrescritions()">Search</button>
		</div>
		
				<div class="container text-center">
					<div class="row">
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">#</th>
										
										<th scope="col">Prescription</th>
									</tr>
								</thead>
								<tbody id="prescription">
									<tr>
									
									</tr>

								</tbody>
							</table>
						</div>
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Bills</th>
										
									</tr>
								</thead>
								<tbody id="bill">
									<tr>
										
									</tr>

								</tbody>
							</table>

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
 	<script src="<c:url value="/assets/js/searchBillsAndPrescriptions.js"/>"></script>
</body>

</html>
