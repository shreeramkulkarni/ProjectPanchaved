/**
 * 
 */
function formatDate(date) {
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
			+ d.getDate(), year = d.getFullYear();

	if (month.length < 2)
		month = '0' + month;
	if (day.length < 2)
		day = '0' + day;

	return [ year, month, day ].join('-');
}

function reviewData(patient) {

	$("#patientId").val(patient.patientId);
	$("#remarks").val(patient.remarks);
	$("#patientName").val(patient.patientName);
	$("#dob").val(formatDate(patient.dob));
	$(
			"div#dataTable_length option[value='"
					+ patient.bloodGroup.toUpperCase() + "']").attr('selected',
			true);

	// set patient gender
	if (patient.gender === 'f' || patient.gender === 'Female') {
		$("div.dataTables_length option[value='Female']")
				.attr('selected', true);
	} else if (patient.gender === 'm' || patient.gender === 'Male') {
		$("div.dataTables_length option[value='Male']").attr('selected', true);
	} else {
		$("div.dataTables_length option[value='Other']").attr('selected', true);
	}

	$("#phoneNo").val(patient.phoneNo);
	$("#address").val(patient.address);
	$("#district").val(patient.district);
	$("#state").val(patient.state);

}

$(function() {
	//	
	$('#sForm').hide();
	$("#proceed").click(
					function() {
						//$("#warn").show();
						patId = $("[name=patId]").val();
						if (patId === "") {
							document.getElementById("warn").innerHTML = "Please enter Patient ID!!";
							return;
						}
						else{
							$('#warn').hide();
							$('#sForm').show();
							$.ajax({
										url : "/SpringDBMS/doctor/patient/review?patientId="
												+ patId,
										success : function(patient) {
											reviewData(patient);
										}
									});
						}
						
					});

	$("#save").click(function(event) {

		$.ajax({
			url : "/SpringDBMS/doctor/patient/update",
			type:"post",
			success : function() {
				console.log("success");
			}
		});
	});
});