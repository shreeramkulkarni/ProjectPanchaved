$(function(){
	window.onbeforeunload = function() {
		console.log("bye");
		  localStorage.removeItem("localJsonResponse");
		  localStorage.removeItem("printId");
		  return '';
		};
		$("#print").click(function(){
			window.print();
		});
		
		var localJson = JSON.parse(localStorage.getItem("localJsonResponse"));
		var myPrescription;
		
		console.log("printId"+localStorage.getItem("printId"));
		localJson["prescriptions"].forEach(function(prescription){
			if(prescription.prescriptionId ==localStorage.getItem("printId")){
				myPrescription = prescription;
				return;
			}
		});
//		console.log(myPrescription );
		$("#prescriptionDate").val(myPrescription.prescriptionDate );
		$("#printTreatment").val(myPrescription.treatment );
		$("#miscellaneous").val(myPrescription.miscellaneous);
		$("#dietnexercise").val(myPrescription.dietnexercise );
		$("#prescription").val(myPrescription.prescription );
	
});