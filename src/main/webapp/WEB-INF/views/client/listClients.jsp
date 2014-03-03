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

<a href="addClient">Add Client</a>



	<table id="clientsTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Company Name</th>
		<th align = "center" class="center">Vat No.</th>
		<th align = "center" class="center">Website</th>
		<th align = "center" class="center">Phone</th>
		<th align = "center" class="center">Status</th>
		
		<th align = "center" class="center">Edit Company Details</th>
		<th align = "center" class="center">View Contacts</th>
		<th align = "center" class="center">Change Status</th>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${clientslist}" var="clientslist">
			<c:url var="editClient" value="/client/editClient?clientid=${clientslist.id}" />
			<c:url var="onholdStatus" value="/client/onHoldClient?clientid=${clientslist.id}" />
			<c:url var="activateStatus" value="/client/activateClient?clientid=${clientslist.id}" />
			<c:url var="viewContacts" value="/client/listClientDetails?clientid=${clientslist.id}" />
		
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${clientslist.id}" /></td>	
			<td align = "center" class="center"><c:out value="${clientslist.clientName}" /></td>
			<td align = "center" class="center"><c:out value="${clientslist.clientVat}" /></td>
			<td align = "center" class="center"><c:out value="${clientslist.clientWebsite}" /></td>
			<td align = "center" class="center"><c:out value="${clientslist.clientPhone}" /></td>
			<td align = "center" class="center">
			<c:if test="${clientslist.isClientOnhold()==true}">On Hold</c:if>
			<c:if test="${clientslist.isClientOnhold()==false}">Active</c:if>
			</td>
			
			

			<td align = "center" class="center"><a href="${editClient}"><img src="../resources/images/edit.png" alt="Edit Client Details" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${viewContacts}"><img src="../resources/images/address.png" alt="View Client Addresses" width="25px" height="25px" ></a></td>
					
			<td align = "center" class="center">
			<c:if test="${clientslist.isClientOnhold()==false}"><a href="${onholdStatus}"><img src="../resources/images/enable.png" alt="Put client on hold" width="25px" height="25px" ></a></c:if>
			<c:if test="${clientslist.isClientOnhold()==true}"><a href="${activateStatus}"><img src="../resources/images/disable.png" alt="Activate client" width="25px" height="25px" ></a></c:if>
			</td>
			
			
			
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String', 'String', 'String', 'none', 'none','none']
	},
	paging: true,  
    paging_length: 100,
    col_5:"select",
    col_6:"none",
	col_7:"none",
	col_8:"none",
	col_width: ["20px","90px","100px","90px","100px","60px","50px","50px","50px"],
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
    grid_width: '800px',  
    grid_height: '400px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("clientsTable",props);
//]]>
  </script>


</body>
</html>
