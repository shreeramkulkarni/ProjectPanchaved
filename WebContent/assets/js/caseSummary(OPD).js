function displayHistory(history){
	var textHistory="";
	history.forEach(function(obj){
		textHistory+="DATE : "+ obj.prescriptionDate+"\n" +
				"Prescribed Medicine : "+obj.prescription +"\n" +
						"Diet And Excercise : "+obj.dietnexercise+"\n" +
								"Miscellaneous : "+ obj.miscellaneous+"\n" +
										"Treatment : "+obj.treatment+"\n" +
												"----------------------------------------------------------------------------------";
	});
	$("#history").text(textHistory);
}
$(function(){
var selectedTreatements = {};
$.ajax({
	type:"get",
	url:"/SpringDBMS/doctor/getPrescriptionHistory?patientId="+$('#patID').val(),
	success : function(history) {
		$("#history").css('color','green');
		if(history.length!=0)
		displayHistory(history);
		else
			$("#history").text("No History Found!");
		//$("#history").text(JSON.stringify(history));
	},
	error : function (jqXHR,exception) {
		 var msg = '';
	        if (jqXHR.status === 0) {
	            msg = 'Not connect.\n Verify Network.';
	        } else if (jqXHR.status == 404) {
	            msg = 'Requested not found. [404]';
	        } else if (jqXHR.status == 500) {
	            msg = 'Internal Server Error [500].';
	        } else if (exception === 'parsererror') {
	            msg = 'Requested JSON parse failed.';
	        } else if (exception === 'timeout') {
	            msg = 'Time out error.';
	        } else {
	            msg = 'Uncaught Error.\n' + jqXHR.responseText;
	        }
	        $("#history").css('color','red');
	        $("#history").text(msg);
	}
});


$("button").click(function(){
	
	var prescription = $("#prescription").val();
	var dietnexercise = $("#dietnexercise").val();
	var miscellaneous = $("#miscellaneous").val();
	var treatment = $("#treatment").text();
	var prescription = {"prescription" : prescription,"dietnexercise":dietnexercise,"miscellaneous":miscellaneous,"treatment":treatment}; 
	console.log("prescription:"+JSON.stringify(prescription));
	$("#cpsmap option:selected").each(function(){
		console.log(this.innerHTML+"\n");
	selectedTreatements[this.innerHTML]=$(this).val();
		});
	var json = JSON.stringify(selectedTreatements);
		$.ajax({
			type:"post",
			url:"/SpringDBMS/doctor/savePrescription/"+$('#patID').val()+"/"+JSON.stringify(selectedTreatements),
			data:JSON.stringify(prescription),
			contentType:"application/json; charset=utf-8",
			processData:false,
			async:false,
			success:function(data){
				console.log("data:"+data);
			}
		});
		
	});
});

