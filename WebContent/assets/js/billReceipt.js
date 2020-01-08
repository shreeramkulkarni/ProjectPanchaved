var index =0
$(function(){
	var id = $('#patid').val();
	var date = new Date(Date.now()).toLocaleString();
	$("input[id=date]").val(date);
	$("input[type=number]").keyup(function(){
		totalAmount();
	});
	
	$("#print").click(function() {
		$("#sel1").hide();
		$(this).hide();
		window.print();
		
	});
});
function addNewRow() {
	
	var name = $("select#sel1 option:selected").text();
	var value = $("select#sel1 option:selected").val();
	var amount;
	$('tbody').prepend("<tr id="+index+">"+
			"<td>"+name+"</td>"+
			"<td><input value=0 type='phone' id='"+name+"' onkeyup='calculateAmount(this.id,"+value+")'>  	X		"+value+" </td>"+
			"<td><i>&#8377;</i><span></span><input id='amt' name="+name+" type='number' value=0 disabled><br></td>"+
			"<td><button type='button' class='close' aria-label='Close' onclick='removeEntry("+index+")'><span aria-hidden='true'>&times;</span></button></td>"+
	"</tr>");
index++;
}

function calculateAmount(name,cps) {

	let sittings = document.getElementById(name).value; 
//	console.log("si:"+sittings);
	let amount = sittings*cps;
//	console.log(amount);
	$("input[name="+name+"]").val(amount);
	totalAmount();
}

function totalAmount() {
	var total = 0;
	$("input[id=amt]").each(function() {
		total += $(this).val()*1;

	});
	$("#Tamt").val(total);
	console.log("total:"+total);
}
function removeEntry(index){
	console.log(index);
	$("#"+index+"").remove();
	totalAmount();

}