var searchedFlag = 0;

function searchFunction() {
	$("#next").prop("disabled",false);
	if(searchedFlag==0){
		$("#next").prop("disabled",false);
		currPageNo=1;
		searchedFlag=1;
		}
	console.log("pageno:"+currPageNo);
//	curr
	$.ajax({
		type:"POST",
		url : "/SpringDBMS/admin/ajaxSearchPatient",
		data : "searchText="+$("#searchbar").val()+"&page="+currPageNo,
		success : function(responseJson) {

			if(responseJson.length != 0) {
				loadData(responseJson);
			}else {
//				loadData(responseJson);
				$("#next").prop("disabled",true);
				if(currPageNo>1){ currPageNo--;}
				
			
			}
		}

	});
	
}