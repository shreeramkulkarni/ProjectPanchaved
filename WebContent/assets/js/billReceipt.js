var index =0
$(function(){
	
	var treatment = {};

	var date = new Date(Date.now()).toLocaleString();
	$("input[id=date]").val(date);
	$("input[type=number]").keyup(function(){
		totalAmount();
	});

	$("#print").click(function() {
		window.print();
	});
});
function addNewRow() {

	var name = $("select#sel1 option:selected").text();
	var value = $("select#sel1 option:selected").val();
	var amount;
	$('tbody').prepend("<tr class='session' id="+index+">"+
			"<td id='tname'>"+name+"</td>"+
			"<td><input class='tkey' value=0 type='phone' id='"+name+"' onkeyup='calculateAmount(this.id,"+value+")'>  	X	<span data-val="+value+">"+value+" </span> </td>"+
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
	if(total!=0){
		$("#print").prop("disabled",false);
		$("#save").prop("disabled",false);
	}else{
		$("#print").prop("disabled",true);
		$("#save").prop("disabled",true);
	}
	$("#Tamt").val(total);
	
}
function removeEntry(obj){
//	console.log($(obj).parent().parent());
	$(obj).parent().parent().remove();
//	console.log("index:"+index);
//	$("#"+index+"").remove();
	totalAmount();
}

function save() {
	var totalBillAmount = $('#Tamt').val();	
	var patientId = $('#patid').val();
	var doctorName =$('input[name=doctorName]').val();
	var medicineCharges = $('input[name=medicineCharges]').val();
	var serviceCharges = $('input[name=serviceCharges]').val();
	var consultationFees = $('input[name=consultationFees]').val();

	
	
	var PatientBill = {
			"patientId":patientId,
			"doctorName":doctorName,
			"medicineCharges":medicineCharges,
			"serviceCharges":serviceCharges,
			"consultationFees":consultationFees,
			"totalBillAmount":totalBillAmount
	};
	let i=0;
	t =[];
	$(".session").each(function() {
		var treatment = 
		{ "name" : $(this).find("td#tname").text(),
		   "quantity" : $(this).find(".tkey").val(),
		   "rate" : $(this).find("span").attr("data-val"),
		};
		console.log("treatment :"+JSON.stringify(treatment));
		t.push(treatment);
	});
	PatientBill["pts"] = t;
	console.log("Bill : "+JSON.stringify(PatientBill)+" \n t : "+JSON.stringify(t));
	
	$.ajax({
		type:"POST",
		url:"/SpringDBMS/doctor/saveBill",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(PatientBill), //Stringified Json Object
		async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
		cache: false,    //This will force requested pages not to be cached by the browser          
		processData:false, //To avoid making query String instead of JSON
		success: function(response){
			$(".modal-body").text("Saved bill successfully with Bill Id : "+response+"!");
			$("#retrySave").hide();
			$("#myModal").modal("show");
		},
		error:function() {
			$(".modal-body").text("COULD NOT SAVE THE BILL!!!");
			$("#myModal").modal("show");
		}
	});
}
