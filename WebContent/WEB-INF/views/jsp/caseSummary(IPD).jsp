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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - Case Summary</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>">
    </head>
    
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/SpringDBMS/doctor">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3" style="margin: 0px; padding: 0px; background-size: auto; background-position: left;">
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
                <div class="container-fluid">
                    <div class="card-group">
                        <div class="card">
                            <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="<c:url value="/assets/img/panchaved-logo.png"/>" width="160" height="160"></div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <p style="font-size: 19px;"><br>Dr. Neha N. Wachasundar<br><strong>B.A.M.S. (Ayurvedacharya)</strong><br>Regd. No. I-24601-A-1<br><strong>Email: </strong><a href="mailto:panchaved1990@gmail.com">panchaved1990@gmail.com</a><br><br></p>
                            </div>
                        </div>
                        <div class="card">
                            <p style="font-size: 19px;margin: 20px;"><br>Dr. Nachiket P. Wachasundar<br><strong>M.D. (Ayurvedic Medicine)</strong><br>Regd. No. I-21031-A-1<br><strong>Contact</strong>: - 9404299613 / 9422039353<br><br></p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div class="card-body text-center shadow">
                                    <form>
                                        <div class="form-group"><label for="address"><strong>&nbsp;Name</strong></label><input class="form-control" type="text" name="address"></div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="city"><strong>&nbsp;ID</strong></label><input class="form-control" type="text" name="city"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="country"><strong>&nbsp;Age</strong></label><input class="form-control" type="text" name="country"></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><label for="address"><strong>&nbsp;Address</strong></label><input class="form-control" type="text" placeholder="Line1" name="address"><input class="form-control" type="text" placeholder="Line 2" name="address"></div>
                                    </form>
                                    <form>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="city"><strong>&nbsp;BP:</strong></label><input class="form-control" type="text" name="city"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="country"><strong>&nbsp;Pulse:</strong></label><input class="form-control" type="text" name="country"></div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label for="city"><strong>&nbsp;CNS-RS:</strong></label><input class="form-control" type="text" name="city"></div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group"><label for="country"><strong>&nbsp;P/A:</strong></label><input class="form-control" type="text" name="country"></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="col">
                                        <div class="form-group"></div>
                                        <div class="form-group"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row mb-3 d-none">
                                <div class="col">
                                    <div class="card text-white bg-primary shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card text-white bg-success shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-body">
                                            <div class="col">
                                                <div class="form-group"></div>
                                                <div class="form-group"></div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="username"><strong>Date of Admission</strong></label><input class="form-control" type="text" name="username"></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group"><label for="email"><strong>Date of Discharge</strong><br></label><input class="form-control" type="email" name="email"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group"><label for="first_name"><strong>Doctor In-Charge</strong><br></label><input class="form-control" type="text"></div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <form>
                                                <div class="form-group"><label for="first_name"><strong>C/O:</strong><br></label><input class="form-control" type="text"></div>
                                                <div class="form-group"><label for="first_name"><strong>H/O:</strong><br></label><input class="form-control" type="text"></div>
                                                <div class="form-group"><label for="first_name"><strong>Physical Findings:</strong><br></label><textarea class="form-control" rows="4" name="signature"></textarea></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-5">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group"><label for="first_name"><strong>Investigations:</strong><br></label><input class="form-control" type="text"></div>
                                        <div class="form-group"><label for="signature"><strong>Panchkarma treatment given:</strong><br></label><textarea class="form-control" rows="4" name="signature"></textarea></div>
                                    </form>
                                </div>
                                <div class="col">
                                    <form>
                                        <div class="form-group"><label for="first_name"><strong>Diagnosis:</strong><br></label><input class="form-control" type="text"></div>
                                        <div class="form-group"><label for="first_name"><strong>Course in Hospital:</strong><br></label><input class="form-control" type="text"></div>
                                        <div class="form-group"><label for="first_name"><strong>Diet:</strong><br></label><input class="form-control" type="text"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-5">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <form>
                                        <div class="form-group"><label for="signature"><strong>Discharge Prescription:</strong><br></label><textarea class="form-control" rows="4" name="signature"></textarea></div>
                                    </form>
                                    <div class="form-group">
                                        <div class="col"><button class="btn btn-primary" type="button">Submit</button></div>
                                    </div>
                                </div>
                                <div class="col">
                                    <form>
                                        <div class="form-group"><label for="first_name"><strong>Result:</strong><br></label><input class="form-control" type="text"></div>
                                        <div class="form-group"><label for="first_name"><strong>Discharge Advice:</strong><br></label><input class="form-control" type="text"></div>
                                        <div class="form-group"><label for="first_name"><strong>Follow up:</strong><br></label><input class="form-control" type="text"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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