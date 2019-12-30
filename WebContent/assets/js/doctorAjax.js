var currPagNo = 1;
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

		let dyData = "<td><a href=/SpringDBMS/admin/doctor/update?doctorId="+data[i].doctorID+">"+data[i].doctorID+"</a></td>"+
		"<td>"+data[i].doctorName+"</td>"+
		"<td>"+data[i].doctorDOB+"</td>"+
		"<td>"+data[i].doctorQaulification+"</td>"+
		"<td>"+data[i].doctorAddress+"</td>"+
		"<td>"+data[i].doctorCity+"</td>";
		$('tbody').append("<tr>"+dyData+"</tr>");
	}
	$("#dataTable_info").text("Showing page "+currPageNo);
}


function test(){
	
	console.log("test!");
}