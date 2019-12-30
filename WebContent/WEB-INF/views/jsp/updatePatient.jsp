<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - Update Paient</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark flex-shrink-0 align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/SpringDBMS/admin">
                    <div class="sidebar-brand-text mx-3" style="margin: 0px;padding: 0px;background-size: auto;background-position: left;"><span style="padding: 0px;margin-right: 0px;">Panchaved</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="/SpringDBMS/admin"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#"><i class="fas fa-user"></i><span>Update Patient</span></a></li>
                    <li class="nav-item"
                        role="presentation"><a class="nav-link" href="/SpringDBMS/admin/patient"><i class="fas fa-table"></i><span>Show patient</span></a></li>
                    <li class="nav-item" role="presentation"></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <h3 class="text-dark mb-0"> ${user} </h3>
                            <h5 class="text-dark mb-0">Status: ${success_msg} </h5>
                        </form>
                        <a href="/SpringDBMS/logout"><h4 class="text-dark mb-0" style="text-align:right">Logout</h4></a>
                    </div>
                </nav>
                <form:form action="/SpringDBMS/admin/patient/update" method="post" modelAttribute="patient">
                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Update Patient Profile</h3>
                        <div class="row mb-3">
                            <div class="col-lg-4">
                                <div class="card shadow">
                                    <div class="card-header py-3">
                                        <p class="text-primary m-0 font-weight-bold">Basic Details</p>
                                    </div>
    <!-- Basic Details -->
                                    <div class="card-body" style="margin: 0px;">
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group"><label for="patientId"><strong>Patient Id</strong><br></label><form:input value="${patient.patientId}" path = "patientId" class="form-control" type="tel" inputmode="numeric" minlength="3" required="" autofocus="" placeholder="3-6 digits" name="patientId" /></div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group"><label for="phoneNo"><strong>Mobile Number</strong><br></label><form:input value="${patient.phoneNo}" path = "phoneNo" class="form-control" type="tel" name="phoneNo" inputmode="numeric" minlength="10" maxlength="10" required="" autofocus="" placeholder="mobile num" /></div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <br><br><br><br>
                                <div class="row" style="margin: 10px;padding: -22px;height: 215px;">
                                    <div class="col offset-md-0">
                                        <div class="form-group">
                                            <div class="card shadow" style="height: 202px;margin: 0;">
    <!-- Remarks -->
                                                <div class="card-header py-3">
                                                    <p class="text-primary m-0 font-weight-bold">Remarks</p>
                                                </div>
                                                <div class="card-body text-left" style="height: 107px;"><form:textarea value="${patient.remarks}" path="remarks" class="form-control-lg" style="height: 108px;width: 270px;"></form:textarea></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col">
                                        <div class="card shadow mb-3">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">Secondary Details</p>
                                                <p class="text-primary m-0 font-weight-bold"></p>
                                            </div>
    <!-- Secondary Details                                         -->
                                            <div class="card-body">
                                              <!--  <form id="f2"> -->
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="first_name"><strong>Patient Name</strong></label><form:input value="${patient.patientName}" path = "patientName" class="form-control" type="text" placeholder="Patient Name" name="patientName" style="margin: -7px;"/></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <div class="col"><label for="dob" style="height: 0px;"><strong>Date of Birth</strong></label><form:input value="${patient.dob}" path="dob" class="form-control form-control-lg d-flex justify-content-center align-items-center align-content-center" type="date"
                                                                        name="dob" style="font-size: 16px;margin: 0px;height: 38px;" required=""/></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label for="bloodGroup">&nbsp;<strong>Blood Group</strong><form:select path="bloodGroup" class="form-control form-control form-control-sm custom-select custom-select-sm"><form:option value="${patient.bloodGroup}" selected="${patient.bloodGroup}"></form:option><form:option value="O-" selected="">O-</form:option><form:option value="O+">O+</form:option><form:option value="A-">A-</form:option><form:option value="A+">A+</form:option><form:option value="B-">B-</form:option><form:option value="B+">B+</form:option><form:option value="AB-">AB-</form:option><form:option value="AB+">AB+</form:option></form:select>&nbsp;</label></div>
                                                        </div>
                                                        <div class="col">
                                                            <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label style="margin: 2px;" for="gender"><strong>Gender</strong>&nbsp;<form:select path="gender" name = "gender" class="form-control form-control form-control-sm custom-select custom-select-sm">  <form:option value="${patient.gender}" selected=""/><form:option value="Male">Male</form:option><form:option value="Female">Female</form:option><form:option value="Other">Rather not say</form:option></form:select>&nbsp;</label></div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
    
                                        <div class="card shadow">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">Address</p>
                                            </div>
    <!-- Address -->
                                            <div class="card-body">
                                                    <div class="form-group"><label for="address"><strong>Address</strong></label><form:input value="${patient.address}" path="address" class="form-control" type="text" name="address"/></div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="district"><strong>District</strong></label><form:input value="${patient.district}" path="district" class="form-control" type="text" name="district"/></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="state"><strong>State</strong></label><form:input value="${patient.state}" path="state" class="form-control" type="text" name="state"/></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group"><button class="btn btn-primary" type="submit">Save</button></div>
                                               
                                            </div>
                                        </div>
                                    </div>
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
</body>

</html>
