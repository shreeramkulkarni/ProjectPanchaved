var currPageNo = 1;


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

		let dyData = "<td><a href=/SpringDBMS/admin/patient/update?patientId="+data[i].patientId+">"+data[i].patientId+"</a></td>"+
		"<td>"+data[i].patientName+"</td>"+
		"<td>"+data[i].gender+"</td>"+
		"<td>"+data[i].bloodGroup+"</td>"+
		"<td>"+data[i].phoneNo+"</td>"+
		"<td>"+data[i].dob+"</td>"+
		"<td>"+data[i].address+"</td>"+
		"<td>"+data[i].district+"</td>"+
		"<td>"+data[i].state+"</td>";
		$('tbody').append("<tr>"+dyData+"</tr>");
	}
	$("#dataTable_info").text("Showing page "+currPageNo);
}