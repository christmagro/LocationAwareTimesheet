<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

	<!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,700" rel="stylesheet" type="text/css">
    <!-- CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/squareserif.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/TableFilter/filtergrid.css">
  	<link rel="stylesheet" type="text/css" href="../resources/TableFilter/TFExt_ColsResizer/TFExt_ColsResizer.css">
  	<link type="text/css" href="../resources/css/jquery.simple-dtpicker.css" rel="stylesheet" />
    
    <!-- Scripts -->
 <!-- <script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script> -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.simple-dtpicker.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/js/aos.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/ajaxfunctions.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.simple-dtpicker.js"></script>

	
	
   

</head>
      <title>Simple Polylines</title>
    <style>
      #map-canvas {
      	align: center;
        height: 50%;
        width: 50%;
        margin-left: 325px;
        margin-bottom: 50px;
        padding: 0px;
       
      }
    </style>
    
    
    		<link rel="stylesheet" type="text/css" href="../resources/TableFilter/filtergrid.css">
   		<script type="text/javascript" src="../resources/js/jquery.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    		<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script type="text/javascript" src="../resources/TableFilter/tablefilter_all.js" ></script>
		<script type="text/javascript" src="../resources/TableFilter/sortabletable.js"></script>
		<script type="text/javascript" src="../resources/TableFilter/tfAdapter.sortabletable.js" ></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
    
    <script>
          
           function loadmap(){
           var flightPlanCoordinates = [];
           
        $.getJSON("/lats/json/listCoordinates?allocationid=${joballocation.id}", function(data) {
        	  
        	 $.each(data, function(index, objNumber) {
          		 flightPlanCoordinates.push( new google.maps.LatLng(objNumber.latitude, objNumber.longitude));
        		 
        		
        	  }); 
          	
        	 initialize();
        	 function initialize() {
        		  var mapOptions = {
        		    zoom: 55,
        		    center: flightPlanCoordinates[0],
        		    mapTypeId: google.maps.MapTypeId.HYBRID
        		  };

        		  var map = new google.maps.Map(document.getElementById('map-canvas'),
        		      mapOptions);

        	 var flightPath = new google.maps.Polygon({
        		    path: flightPlanCoordinates,
        		    strokeColor: '#FF0000',
        		    strokeOpacity: 0.8,
        		    strokeWeight: 3,
        		    fillColor: '#FF0000',
        		    fillOpacity: 0.35
        		  });

        		  flightPath.setMap(map);
        		}

        		
        	 });
          
           }

google.maps.event.addDomListener(window, 'load', loadmap);

    </script>
  </head>
  <body class="aos">
<header>
    <nav class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                
                <a class="navbar-brand" href="home"></a>
                
                
            </div>
            <div class="collapse navbar-collapse" id="top-navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="../employee/listEmployees" class="dropdown-toggle" data-toggle="dropdown">Employee <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../employee/listEmployees">List Employees</a></li>
                            <li><a href="../employee/addEmployee">Create Employee</a></li>
                            <li><a href="../employee/listEmployeeManager">List Managers</a></li>
                            <li><a href="../employee/addEmployeeManager">Manager Create </a></li>
                            <li><a href="../employee/listEmployeeDevices">List Mobile Devices </a></li>
                            <li><a href="../employee/addEmployeeDevice">Add Device </a></li>
                            <li><a href="../employee/listPermissions">List Permissions</a></li>
                            <li><a href="../employee/addPermission">Add Permission</a></li>
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a href="../client/listClients" class="dropdown-toggle" data-toggle="dropdown">Clients<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../client/listClients">List Clients</a></li>
                            <li><a href="../client/addClient">Create Client</a></li>
                        </ul>
                    </li>
                       <li class="dropdown">
                        <a href="../job/listJobs" class="dropdown-toggle" data-toggle="dropdown">Jobs<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../job/listJobsNew">List New Jobs</a></li>
                             <li><a href="../job/listJobsInprogress">List Jobs in progress</a></li>
                            <li><a href="../job/listJobs">List Non Completed Jobs</a></li>
                             <li><a href="../job/listJobsClosed">List Completed Jobs</a></li>
                            
                        </ul>
                    </li>
                        <li class="dropdown">
                        <a href="../job/listJobsDepartment" class="dropdown-toggle" data-toggle="dropdown">Departamental<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../job/listJobDepartmentUpdate">List New Jobs</a></li>
                             <li><a href="../job/listJobsDepartmentInprogress">List Jobs in progress</a></li>
                            <li><a href="../job/listJobsDepartment">List Non Completed Jobs</a></li>
                             <li><a href="../job/listJobsDepartmentClosed">List Completed Jobs</a></li>
                            
                        </ul>
                    </li>
                        
                    <li><a href="../security/chgPassword">Change Password</a></li>
                    <li><a href="../security/logout">Log Out</a></li>
                    </ul>
            </div>
        </div>
    </nav>
    <section class="header">

    </section>
</header>
<section class="feature js-feature">
    <div class="container">
        
        </div>
 
</section>
<section>
    <div class="container" align="center">
  	<h2>List of Coordinates for Job: ${jobid} </h2>
    <div margin="250px">
    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>



	<table id="jobcoordinatesTable">
		
		<thead>
		<tr>
		
		<th align = "center" class="center">Latitude</th>
		<th align = "center" class="center">Longitude</th>
		<th align = "center" class="center">Date & Time</th>

	
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${jobcoordinates}" var="jobcoordinates">
			
		
		
		
		<tr>
	
			<td align = "center" class="center"><c:out value="${jobcoordinates.jobCoordinatesLatitude}" /></td>
			<td align = "center" class="center"><c:out value="${jobcoordinates.jobCoordinatesLongitude}" /></td> 
			<td align = "center" class="center"><joda:format value="${jobcoordinates.jobCoordinatesTimestamp}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
		
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
    </div>
    <h2>List of Coordinates on map for Job: ${jobid} </h2>
     </div>
</section>
    <div id="map-canvas"></div>

    <script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['String', 'String','dmy']
	},
	paging: true,  
    paging_length: 100,
 
   	col_width: ["120px","120px","160px"],
	results_per_page: ['# rows per page',[10,100]], 
    rows_counter: true,  
    rows_counter_text: "Rows:",  
    btn_reset: true,  
    loader: true,  
    loader_html: '<h5 style="color:black;">Loading, please wait...</h5>',  
	alternate_rows: true,
	paging: true,  
    paging_length: 10,
	on_keyup: true,  
    on_keyup_delay: 500,  
    
    selectable: true,  
    editable: true,  
    
  
    //Grid layout properties  
    grid_layout: true,  
    grid_width: '410px',  
    grid_height: '250px',  
  
    grid_enable_cols_resizer: false, //disables columns resizing  
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("jobcoordinatesTable",props);
//]]>
  </script>
    




<jsp:include page="/resources/template/footer.jsp" /> 