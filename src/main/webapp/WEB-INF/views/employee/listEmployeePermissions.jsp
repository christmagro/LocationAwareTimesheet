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
<h2>List of Permissions for ${employee.employeeName} ${employee.employeeSurname} </h2>

<a href="addEmployeePermission?employeeid=${employee.id}">Add Permission for ${employee.employeeName} ${employee.employeeSurname}</a>



	<table id="permissionTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Permission</th>
		<th align = "center" class="center">Remove</th>
	
		
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeepermissionlist}" var="employeepermissionlist">
			<c:url var="removeEmpPerm" value="/employee/removeEmployeePermission?employeepermissionid=${employeepermissionlist.id}" />
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${employeepermissionlist.id}" /></td>	
			<td align = "center" class="center"><c:out value="${employeepermissionlist.permission.permissionName}" /></td>
			<td align = "center" class="center"><a href="${removeEmpPerm}"><img src="../resources/images/disable.png" alt="Remove permission" width="25px" height="25px" ></a></td>
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
<script language="JavaScript" type="text/javascript">

	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'none', 'none', 'none']
	},
	  
    paging_length: 100,
	//col_4:"Select",
	col_2:"none",
	col_3:"none",
	col_4:"none",
	col_width: ["40px","100px","80px"],
     
    btn_reset: true,  
    loader: true,  
    loader_html: '<h5 style="color:black;">Loading, please wait...</h5>',  
	alternate_rows: true,
	
    paging_length: 10,
	on_keyup: true,  
    on_keyup_delay: 500,  
  	selectable: true,  
    editable: true,  
      
    //Grid layout properties  
    grid_layout: true,  
    grid_width: '230px',  
    grid_height: '100px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("permissionTable",props);
 </script>


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
