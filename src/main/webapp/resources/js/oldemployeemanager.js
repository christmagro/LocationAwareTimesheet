/**
 * 
 */
function doAjaxPost() {  
	
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
	      alert('Error: ' + e);  
	    }  
	  });  
	}  

