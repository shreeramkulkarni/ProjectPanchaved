<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:if test="${sessionScope.user==null}">

<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - Patient Information</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/googlefont.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table-1.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/MUSA_panel-table.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/Navigation-Clean.css"/>">
	<link rel="shortcut icon" href="<c:url value="/assets/img/panchaved-logo.png"/>" type="image/x-icon">
	
	
	<script src="<c:url value="/assets/js/jquery-3.4.1.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/assets/js/chart.min.js"/>"></script>
    <script src="<c:url value="/assets/js/bs-charts.js"/>"></script>
	<script src="<c:url value="/assets/js/theme.js"/>"></script>
    <script src="<c:url value="/assets/js/jquery.easing.js"/>"></script>
    <script src="<c:url value="/assets/js/search.js"/>"></script>
	<script src="<c:url value="/assets/js/patientAjax.js"/>"></script>
	
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
                    <li class="nav-item" role="presentation"><a class="nav-link " href="/SpringDBMS/admin"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="/SpringDBMS/admin/patient/new"><i class="fas fa-user"></i><span>New Patient</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="/SpringDBMS/admin/patient"><i class="fas fa-table"></i><span>Show patient</span></a></li>
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
                        
                            <h3 class="text-dark mb-0">${user}</h3>
                        	<a href="/SpringDBMS/logout"><h4 class="text-dark mb-0" style="text-align:right">Logout</h4></a>
                        
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <h3><p class="text-primary m-0 font-weight-bold">Patient Information</p></h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 text-nowrap">
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search Name" autocomplete="on" id="searchbar" onkeyup="searchFunction()"></label>
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                        	<th>Id</th>
                                            <th>Name</th>
                                            <th>Gender</th>
                                            <th>blood Group</th>
                                            <th>Phone Number</th>
                                            <th>D.O.B.</th>
                                            <th>address</th>
                                            <th>District</th>
                                            <th>State</th>
                                            <th>delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
			
				
                                    </tbody>
                                   
                                </table>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing page 1</p>
                                </div>
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">

										<nav aria-label="...">
											<ul class="pagination">
												<li class="page-item" ><button id="previous" class="page-link"
												tabindex="-1" onclick="getPPage()">Previous</button></li>
												<br>
												<li class="page-item" ><button id="next" class="page-link" onclick="getNPage()" >Next</button>
												</li>
											</ul>
										</nav>
									</nav>
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
        </div></div>
        
        <!-- MODAL -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title text-danger">WARNING</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Patient <span id="patient" class="text-primary"></span> about to be DELETED! Proceed?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="yes" type="button" value="" class="btn" data-dismiss="modal" onclick="removeEntry()">Yes</button>
          <button type="button" class="btn" data-dismiss="modal" data-toggle='modal' data-target="" >No</button>
        </div>
        
      </div>
    </div>
  </div>
<!--  Modal2-->  
<div class="modal" id="finalMsg">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title text-success">Success</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Patient <span id="patient" class="text-primary"></span> DELETED!
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="yes" type="button" value="" class="btn" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>

</html>