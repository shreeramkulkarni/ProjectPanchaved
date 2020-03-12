<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<spring:url var="doctor" value="/admin/doctor"/>
<spring:url var="login" value=""/>
<c:if test="${sessionScope.user==null}">

<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Panchaved - Doctor</title>
<link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>"></head>

</head>

<body id="page-top">
	<div id="wrapper">
		<nav
			class="navbar navbar-dark flex-shrink-0 align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="/SpringDBMS/doctor">
					<div class="sidebar-brand-text mx-3"
						style="margin: 0px; padding: 0px; background-size: auto; background-position: left;">
						<span style="padding: 0px; margin-right: 0px;">Panchaved</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"></li>

					<li class="nav-item" role="presentation"><a class="nav-link active"
						href="/SpringDBMS/doctor"><i class="fas fa-window-maximize"></i><span>Manage
								Patient</span></a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="/SpringDBMS/doctor/update?doctorId=${user}"><i
							class="fas fa-window-maximize"></i><span>Manage Me</span></a></li>
					<li class="nav-item" role="presentation"><a class ="nav-link" href="/SpringDBMS/logout"><i class="fas fa-window-maximize"></i><span>Logout</span></a></li>
				</ul>
				<div class="text-center d-none d-md-inline">
					
				</div>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<nav
					class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<h3 class="text-dark mb-0">Welcome - ${user} </h3>
						<%-- <b> ${user} </b> --%>
					</div>
				</nav>

<div>
	<strong class="ml-3"> ${success_msg} </strong>
</div>

	<form:form action="/SpringDBMS/doctor/casetakingSummary" method="post" modelAttribute="casetake" >
				<div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><strong>CASE-TAKING</strong></h4>
                        <div class="card">
                            <div class="card-body">
                                <div class="container">
                                    <div class="card-group">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">CURRENT</h4>                                          
                                                    <div class="form-group"><label>Patient ID:</label><form:input class="form-control" type="text" id="field1" path="patientID" value="${patID}" rows="1"  cols="20" readonly="true"/></div>
                                                    <div class="form-group"><label>C/O:</label><form:textarea class="form-control" type="text" id="field2" path="co" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>H/O:</label><form:textarea class="form-control" type="text" id="field3" path="ho" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>Physical Findings:</label><form:textarea class="form-control" type="text" id="field4" path="physicalFindings" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>O/E:</label><form:textarea class="form-control" type="text" id="field5" path="oe" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>CNS-RS</label><form:textarea class="form-control" type="text" id="field6" path="cns_rs" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>P/A:</label><form:textarea class="form-control" type="text" id="field7" path="pa" rows="3"  cols="20"/></div>
                                                    <div class="form-group"><label>INVESTIGATIONS:</label><form:textarea class="form-control" type="text" id="field8" path="investigations" rows="3"  cols="20"/></div>
                                                
                                                <div class="card"></div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">HISTORY</h4><textarea id = "history" rows="25" cols="40" readonly></textarea></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container-fluid">
                                <button class="btn btn-primary mt-3" id="genReport" type="button">Generate Report</button>
                            	</div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">REPORT:</h4>
                                <textarea id="report" style="width: 891px;height: 215px;" readonly></textarea>
                            </div>
                            <div class="row">
                            	<div class="col-md-12 text-center"><button class="btn btn-primary btn-block" id="save" type="submit">Save/Proceed</button></div>
                            </div>
                            
                         </div>
                    </div>
                </div>
                </form:form>
			</div>
			<footer class="bg-white sticky-footer" >
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
	<script src="<c:url value="/assets/js/jquery.easing.js"/>"></script>
	<script src="<c:url value="/assets/js/search.js"/>"></script>
	<script src="<c:url value="/assets/js/caseTaking.js"/>"></script>

</body>

</html>