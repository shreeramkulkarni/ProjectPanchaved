<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<spring:url var="doctor" value="/admin/doctor"/>
<spring:url var="login" value=""/>
<c:if test="${sessionScope.user==null}">

<c:redirect url="/"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
<style>
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance:textfield;
}
</style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Panchaved - Bill</title>
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
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item text-center" role="presentation"><a href="/SpringDBMS/doctor/setCost"><button type="button" class="btn btn-secondary" >Set Cost per Sitting</button></a></li>
				</ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="card-group">
                    <div class="card">
                        <div class="card-body">
                            <p style="font-size: 19px;margin: 20px;"><br><h5>Dr. Neha N. Wachasundar</h5><br><strong>B.A.M.S. (Ayurvedacharya)</strong><br>Regd. No. I-24601-A-1<br><strong>Email: </strong><a href="mailto:panchaved1990@gmail.com">panchaved1990@gmail.com</a><br><br></p>
                        </div>
                    </div>
                    <div class="card ">
                        <div class="card-body text-center"> <img class="rounded-circle mb-2 mt-3 shadow p-3 bg-white" src="<c:url value="/assets/img/panchaved-logo.png"/>" width="160" height="160"></div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                        	<p style="font-size: 19px;margin: 20px;"><br><h5>Dr. Nachiket P. Wachasundar</h5><br><strong>M.D. (Ayurvedic Medicine)</strong><br>Regd. No. I-21031-A-1<br><strong>Contact</strong>: - 9404299613 / 9422039353<br><br></p>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4" style="text-align:center">Receipt of Medical Bill</h3>
                    <div class="row">
                        <div class="col-md-6 text-nowrap">
                            <form>
                                <div class="form-group"><label>Patient Name:</label><input class="form-control" type="text" value="${pat.patientName}"></div>
                            </form>
                            <form>
                                <div class="form-group"><label>Doctor:</label><input name="doctorName" class="form-control" type="text"></div>
                            </form>
                        </div>
                        <div class="col-md-6">
                            <form>
                                <div class="form-group"><label>PID:</label><input class="form-control" id="patid" type="text" value="${pat.patientId}"></div>
                                <div class="form-group"><label>Date:</label><input class="form-control" id="date" type="text"></div>
                            </form>
                        </div>
                    </div>
                    <div class="row container-fluid ">
                        
                        <select class="form-control d-print-none" id="sel1" onchange="addNewRow()">
						 <option disabled selected value> Select a Treatment for billing </option>
						<c:forEach items="${CPSMap}" var="map" >
						<option value="${map.value}">${map.key} </option>
						</c:forEach>
					</select>
                        
                    </div>
                    <div class="card shadow my-3">
                        <div class="card-header py-3">
                            <p class="text-primary text-center m-0 font-weight-bold">BILL DETAILS</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Description</th>
                                            <th>No. of Sittings</th>
                                            <th>Amount&nbsp;</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="selected" items="${selectedTreatmentMap}">
                                    <tr class="session">
                                            <td id="tname"> ${selected.key} </td>
                                           <td><input class="tkey" value=0 type='phone' id="${selected.key}" onkeyup='calculateAmount(this.id,${selected.value})'>  	X		<span data-val="${selected.value}">${selected.value}</span></td>
                                            <td><i>&#8377;</i><span>  </span><input class="tvalue" id="amt" name="${selected.key}" type="number" value=0 disabled><br></td>
                                        	<td><button type='button' class='close' aria-label='Close' onclick="removeEntry(this)"><span aria-hidden='true'>&times;</span></button></td>
                                        </tr>
                                        </c:forEach>
                                        <tr>
                                            <td>Medicine Charges</td>
                                            <td>-----</td>
                                            <td><i>&#8377;</i><span>  </span><input name="medicineCharges" id="amt" type="number" value=0 ><br></td>
                                        </tr>
                                        <tr>
                                            <td>Service Charges</td>
                                            <td>-----</td>
                                            <td><i>&#8377;</i><span>  </span><input name="serviceCharges" id="amt" type="number" value=0><br></td>
                                        </tr>
                                        <tr>
                                            <td>Consultation Fees</td>
                                            <td>-----</td>
                                            <td><i>&#8377;</i><span>  </span><input name="consultationFees" id="amt" type="number" value=0><br></td>
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td>-----</td>
                                            <td><i>&#8377;</i><span>  </span><input name="totalBillAmount" id="Tamt" type="number" value=0 disabled><br></td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr></tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="text-center">
                 				<button disabled class="btn btn-primary d-print-none" id="print" onclick=save()> Save and Print </button>
                 				<button disabled class="btn btn-primary d-print-none" id="save" onclick=save()> Save </button>
                 			</div>
                 			
                        </div>
                        
                    </div>
                </div> 
            </div>
           	
            <footer class="d-print-none bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright Panchved &copy; Clinic 2019</span></div>
                </div>
            </footer>
        </div>
    </div>
    
    
    <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title text-primary">Important</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="retrySave" type="button" value="" class="btn"  onclick="save()" data-target="">Retry</button>
          <button type="button" class="btn" data-dismiss="modal" data-toggle='modal' data-target="" >Ok</button>
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
	<script src="<c:url value="/assets/js/billReceipt.js"/>"></script>
	
	
	
</body>

</html>