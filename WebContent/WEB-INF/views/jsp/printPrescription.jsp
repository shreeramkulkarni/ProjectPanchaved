<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Print</title>
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
<link rel="stylesheet"
	href="<c:url value="/assets/css/select2.min.css"/>">

<link rel="shortcut icon" href="<c:url value="/assets/img/panchaved-logo.png"/>" type="image/x-icon">
</head>

</head>

<body>
${CPS} 
	
	<div id="wrapper">
		
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<div class="card-group">
					<div class="card">
						<div class="card-body">
							<p style="font-size: 19px;">
								<br>Dr. Neha N. Wachasundar<br>
								<strong>B.A.M.S. (Ayurvedacharya)</strong><br>Regd. No.
								I-24601-A-1<br>
								<strong>Email: </strong><a href="mailto:panchaved1990@gmail.com">panchaved1990@gmail.com</a><br>
								<br>
							</p>
						</div>
					</div>

					<div class="card ">
						<div class="card-body text-center">
							<img class="rounded-circle mb-2 mt-3 shadow p-3 bg-white"
								src="<c:url value="/assets/img/panchaved-logo.png"/>"
								width="160" height="160">
						</div>
					</div>

					<div class="card">
						<p style="font-size: 19px; margin: 20px;">
							<br>Dr. Nachiket P. Wachasundar<br>
							<strong>M.D. (Ayurvedic Medicine)</strong><br>Regd. No.
							I-21031-A-1<br>
							<strong>Contact</strong>: - 9404299613 / 9422039353<br>
							<br>
						</p>
					</div>
				</div>
			</div>
			<div class="container-fluid">
			<div class="card mt-3">
				<div class="card-header">
					<p class="text-primary font-weight-bold">Prescription Panel <span class ="font-weight-bold" style="float:right;"><input class="form-control border-0 text-center" type="text" id="prescriptionDate" readonly></span></p>
				</div>
				<div class="card-body">
				<form:form id = "basic" action="/SpringDBMS/doctor/bill" method="POST" modelAttribute="pat">
							<div class="card mt-4">
								<div class="card-header">
									<p class="text-primary font-weight-bold">Basic Details</p>
								</div>


								<div class="card-body">

									<div class="row mt-4">
										<div class="col-md-4 pr-5">
											<div class="form-group">
												<label for="patientId"><strong>Patient Id</strong><br></label>
												<form:input id="patID" path="patientId" class="form-control"
													type="tel" inputmode="numeric" minlength="1" required=""
													autofocus="" value=" ${pat.patientId}" placeholder=""
													name="patientId" readonly="true" />
											</div>
											<div class="form-group">
												<label for="phoneNo"><strong>Mobile Number</strong><br></label>
												<form:input path="phoneNo" class="form-control" type="tel"
													name="phoneNo" inputmode="numeric" minlength="10"
													maxlength="10" required="" value=" ${pat.phoneNo}"
													autofocus="" placeholder="Mobile" readonly="true" />
											</div>
										</div>
										<div class="col-md-4 pr-5">
											<div class="form-group">
												<label><strong>Patient Name</strong><br></label>
												<form:input path="patientName" class="form-control"
													type="text" value=" ${pat.patientName}" name="patientId"
													readonly="true" />
											</div>
											<div class="form-group">
												<label><strong>Date Of Birth</strong><br></label>
												<form:input path="dob" class="form-control" type="date"
													name="dob" value="${pat.dob}" readonly="true" />
											</div>
										</div>

										<div class="col-md-4 pr-5">
											<div class="form-group">
												<label><strong>Gender</strong><br></label>
												<form:input id="patID" path="gender" class="form-control"
													type="text" value=" ${pat.gender}" placeholder=""
													readonly="true" />
											</div>
											<div class="form-group">
												<label><strong>Blood Group</strong><br></label>
												<form:input path="bloodGroup" class="form-control"
													type="text" name="bloodGroup" value=" ${pat.bloodGroup}"
													readonly="true" />
											</div>
										</div>


									</div>
								</div>

							</div>




							<div class="card mt-4">
				<div class="card-header">
					<p class="text-primary font-weight-bold">Prescription Details</p>
				</div>
				<div class="card-body">
					<form >
					<div class="row">
						<div class="col">
							<p class="font-weight-bold">Prescription / Internal Medicines<span style="color:red;">*</span></p>
							<div class="text-left" style="height: 230px;">
								<textarea required="" autofocus="" name="prescription" id="prescription"
									 class="form-control-lg border-0" style="height: 220px; width: 390px;" readonly ></textarea>
							</div>
						</div>
						<div class="col">
							<p class="font-weight-bold">Panchakarma Treatments<span style="color:red;">*</span></p>
							<div class=" text-left mt-3" style="height: 230px;">
								<textarea required="" autofocus=""  name="treatment" id="printTreatment"
									class="form-control-lg border-0" style="height: 220px; width: 390px;" readonly></textarea>
							</div>
							
							
						</div>
					</div>

					<div class="row mt-3">
						<div class="col">
							<p class="m-0 font-weight-bold">Diet and Exercise<span style="color:red;">*</span></p>
							<div class="text-left mt-3" style="height: 230px;">
								<textarea required="" autofocus="" name="dietnexercise" id="dietnexercise"
									class="form-control-lg border-0" style="height: 220px; width: 390px;" readonly></textarea>
							</div>
						</div>
						<div class="col">
							<p class="m-0 font-weight-bold">Miscellaneous</p>
							<div class="text-left mt-3" style="height: 230px;">
								<textarea required="" autofocus=""  name="miscellaneous" id="miscellaneous"
									class="form-control-lg border-0" style="height: 220px; width: 390px;" readonly></textarea>
							</div>
						</div>
					</div>
					
				</form>
				</div>
				</div>
				<div class="text-center"><button id="print" class="d-print-none btn btn-primary mt-4""> Print</button></div>
		</form:form>
				
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
	<script src="<c:url value="/assets/js/search.js"/>"></script>
	<script src="<c:url value="/assets/js/printPrescription.js"/>"></script>
	
 	
</body>

</html>