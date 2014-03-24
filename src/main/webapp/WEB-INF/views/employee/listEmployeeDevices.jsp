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
<h2>List of all Employee Devices</h2>


<a href="addEmployeeDevice">Add Device</a>

	<table id="employeedevicesTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Name</th>
		<th align = "center" class="center">Surname</th>
		<th align = "center" class="center">Phone No.</th>
		<th align = "center" class="center">IMEI</th>
		<th align = "center" class="center">Model</th>
		<th align = "center" class="center">Active Since</th>
		<th align = "center" class="center">Change Device</th>
		<th align = "center" class="center">Remove Device</th>
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeedeviceslist}" var="employeedeviceslist">
			<c:url var="changeUrl" value="/employee/changeEmployeeDevice?employeedeviceid=${employeedeviceslist.id}" />
			<c:url var="removeUrl" value="/employee/removeEmployeeDevice?employeedeviceid=${employeedeviceslist.id}" />
			
		
		<tr>
			<td align = "center" class="center"><c:out value="${employeedeviceslist.id}" /></td>	
			<td align = "center" class="center"><c:out value="${employeedeviceslist.employee.employeeName}" /></td>
			<td align = "center" class="center"><c:out value="${employeedeviceslist.employee.employeeSurname}" /></td>
			<td align = "center" class="center"><c:out value="${employeedeviceslist.employee.employeePhone}" /></td>
			<td align = "center" class="center"><c:out value="${employeedeviceslist.employeeDeviceImei}" /></td>
			<td align = "center" class="center"><c:out value="${employeedeviceslist.employeeDeviceModel}" /></td>
			<td align = "center" class="center"><joda:format value="${employeedeviceslist.employeeDeviceStartDate}" pattern="dd/MM/yyyy"/></td>
		
			<td align = "center" class="center"><a href="${changeUrl}"><img src="../resources/images/change.png" alt="Change Device" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${removeUrl}"><img src="../resources/images/delete.png" alt="Remove Device" width="25px" height="25px" ></a></td>
						 
	
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
	<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String', 'String', 'String', 'dmydate','none', 'none']
	},
	paging: true,  
    paging_length: 100,
	col_7:"none",
	col_8:"none",
	col_width: ["40px","80px","80px","90px","80px","60px","60px","60px","60px"],
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
    grid_width: '750px',  
    grid_height: '400px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("employeedevicesTable",props);
//]]>
  </script>
	
  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
