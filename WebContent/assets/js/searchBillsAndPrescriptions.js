$(function() {

});

var patientData;
function dateSort(a,b){
	return new Date(b.prescriptionDate).getTime() - new Date(a.prescriptionDate).getTime();
}
function getBillsAndPrescritions(){ 
	$.ajax({
		url:"/SpringDBMS/admin/getBillsAndPrescritions",
		data:"patientId="+$("#patientId").val(),
		success : function(jsonResponse){
			localStorage.setItem("localJsonResponse",JSON.stringify(jsonResponse));
			$('tr').remove();
			patientData = jsonResponse;
			
			populateJsonResponse(jsonResponse);
			//console.log("---------------------\n"+JSON.stringify(jsonResponse["prescriptions"].sort(dateSort)));
		}
	});
}

function populateJsonResponse(jsonResponse) {
	var bills = jsonResponse["bills"];
	var prescriptions = jsonResponse["prescriptions"];
	console.log(jsonResponse);
	var p = 0;
	prescriptions.forEach(function(data){
		p++;
	var prescriptionData = "<th scope='row'>"+ p +"</th>" +
			"<td><span onclick='getBillOrPrescription(this)' data-id='"+data.prescriptionId+"'>"+data.prescriptionDate+"</span></td>"
			$('#prescription').append("<tr >"+prescriptionData+"</tr>");		
					
	}); 
	var b = 0;
	bills.forEach(function(data){
		b++;
	var billData = "<th scope='row'>"+ b +"</th>" +
			"<td><span onclick='getBillOrPrescription(this)' data-id='"+data.billId+"'>"+data.dateOfBill+"</span></td>"
			$('#bill').append("<tr >"+billData+"</tr>");		
					
	}); 
}

function getBillOrPrescription(span){
	let choice = $(span).parent().parent().parent().attr('id');
	localStorage.setItem("localJsonResponse",JSON.stringify(patientData));
	
	localStorage.setItem("printId" ,$(span).attr("data-id"));
	window.open("/SpringDBMS/admin/get/"+choice+"?patientId="+patientData["patient"].patientId);

}
