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
<h2>List of closed Jobs for  ${employee.employeeName} ${employee.employeeSurname}</h2>


	<table id="jobdepartmentupdateTable">
		
		<thead>
		<tr>
		<th  align = "center" class="center">Id</th>
		<th align = "center" class="center">Company</th>
		<th align = "center" class="center">Address</th>
		<th align = "center" class="center">Locality</th>
		<th align = "center" class="center">Job Description</th>
		<th align = "center" class="center">Job Remarks</th>
		<th align = "center" class="center">Appointment Date</th>
		<th align = "center" class="center">Department</th>
		<th align = "center" class="center">Map</th>
		<th align = "center" class="center">Print Timesheet</th>
		
	
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${jdulist}" var="jdulist">
			<c:url var="viewMap" value="/json/mapcoordinates?jobid=${jdulist.job.id}" />
			<c:url var="printTimeSheet" value="/json/TimeSheet?jobid=${jdulist.job.id}" />
		
		
		
		<tr>
			
			<td align = "center" class="center"><c:out value="${jdulist.job.id}" /></td>	
			<td align = "center" class="center"><c:out value="${jdulist.client.clientName}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.clientdetails.clientDetailsAddress1}, ${jdulist.clientdetails.clientDetailsAddress2}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.locality.localityName}" /></td> 
			
			<td align = "center" class="center"><c:out value="${jdulist.job.jobDescription}" /></td>
			<td align = "center" class="center"><c:out value="${jdulist.job.jobRemarks}" /></td>
			<td align = "center" class="center"><joda:format value="${jdulist.job.jobAppointmentDatetime}" pattern="dd/MM/yyyy HH:mm"/></td>
			<td align = "center" class="center"><c:out value="${jdulist.department.departmentName}" /></td> 
			<td align = "center" class="center"><a href="${viewMap}"><img src="../resources/images/map.ico" alt="View on Map" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${printTimeSheet}"><img src="../resources/images/printer.png" alt="Print Timesheet" width="25px" height="25px" ></a></td>
			
			
			
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String', 'String','dmy','String', 'none','none']
	},
	paging: true,  
    paging_length: 100,
    col_9:"none",
    col_8:"none",
   	col_width: ["20px","40px","40px","30px","70px","70px","40px","40px","20px","20px"],
	results_per_page: ['# rows per page',[10,100]], 
    rows_counter: true,  
    rows_counter_text: "Rows:",  
    btn_reset: true,  
    loader: true,  
    loader_html: '<h5 style="color:black;">Loading, please wait...</h5>',  
	alternate_rows: true,
	paging: true,  
   	on_keyup: true,  
    on_keyup_delay: 500,  
    
    selectable: true,  
    editable: true,  
    
  
    //Grid layout properties  
    grid_layout: true,  
    grid_width: '1155px',  
    grid_height: '450px',  
  
    grid_enable_cols_resizer: false, //disables columns resizing  
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("jobdepartmentupdateTable",props);
//]]>
  </script>

  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
