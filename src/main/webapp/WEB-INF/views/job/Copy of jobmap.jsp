<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <title>Simple Polylines</title>
    <style>
      html, body, #map-canvas {
        height: 80%;
        width: 80%;
        margin: 0px;
        padding: 0px
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
  
  
  <body>
    <div id="map-canvas"></div>
    <div>
    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h2>List of Coordinates for Job: ${jobid} </h2>


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
    <script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['String', 'String','dmy']
	},
	paging: true,  
    paging_length: 100,
 
   	col_width: ["80px","80px","120px"],
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
    grid_width: '320px',  
    grid_height: '450px',  
  
    grid_enable_cols_resizer: false, //disables columns resizing  
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("jobcoordinatesTable",props);
//]]>
  </script>
    
  </body>
</html>