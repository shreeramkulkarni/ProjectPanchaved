<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Demo</title>
</head>
<body>

	${hellomsg}
	<a href="http://jquery.com/">jQuery</a>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


	<span id="myspan"> </span>
	<button id="b" onclick="myFunc()">click me</button>
	<script>
		function myFunc() {
			 $.ajax({
		            url : "http://localhost:8080/SpringDBMS/admin/patient?page=1",
		            success : function(data) {
		                $('#myspan').html(data[0].gender);
		                console.log(data.length);
		                console.log(data);
		               loadData(data);
		            }
			 });
		}
		function loadData(data) {
			var i,row;
			row = document.getElementsByTagName("tr");
			for(i=0 ; i< data.length; i++){
					
						let dyData = "<td>"+data[i].patientId+"</td>"+
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
		}
	</script>




	<table class="table dataTable my-0" id="dataTable">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Gender</th>
				<th>blood Group</th>
				<th>Phone Number</th>
				<th>D.O.B.</th>
				<th>address</th>
				<th>District</th>
				<th>State</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
				<td>d</td>
				<td>e</td>
				<td>f</td>
				<td>g</td>
				<td>h</td>
				<td>i</td>
			</tr>

		</tbody>

	</table>




</body>
</html>