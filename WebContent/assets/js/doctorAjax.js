
var currPagNo = 1;

$(function(){
	$.ajax({
		url : "/SpringDBMS/admin/ajaxDoctor",
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
	if(currPageNo>1){
	currPageNo--;

	$.ajax({
		url : "/SpringDBMS/admin/ajaxDoctor",
		data : "page="+currPageNo,
		success : function(data) {
			loadData(data);
		}

	});
}
}

function getNPage() {
	currPageNo++;
	$.ajax({
		url : "/SpringDBMS/admin/ajaxDoctor",
		data : "page="+currPageNo,
		success : function(data) {
			loadData(data);
		}
	});
}
function loadData(data) {
	var i,row;
	
	
		$("td").remove();
	for(i=0 ; i< data.length; i++){

		let dyData = "<td><a href=/SpringDBMS/admin/doctor/update?doctorID="+data[i].doctorID+">"+data[i].doctorID+"</a></td>"+
		"<td>"+data[i].doctorName+"</td>"+
		"<td>"+data[i].doctorDOB+"</td>"+
		"<td>"+data[i].doctorQualification+"</td>"+
		"<td>"+data[i].doctorAddress+"</td>"+
		"<td>"+data[i].doctorCity+"</td>"+
		"<td><button type='button' class='close' aria-label='Close' onclick='removeEntry("+data[i].doctorID+")'><span aria-hidden='true'>&times;</span></button></td>";
		$('tbody').append("<tr id="+data[i].doctorID+">"+dyData+"</tr>");
	}
	$("#dataTable_info").text("Showing page "+currPagNo);
}


function removeEntry(doctorID){
//	console.log(doctorID);
	$.ajax({
		url : "/SpringDBMS/admin/removeDoctor",
		data : "doctorID="+doctorID,
		success : function(data) {
			alert("Removed "+data+" Entry from the Database");
		}
	});	
	$("#"+doctorID+"").remove();

}