 function onchange() {
     
     console.log("inside on change");
                    $('#report').val("");
                    var box1= $('#field1');
                    var box2= $('#field2');
                    var box3= $('#field3');
                    var box4= $('#field4');
                    var box5= $('#field5');
                    var box6= $('#field6');
                    var box7= $('#field7');
                    var box8= $('#field8');

                    $('#report').val("Patient ID: "+box1.val()+"\n"+
                            
                                    "C/O:  "+box2.val()+"\n"+
                                    "H/O: "+box3.val()+"\n"+
                                    "Physical Findings: "+box4.val()+"\n"+
                                     "O/E: "+box5.val()+"\n"+
                                    "CNS-RS : "+box6.val()+"\n"+
                                    "P/A : "+box7.val()+"\n"+
                                    "Investigations : "+box8.val()+"\n");
        }

$(function(){
	var id= $('#field1').val();
	$.ajax({
		url : "/SpringDBMS/doctor/patient/casetaking",
		type:"get",
		data : "patId="+id, 
		success : function(data) {
			if(data.length === 0){
				$('#history').append("No History available!!\n");
				return;
			}
				
			for (var i = 0; i < data.length; i++) {
				$('#history').append("Date : "+data[i].date+"\n");
				$('#history').append("C/O: "+data[i].co+"\n");
				$('#history').append("H/O: "+data[i].ho+"\n");
				$('#history').append("PhysicalFindings: "+data[i].physicalFindings+"\n");
				$('#history').append("O/E: "+data[i].oe+"\n");
				$('#history').append("CNS-RS: "+data[i].cns_rs+"\n");
				$('#history').append("P/A: "+data[i].pa+"\n");
				$('#history').append("Investigations: "+data[i].investigations+"\n");
				$('#history').append("\t===================================\n");
			}
			
	
		}
	});
	
	
            $('#genReport').on('click', function(){
                onchange();
                console.log("submitB");
            });
        });
