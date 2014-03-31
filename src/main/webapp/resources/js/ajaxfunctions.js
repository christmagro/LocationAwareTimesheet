/**
 * 
 */
function doAddEmployeeManager() {  
	
	var delay = 1000; //Your delay in milliseconds

	
	  $.ajax({  
	    type: "POST", 
	    url: "employee/addEmployeeManager",
	    data : { "employeeId":$("#employeeId").val(),"departmentId":$("#departmentId").val()}, 
	       success: function(response){
	      // we have the response 
	    	   
	      if(response.status == "SUCCESS"){
	    	  $('#info').html("Record updated succesfull");
	    	  $('#button').hide();
	    	  setTimeout(function(){ window.location.href = "listEmployeeManager";}, delay); 
	    	 // window.location.href = "listEmployeeManager";
	      }else{
	    	   	
	    	  $('#error').html("Please correct following errors: " + response.result);
	    	  $('#info').hide('slow');
	    	  $('#error').show('slow');
	    	  
	      }	      
	    },  
	    error: function(e){  
	    	alert('Please fill in all fields');   
	    }  
	  });  
	}  

/**
 * 
 */
function doEditEmployeeManager() {  
	var delay = 1000; //Your delay in milliseconds

$.ajax({  
  type: "POST", 
  url: "editEmployeeManager",
  data : { "employeeId":$("#employeeId").val(),  "departmentId":$("#departmentId").val(), "employeemanagerId":$("#employeemanagerId").val()},
  success: function(response){
    // we have the response 
	 
    if(response.status == "SUCCESS"){
  	
    	 $('#info').html("Record updated succesfull");
    	 $('#button').hide();
   	     setTimeout(function(){ window.location.href = "listEmployeeManager";}, delay); 
    }else{
  	   	
  	  $('#error').html("Please correct following errors: " + response.result);
  	  $('#info').hide('slow');
  	  $('#error').show('slow');
    }	      
  },  
  error: function(e){  
	  alert('Please fill in all fields');   
  }  
});  
}

/**
 * 
 */
function doAddEmployeeDevice() {  
	var delay = 1000; //Your delay in milliseconds

$.ajax({  
  type: "POST", 
  url: "addEmployeeDevice",
  data : { "employeeid":$("#employeeid").val(), "imei":$("#imei").val(), "model":$("#model").val()},
  success: function(response){
    // we have the response 
	  
	
	 
    if(response.status == "SUCCESS"){
    	
    
    	 $('#info').html("Record updated succesfull");
    	 $('#button').hide();
   	     setTimeout(function(){ window.location.href = "listEmployeeDevices";}, delay); 
    }else{
  	   	
  	  $('#error').html("Please correct following errors: " + response.result);
  	  $('#info').hide('slow');
  	  $('#error').show('slow');
    }	      
  },  
  error: function(e){  
	  alert('Please fill in all fields');  
  }  
});  
} 

/**
 * 
 */
function doChangeEmployeeDevice() {  
	var delay = 1000; //Your delay in milliseconds

$.ajax({  
  type: "POST", 
  url: "changeEmployeeDevice",
  data : { "employeedeviceid":$("#employeedeviceid").val(), "imei":$("#imei").val(), "model":$("#model").val()},
  success: function(response){
    // we have the response 
	 
    if(response.status == "SUCCESS"){
  	
    	 $('#info').html("Record updated succesfull");
    	 $('#button').hide();
   	     setTimeout(function(){ window.location.href = "listEmployeeDevices";}, delay); 
    }else{
  	   	
  	  $('#error').html("Please correct following errors: " + response.result);
  	  $('#info').hide('slow');
  	  $('#error').show('slow');
    }	      
  },  
  error: function(e){  
	  alert('Please fill in all fields'); 
  }  
});  
} 


function doCheckEmployeePermission() {  
	var delay = 1000; //Your delay in milliseconds
	var empid = $("#employeeid").val();

$.ajax({  
  type: "POST", 
  url: "addEmployeePermission",
  data : { "permissionid":$("#permissionid").val(), "employeeid":$("#employeeid").val()},
  success: function(response){
    // we have the response 
	 
    if(response.status == "SUCCESS"){
  	
    	 $('#info').html("Record updated succesfull");
    	 $('#button').hide();
   	     setTimeout(function(){ window.location.href = "listEmployeePermissions?employeeid="+ empid;}, delay); 
    }else{
  	   	
  	  $('#error').html("Please correct following errors: " + response.result);
  	  $('#info').hide('slow');
  	  $('#error').show('slow');
    }	      
  },  
  error: function(e){  
	  alert('Please fill in all fields');  
  }  
});  
}

function doAddEmployee() {  
	
	var delay = 1000; //Your delay in milliseconds
	$('#button').hide();
	$('#info').html("Validating form please wait")
	  $.ajax({  
	    type: "POST", 
	    url: "addEmployee",
	    data : { "employeeName":$("#employeeName").val(), "employeeSurname":$("#employeeSurname").val(),"employeeDob":$("#employeeDob").val(),"employeeGender":$("#employeeGender").val(),
	    	"employeePhone":$("#employeePhone").val(),"employeeStartDate":$("#employeeStartDate").val(),"employeeaddress1":$("#employeeaddress1").val(),"employeeaddress2":$("#employeeaddress2").val(),
	    	"elocality":$("#elocality").val(),"edepartment":$("#edepartment").val(),"employeeUsername":$("#employeeUsername").val(),"employeeEmail":$("#employeeEmail").val()}, 
	       success: function(response){
	      // we have the response 
	    	   
	      if(response.status == "SUCCESS"){
	    	  $('#info').html("Employee added succesfull");
	    	  $('#button').hide();
	    	  setTimeout(function(){ window.location.href = "listEmployees";}, delay); 
	    	 // window.location.href = "listEmployeeManager";
	    }else{
	    	 $('#button').show();
	    	  $('#error').html("Please correct following errors: " + response.result);
	    	  $('#info').html("Validating form please wait")
	    	  $('#error').show('slow');
	    	  $('#button').show();
	    	  
	      }	      
	    },  
	    error: function(e){  
	      alert('Please fill in all fields');  
	    
	    }  
	  });  
}  


