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
<h2>Employee Details</h2>

<a href="addEmpAddress?employeeid=${employeeid}">Add Address</a>



	<table id="employeeaddressTable">
		
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Address 1</th>
		<th align = "center" class="center">Address 2</th>
		<th align = "center" class="center">Locality</th>
		<th align = "center" class="center">Edit Address</th>
		<th align = "center" class="center">Remove Address</th>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${empaddresslist}" var="empaddresslist">
			<c:url var="editAddress" value="editEmpAddress?empaddressid=${empaddresslist.id}" />
			<c:url var="removeAddress" value="removeEmpAddress?empaddressid=${empaddresslist.id}" />
		
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${empaddresslist.id}" /></td>	
			<td align = "center" class="center"><c:out value="${empaddresslist.empAddress1}" /></td>
			<td align = "center" class="center"><c:out value="${empaddresslist.empAddress2}" /></td>
			<td align = "center" class="center"><c:out value="${empaddresslist.locality.localityName}" /></td>
			<td align = "center" class="center"><a href="${editAddress}"><img src="../resources/images/edit.png" alt="Edit Employee Address" width="25px" height="25px" ></a></td>
			<td align = "center" class="center"><a href="${removeAddress}"><img src="../resources/images/delete.png" alt="Remove Address" width="25px" height="25px" ></a></td>
				</tr>
	</c:forEach>
	</tbody>
		
	</table>
	<script language="JavaScript" type="text/javascript">
//<![CDATA[	
	var props = {
	
	sort_config: { 
		async_sort:true, 
		sort_types:['Number', 'String', 'String', 'String', 'none', 'none']
	},
	paging: true,  
    paging_length: 100,
	col_5:"none",
	col_4:"none",
	col_width: ["40px","80px","80px","70px", "60px","60px","1px"],
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
    grid_width: '400px',  
    grid_height: '100px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("employeeaddressTable",props);
//]]>
  </script>

  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
