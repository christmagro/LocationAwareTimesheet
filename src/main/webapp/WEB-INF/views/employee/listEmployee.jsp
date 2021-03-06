<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Location Aware Timesheet System</title>

<jsp:include page="/resources/template/header.jsp" /> 

<section>
    <div class="container" align="center">
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h2>List of Employees</h2>

<a href="addEmployee">Add Employee</a>



	<table id="employeeTable">
		
		<thead>
		<tr>
		<th align = "center" >Id</th>
		<th align = "center" class="center">Name</th>
		<th align = "center" class="center">Surname</th>
		<th align = "center" class="center">Date of Birth</th>
		<th align = "center" class="center">Gender</th>
		<th align = "center" class="center">Phone</th>
		<th align = "center" class="center">Email</th>
		<th align = "center" class="center">Start Date</th>
		<th align = "center" class="center">Department</th>
		<th align = "center" class="center">Edit</th>
		<th align = "center" class="center">Addresses</th>
		<th align = "center" class="center">Chg Dept</th>
		<th align = "center" class="center">Permissions</th>
		<th align = "center" class="center">Terminate</th>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeelist}" var="employeelist">
			<c:url var="editEmployee" value="/employee/editEmployee?id=${employeelist.employee.id}" />
			<c:url var="changeDept" value="/employee/editEmployeeDepartment?id=${employeelist.employee.id}" />
			<c:url var="viewAddresses" value="/employee/listEmpAddresses?employeeid=${employeelist.employee.id}" />
			<c:url var="viewPermissions" value="/employee/listEmployeePermissions?employeeid=${employeelist.employee.id}" />
			<c:url var="terminate" value="/employee/terminateEmployee?employeeid=${employeelist.employee.id}" />
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${employeelist.employee.id}" /></td>	
			<td align = "center" class="center"><c:out value="${employeelist.employee.employeeName}" /></td>
			<td align = "center" class="center"><c:out value="${employeelist.employee.employeeSurname}" /></td>
			<td align = "center" class="center"><joda:format value="${employeelist.employee.employeeDob}" pattern="dd/MM/yyyy"/></td>
			<td align = "center" class="center"><c:out value="${employeelist.employee.employeeGender}" /></td>
			<td align = "center" class="center"><c:out value="${employeelist.employee.employeePhone}" /></td>
			<td align = "center" class="center"><c:out value="${employeelist.employee.employeeEmail}" /></td>
			<td align = "center" class="center"><joda:format value="${employeelist.employee.employeeStartDate}" pattern="dd/MM/yyyy"/></td>
			<td align = "center" class="center"><c:out value="${employeelist.department.departmentName}" /></td>
			<td align = "center" class="center"><a href="${editEmployee}"><img src="../resources/images/edit.png" alt="Edit Employee Details" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${viewAddresses}"><img src="../resources/images/address.png" alt="View Employee Addresses" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${changeDept}"><img src="../resources/images/department.png" alt="Change Employee Department" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${viewPermissions}"><img src="../resources/images/Permission.png" alt="View Permission" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${terminate}"><img src="../resources/images/disable.png" alt="Terminiate Employee" width="25px" height="25px" ></a></td>
			
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'dmydate', 'String', 'Number', 'dmydate', 'String', 'String', 'none', 'none','none','none']
	},
	paging: true,  
    paging_length: 100,
	col_4:"Select",
	col_9:"none",
	col_10:"none",
	col_11:"none",
	col_12:"none",
	col_13:"none",
	col_width: ["20px","40px","40px","40px","20px","40px", "50px","40px","25px","20px","20px","20px","20px","20px"],
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
    grid_width: '1035px',  
    grid_height: '400px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("employeeTable",props);
//]]>
  </script>
  
    </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
