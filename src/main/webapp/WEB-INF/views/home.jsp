<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple Polylines</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    
   		<script type="text/javascript" src="../resources/js/jquery.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
// This example creates a 2-pixel-wide red polyline showing
// the path of William Kingsford Smith's first trans-Pacific flight between
// Oakland, CA, and Brisbane, Australia.


/* 

function initialize() {
  var mapOptions = {
    zoom: 3,
    center: new google.maps.LatLng(0, -180),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions); */
      
//     var jsonData = JSON.parse(http://localhost:8080/lats/json/listCoordinates);
// for(var i = 0; i < jsonData.polylines.length; i++)
// {
// 
//     var contact = JSON.parse(jsonData.polylines[i].longitude);
// 
//     alert(contact)  
// }

/* jQuery.each( obj, function( i, val ) {
  $( "#" + i ).append( document.createTextNode( " - " + val ) );
});

          $.getJSON('http://localhost:8080/lats/json/listCoordinates', function(jd) {
          		for(jd.lenght);
         
      });
           */
           
           function loadmap(){
           var flightPlanCoordinates = [];
           
        $.getJSON("http://localhost:8080/lats/json/listCoordinates?allocationid=${allocationid}", function(data) {
        	  
        	 $.each(data, function(index, objNumber) {
        		//alert(objNumber.latitude);
        		 flightPlanCoordinates.push( new google.maps.LatLng(objNumber.latitude, objNumber.longitude));
        		 
        		
        	  }); 
          	
        	 initialize();
        	 function initialize() {
        		  var mapOptions = {
        		    zoom: 15,
        		    center: flightPlanCoordinates[0],
        		    mapTypeId: google.maps.MapTypeId.TERRAIN
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

/*   var flightPlanCoordinates = [ 
  new google.maps.LatLng(37.772323, -122.214897),
    new google.maps.LatLng(21.291982, -157.821856),
    new google.maps.LatLng(-18.142599, 178.431),
    new google.maps.LatLng(-27.46758, 153.027892) 
  ]; */
  
  
  
/*   var flightPath = new google.maps.Polyline({
    path: flightPlanCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  flightPath.setMap(map);
}
         */
google.maps.event.addDomListener(window, 'load', loadmap);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>