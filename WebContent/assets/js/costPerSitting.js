var index = 0;
$(function(){
	loadPage();
	$('#addCps').click(function(){
		var cpsRow = "<tr id='"+index+"' >"+
		"<td><input name='name' type='text' placeholder='Name' ></td>"+
		"<td><input name='cost' type='number' placeholder='Cost' ></td>"+
		"<td><button type='button' class='close' aria-label='Close' onclick='removeEntry("+index+")'><span aria-hidden='true'>&times;</span></button></td>"+
		"</tr>";
		$('tbody').append(cpsRow);

		index++;
	});

});

function loadPage() {
	$.ajax({
		url : "/SpringDBMS/admin/getCPSMap",
		success : function(data) {
			for (var name in data) {
				let cost = data[name];
				populateMap(name,cost);
			}
			console.log(data['snehan']);
		}
	});
}
function removeEntry(index){
	console.log(index);
	$("#"+index+"").remove();

}
function save(){
	let jsonMap = {};
	let i = 0;
	for(i = 0;i < $('tr').length;i++){
		var name = $("tr[id="+i+"] input[name=name]").val();
		var cost = $("tr[id="+i+"] input[name=cost]").val();
		jsonMap[name]=cost;
	}
	let jsonString = JSON.stringify(jsonMap);
	console.log("jsonMap : "+jsonString);

	$.ajax({
		type:"POST",
		url:"/SpringDBMS/admin/setCost",
		contentType: "application/json; charset=utf-8",
		data: jsonString, //Stringified Json Object
		async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
		cache: false,    //This will force requested pages not to be cached by the browser          
		processData:false, //To avoid making query String instead of JSON
		success: function(response){
			window.location.reload();
		}

	});
	

}
function populateMap(name,cost) {

	var cpsRow = "<tr id='"+index+"' >"+
	"<td><input name='name' type='text' placeholder='Name' value="+name+" ></td>"+
	"<td><input name='cost' type='number' placeholder='Cost' value="+cost+"></td>"+
	"<td><button type='button' class='close' aria-label='Close' onclick='removeEntry("+index+")'><span aria-hidden='true'>&times;</span></button></td>"+
	"</tr>";
	$('tbody').append(cpsRow);
	index++;

}