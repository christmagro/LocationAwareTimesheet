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
<h2>List of all Departement's Managers</h2>


<a href="addEmployeeManager">Add Manager</a>

	<table id="employeeTable">
		
		<thead>
		<tr>
		
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Name</th>
		<th align = "center" class="center">Surname</th>
		<th align = "center" class="center">Department</th>
		<th align = "center" class="center">Since</th>
		<th align = "center" class="center">Change</th>
		<th align = "center" class="center">Remove</th>
		<th align = "center" class="center"></th>
		</tr>
		</thead>
		<tbody>
		
	<c:forEach items="${employeemanagerlist}" var="employeemanagerlist">
			<c:url var="editUrl" value="/employee/editEmployeeManager?employeemanagerid=${employeemanagerlist.id}" />
			<c:url var="removeUrl" value="/employee/removeEmployeeManager?employeemanagerid=${employeemanagerlist.id}" />
			
		
		<tr>
			<td align = "center" class="center"><c:out value="${employeemanagerlist.employee.id}" /></td>	
			<td align = "center" class="center"><c:out value="${employeemanagerlist.employee.employeeName}" /></td>
			<td align = "center" class="center"><c:out value="${employeemanagerlist.employee.employeeSurname}" /></td>
			<td align = "center" class="center"><c:out value="${employeemanagerlist.department.departmentName}" /></td>
			<td align = "center" class="center"><joda:format value="${employeemanagerlist.employeeManagerStartDate}" pattern="dd/MM/yyyy"/></td>
			<td align = "center" class="center"><a href="${editUrl}"><img src="../resources/images/change.png" alt="Change Manager" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${removeUrl}"><img src="../resources/images/delete.png" alt="Remove Manager" width="25px" height="25px" ></a></td>
			<td style="display:none" width=70px><c:out value="${employeemanagerlist.id}" /></td>
						 
	
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'dmydate','String', 'String', 'String',]
	},
	paging: true,  
    paging_length: 100,
	col_7:"none",
	col_3:"select",
	col_5:"none",
	col_6:"none",
	col_width: ["40px","80px","80px","90px","80px","60px","60px","1px"],
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
    grid_width: '484px',  
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
