<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:url var="doctor" value="/admin/doctor" />
<spring:url var="login" value="" />
<c:if test="${sessionScope.user==null}">

	<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Panchaved - Case Summary</title>
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

</head>

<body>
	<div id="wrapper">
		<nav
			class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="/SpringDBMS/doctor">
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
					<p class="text-primary font-weight-bold">Prescription Panel</p>
				</div>
				<div class="card-body">
				<form:form id = "basic" action="/SpringDBMS/doctor/bill" method="post" modelAttribute="pat">
						<div class="card mt-4">
							<div class="card-header">
								<p class="text-primary font-weight-bold">Basic Details</p>
							</div>
							
					
					<div class="card-body">
						
							<div class="row mt-4">
								<div class="col-md-4 pr-5">
									<div class="form-group">
										<label for="patientId"><strong>Patient Id</strong><br></label><form:input
											id="patID" path="patientId" class="form-control" type="tel"
											inputmode="numeric" minlength="1" required="" autofocus="" value=" ${pat.patientId}"
											placeholder="" name="patientId" readonly="true" />
									</div>
									<div class="form-group">
										<label for="phoneNo"><strong>Mobile Number</strong><br></label><form:input
											path="phoneNo" class="form-control" type="tel" name="phoneNo"
											inputmode="numeric" minlength="10" maxlength="10" required="" value=" ${pat.phoneNo}"
											autofocus="" placeholder="Mobile" readonly="true" />
									</div>
								</div>
								<div class="col-md-8 pl-5">
									<div class="row">
										<div class="col-md-6 pr-5">
											<div class="form-group">
												<label for="first_name"><strong>Patient
														Name</strong></label><form:input required="" autofocus="" path="patientName"
													class="form-control" type="text" placeholder="Patient Name" value="${pat.patientName}"
													name="patientName" readonly="true"/>
											</div>
										</div>
										<div class="col-md-2 pl-4">
											<div id="dataTable_length" class="dataTables_length"
												aria-controls="dataTable">
												<label style="margin-bottom: 8px;" for="gender"><strong>Gender</strong></label><form:select
													required="" autofocus="" path="gender" name="gender"
													class="form-control form-control form-control-sm custom-select custom-select-sm" disabled="true"><form:option
														value="Male" selected="${pat.gender}">Male</form:option>
													<form:option value="Female">Female</form:option>
													<form:option value="Other">Rather not say</form:option></form:select>&nbsp;
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 pr-5">
											<label for="dob" style="margin-bottom: 8px;"><strong>Date
													of Birth</strong></label><form:input required="" autofocus="" path="dob"
												class="form-control form-control-lg d-flex justify-content-center align-items-center align-content-center"
												type="date" name="dob" value="${pat.dob}"
												style="font-size: 16px; margin: 0px; height: 38px;"
												 readonly="true"/>
										</div>
										<div class="col-md-2 pl-4">
											<div id="dataTable_length" class="dataTables_length"
												aria-controls="dataTable">
												<label style="margin-bottom: 8px;" for="bloodGroup"><strong>Blood
														Group</strong></label><form:select required="" autofocus="" path="bloodGroup"
													name="bloodgroup"
													class="form-control form-control form-control-sm custom-select custom-select-sm" disabled="true"><form:option
														value="null" selected="${pat.bloodGroup}">Select</form:option>
													<form:option value="O-" selected="">O-</form:option>
													<form:option value="O+">O+</form:option>
													<form:option value="A-">A-</form:option>
													<form:option value="A+">A+</form:option>
													<form:option value="B-">B-</form:option>
													<form:option value="B+">B+</form:option>
													<form:option value="AB-">AB-</form:option>
													<form:option value="AB+">AB+</form:option></form:select>&nbsp;
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row pl-3">
								<p class="font-weight-bold">Remarks</p>
								<div class="text-left ml-3 mt-4" style="height: 107px;">
									<form:textarea required="" autofocus="" name="remarks"
										path="remarks" class="form-control-lg"
										style="height: 108px; width: 220px;" readonly="readonly" value="${pat.remarks}"></form:textarea>
								</div>
							</div>
					</div>
				
						</div>
						
						<div class="card mt-3 ">
							<div class="card-header">
								Prescription History
							</div>
							<div class="card-body">
									<textarea name="prescHistory" id="history"
										class="form-control-lg block"
										style="height: 208px; width: 720px;" readonly="readonly"></textarea>
							</div>
						</div>
						
						
						<div class="card mt-4">
				<div class="card-header">
					<p class="text-primary font-weight-bold">Diagnosis Details</p>
				</div>
				<div class="card-body">
					<form:form action="/SpringDBMS/doctor/bill" modelAttribute="diagnosis" method="post">
					<div class="row">
						<div class="col">
							<p class="font-weight-bold">Prescription / Internal Medicines<span style="color:red;">*</span></p>
							<div class="text-left" style="height: 107px;">
								<form:textarea required="" autofocus="" name="prescription"
									path="prescription" class="form-control-lg"
									style="height: 108px; width: 310px;" />
							</div>
						</div>
						<div class="col">
							<p class="font-weight-bold">Panchakarma Treatments<span style="color:red;">*</span></p>
							<div id="dataTable_length" class="dataTables_length"
								aria-controls="dataTable">
								<label for="treatment">&nbsp;<form:select required=""
									autofocus="" path="panchTreatments" name="panchTreatments"
									class="form-control form-control form-control-sm custom-select custom-select-sm">
									<form:option value="null" selected="">Select</form:option>
										<form:option value="RC" selected="">Relaxation Course(3-21 days)</form:option>
										<form:option value="SCC">Sinus Care Course (7-14days)</form:option>
										<form:option value="SpCC">Spine Care Course (7-14 days)</form:option>
										<form:option value="JCC">Joint Care Course (5-21 days)</form:option>
										<form:option value="SC">Slimming Course (14-45 days)</form:option>
										<form:option value="PWC">Panchved Wellness Course (3-5
											days)</form:option></form:select>&nbsp;
								</label>
							</div>
						</div>
					</div>

					<div class="row mt-3">
						<div class="col">
							<p class="m-0 font-weight-bold">Diet and Exercise<span style="color:red;">*</span></p>
							<div class="text-left mt-3" style="height: 107px;">
								<form:textarea required="" autofocus="" name="dietnexercise" path="dietnexercise"
									class="form-control-lg" style="height: 108px; width: 310px;" ></form:textarea>
							</div>
						</div>
						<div class="col">
							<p class="m-0 font-weight-bold">Miscellaneous</p>
							<div class="text-left mt-3" style="height: 107px;">
								<form:textarea required="" autofocus="" name="miscellaneous" path="miscellaneous"
									class="form-control-lg" style="height: 108px; width: 310px;" ></form:textarea>
							</div>
						</div>
					</div>
					
				</form:form>
				</div>
				</div>
				<div class="text-center"><button id="submitDiag" class="btn btn-primary mt-4" type = "submit"> Save </button></div>
		</form:form>
				
				</div>
			</div>
			</div>
			<footer class="bg-white sticky-footer">
				<div class="container my-auto">
					<div class="text-center my-auto copyright">
						<span>Copyright Panchved &copy; Clinic 2019</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/js/chart.min.js"/>"></script>
	<script src="<c:url value="/assets/js/bs-charts.js"/>"></script>
	<script src="<c:url value="/assets/js/theme.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.easing.js"/>"></script>
	<script src="<c:url value="/assets/js/search.js"/>"></script>
 	<script type="text/javascript">
 	$(function(){
 		var id= $('#patID').val();
 			$('#submitDiag').click(function(){
 				$('#basic').submit();
 				});
			$.ajax({
				url : "/SpringDBMS/doctor/casetakingSummary",
				type:"get",
				data : "patId="+id, 
				success : function(data) {
					if(data.length === 0){
						$('#history').append("No History available!!\n");
						return;
					}
						
					for (var i = 0; i < data.length; i++) {
						$('#history').append("Prescription: "+data[i].prescription+"\n");
						$('#history').append("Panchakarma Treatments: "+data[i].panchTreatments+"\n");
						$('#history').append("Diet and Exercise: "+data[i].dietnexercise+"\n");
						$('#history').append("Miscellaneous: "+data[i].miscellaneous+"\n");
					
						$('#history').append("\t===================================\n");
					}
					
			
				}

				});	
		});

	</script> 
</body>

</html>