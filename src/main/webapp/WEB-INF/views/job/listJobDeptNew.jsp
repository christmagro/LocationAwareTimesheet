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
<h2>List of Employees</h2>

<a href="addEmployee">Add Employee</a>



	<table id="jobdepartmentupdateTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Name</th>
		<th align = "center" class="center">Surname</th>
		<th align = "center" class="center">Date of Birth</th>
		<th align = "center" class="center">Date of Birth</th>
		<th align = "center" class="center">Date of Birth</th>
		<th align = "center" class="center">Date of Birth</th>
		<th align = "center" class="center">Edit Employee</th>
		<th align = "center" class="center">View Addresses</th>
		<th align = "center" class="center">Change Department</th>
		<th align = "center" class="center">View Permissions</th>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${jdulist}" var="jdulist">
			<c:url var="editEmployee" value="/employee/editEmployee?id=${employeelist.employee.id}" />
			<c:url var="changeDept" value="/employee/editEmployeeDepartment?id=${employeelist.employee.id}" />
			<c:url var="viewAddresses" value="/employee/listEmpAddresses?employeeid=${employeelist.employee.id}" />
			<c:url var="viewPermissions" value="/employee/listEmployeePermissions?employeeid=${employeelist.employee.id}" />
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${jdulist.job.id}" /></td>	
			<td align = "center" class="center"><c:out value="${jdulist.job.jobDescription}" /></td>
			<td align = "center" class="center"><joda:format value="${jdulist.job.jobAppointmentDatetime}" pattern="dd/MM/yyyy HH:mm"/></td>
			<td align = "center" class="center"><c:out value="${jdulist.departmentjob.id}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.jobstatus.jobStatusName}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.clientdetails.clientDetailsAddress1}, ${jdulist.clientdetails.clientDetailsAddress2}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.locality.localityName}" /></td> 
			
			<td align = "center" class="center"><a href="${editEmployee}"><img src="../resources/images/edit.png" alt="Edit Employee Details" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${viewAddresses}"><img src="../resources/images/address.png" alt="View Employee Addresses" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${changeDept}"><img src="../resources/images/department.png" alt="Change Employee Department" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${viewPermissions}"><img src="../resources/images/department.png" alt="Change Employee Department" width="25px" height="25px" ></a></td>
			 
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String','String','String', 'none','none', 'none','none']
	},
	paging: true,  
    paging_length: 100,
	col_4:"Select",
	col_9:"none",
	col_10:"none",
	col_11:"none",
	col_12:"none",
	col_width: ["20px","120px","110px","110px","110px","110px","110px","30px","30px","30px","30px"],
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
    grid_width: '920px',  
    grid_height: '400px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("jobdepartmentupdateTable",props);
//]]>
  </script>


</body>
</html>
