$(function (){
		
	var localJson = JSON.parse(localStorage.getItem("localJsonResponse"));
	var myBill;
	
	console.log(localStorage.getItem("printId"));
	localJson["bills"].forEach(function(bill){
		if(bill.billId ==localStorage.getItem("printId")){
			myBill = bill;
			return;
		}
	});
	//pts:PanchavedTreatmentS
	myBill["pts"].forEach(function(pts){
		let name = pts.name;
		let quantity = pts.quantity;
		let rate = pts.rate;
		let amount = (quantity * rate);
		$('tbody').prepend("<tr>"+
				"<td id='tname'>"+name+"</td>"+
				"<td><input class='tkey border-0' value='"+quantity+"' type='phone' id='"+name+"' readonly>  	X	<span >"+rate+" </span> </td>"+
				"<td><i>&#8377;</i><span></span><input id='amt' type='number' value='"+amount+"' disabled><br></td>"+
		"</tr>");
	});
	console.log(myBill);
	$("#billDate").val(myBill.dateOfBill);
	$("#doctorName").val(myBill.doctorName);
	$("#medicineCharges").val(myBill.medicineCharges);
	$("#serviceCharges").val(myBill.serviceCharges);
	$("#consultationFees").val(myBill.consultationFees);
	$("#totalBillAmount").val(myBill.totalBillAmount.toString().concat("/-"));
	$("#print").click(function(){
		window.print();
	});
	window.onbeforeunload = function() {
		console.log("bye");
		  localStorage.removeItem("localJsonResponse");
		  localStorage.removeItem("printId");
		  return '';
		};
});