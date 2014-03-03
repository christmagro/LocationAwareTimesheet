<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create Employee</title>
	
		<link rel="stylesheet" type="text/css" href="../resources/TableFilter/filtergrid.css">
	<!-- Scripts -->
		<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script type="text/javascript" src="../resources/TableFilter/tablefilter_all.js" ></script>
		<script type="text/javascript" src="../resources/TableFilter/sortabletable.js"></script>
		<script type="text/javascript" src="../resources/TableFilter/tfAdapter.sortabletable.js" ></script>
		<script type="text/javascript" src="../resources/TableFilter/ezEditTable/ezEditTable.js" ></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
</head>
<body>

 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h2>Clients List</h2>

<a href="addClientDetails?clientid=${clientid}">Add Contact Details</a>



	<table id="clientdetailsTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Name</th>
		<th align = "center" class="center">Surname.</th>
		<th align = "center" class="center">Description</th>
		<th align = "center" class="center">Address1</th>
		<th align = "center" class="center">Address2</th>
		<th align = "center" class="center">Email</th>
		<th align = "center" class="center">Phone</th>
		<th align = "center" class="center">Locality</th>
		
		<th align = "center" class="center">Edit Details</th>
		<th align = "center" class="center">Remove Details</th>
		
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${clientdetailsslist}" var="clientdetailsslist">
			<c:url var="editClientDetails" value="/client/editClientDetails?clientdetailsid=${clientdetailsslist.id}" />
			<c:url var="removeClientDetails" value="/client/removeClientDetails?clientdetailsid=${clientdetailsslist.id}" />
					
		<tr>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.id}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsContactName}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsContactSurname}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsContactDescription}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsAddress1}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsAddress2}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsContactEmail}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.clientDetailsContactPhone}" /></td>
			<td align = "center" class="center"><c:out value="${clientdetailsslist.locality.localityName}" /></td>
			

			<td align = "center" class="center"><a href="${editClientDetails}"><img src="../resources/images/edit.png" alt="Edit Client Details" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${removeClientDetails}"><img src="../resources/images/disable.png" alt="Remove Client Details" width="25px" height="25px" ></a></td>
					
			
			
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String', 'String', 'String', 'String', 'String','none','none']
	},
	paging: true,  
    paging_length: 10,
   	col_9:"none",
   	col_10:"none",
		col_width: ["20px","70px","70px","100px","120px","90px","140px","100px","100px","50px","50px"],
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
    grid_width: '1010px',  
    grid_height: '400px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("clientdetailsTable",props);
//]]>
  </script>


</body>
</html>
