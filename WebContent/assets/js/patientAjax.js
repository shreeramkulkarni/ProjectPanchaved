var currPageNo = 1;

$(function(){
	$.ajax({
		url : "/SpringDBMS/admin/ajaxPatient",
		data : "page=1",
		success : function(data) {
			console.log(data.length);
			if(data.length != 0) {
				console.log(data);
				loadData(data);
			}else {
				$("#next").prop("disabled",true);
				currPageNo--;
			}
		}
	});	
});

function getPPage() {
	
	$("#next").prop("disabled",false);
	
	if(currPageNo>1){
		currPageNo--;
		if(!$("#searchbar").val()){
			searchedFlag=0;
		$.ajax({
			url : "/SpringDBMS/admin/ajaxPatient",
			data : "page="+currPageNo,
			success : function(data) {
				loadData(data);
			}

		});
		}else{
			searchFunction();
		}
		
	}
}

function getNPage() {
	currPageNo++;
	console.log($("#searchbar").val());
	if(!$("#searchbar").val()){
		searchedFlag=0;
		console.log("oop")
		$.ajax({
			url : "/SpringDBMS/admin/ajaxPatient",
			data : "page="+currPageNo,
			success : function(data) {
				console.log(data.length);
				if(data.length != 0) {
					console.log(data);
					loadData(data);
				}else {
					$("#next").prop("disabled",true);
					currPageNo--;
				}
			}
		});
	}else {
		console.log("searching next");
		searchFunction();
	}
	
}


function loadData(data) {
	var i,row;


	$("td").remove();
	for(i=0 ; i< data.length; i++){
		let d = new Date(data[i].dob);
		var curr_date = d.getDate();
		var curr_month = d.getMonth() + 1; //Months are zero based
		var curr_year = d.getFullYear();
		
		let dyData = "<td><a href=/SpringDBMS/admin/patient/update?patientId="+data[i].patientId+">"+data[i].patientId+"</a></td>"+
		"<td>"+data[i].patientName+"</td>"+
		"<td>"+data[i].gender+"</td>"+
		"<td>"+data[i].bloodGroup+"</td>"+
		"<td>"+data[i].phoneNo+"</td>"+
		"<td>"+curr_date + "-" + curr_month + "-" + curr_year+"</td>"+
		"<td>"+data[i].address+"</td>"+
		"<td>"+data[i].district+"</td>"+
		"<td>"+data[i].state+"</td>"+
		"<td><button type='button' class='close' aria-label='Close' data-toggle='modal' data-target='#myModal' onclick=noteEntry("+data[i].patientId+",'"+data[i].patientName+"')><span aria-hidden='true'>&times;</span></button></td>";
		$('tbody').append("<tr id="+data[i].patientId+">"+dyData+"</tr>");
		
	}
	$("#dataTable_info").text("Showing page "+currPageNo);
}
function noteEntry(patientId,patientName){
	$("#patient").text(patientId +":"+patientName);
	$("#yes").val(patientId);
	console.log("yes:"+$("#yes").val());
}
function removeEntry(){
//	console.log(patientId);
	$.ajax({
		url : "/SpringDBMS/admin/removePatient",
		data : "patientId="+$("#yes").val(),
		success : function(data) {
			$('#finalMsg').modal('show');
			$("#"+$("#yes").val()+"").remove();
		}
	});	

}