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
<h2>List of Permissions</h2>

<a href="addPermission">Add Permission</a>



	<table id="permissionTable">
		
		<thead>
		<tr>
		<th align = "center" class="center">Id</th>
		<th align = "center" class="center">Permission</th>
		<th align = "center" class="center">Permission</th>
		<th align = "center" class="center">Rename Permission</th>
		<th align = "center" class="center">Enable/Disable</th>
		
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${permissionlist}" var="permissionlist">
			<c:url var="editPermission" value="/employee/editPermission?permissionid=${permissionlist.id}" />
			<c:url var="disablePermission" value="/employee/disablePermission?permissionid=${permissionlist.id}" />
			<c:url var="enablePermission" value="/employee/enablePermission?permissionid=${permissionlist.id}" />
		
		
		<tr>
			<td align = "center" class="center"><c:out value="${permissionlist.id}" /></td>	
			<td align = "center" class="center"><c:out value="${permissionlist.permissionName}" /></td>
			<td align = "center" class="center">
			<c:if test="${permissionlist.isPermissionEnable()==true}">Active</c:if>
			<c:if test="${permissionlist.isPermissionEnable()==false}">Inactive</c:if>
			</td>
			<td align = "center" class="center"><a href="${editPermission}"><img src="../resources/images/edit.png" alt="Edit Permission" width="25px" height="25px" ></a> </td>
			
			<td align = "center" class="center">
			<c:if test="${permissionlist.isPermissionEnable()==true}"><a href="${disablePermission}"><img src="../resources/images/enable.png" alt="Disable Permission" width="25px" height="25px" ></a></c:if>
			<c:if test="${permissionlist.isPermissionEnable()==false}"><a href="${enablePermission}"><img src="../resources/images/disable.png" alt="Enable Permission" width="25px" height="25px" ></a></c:if>
			</td>
			
			
		
			 
			
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
	paging: true,  
    paging_length: 100,
	//col_4:"Select",
	col_2:"none",
	col_3:"none",
	col_4:"none",
	col_width: ["40px", "50px","30px","30px","50px"],
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
    grid_height: '200px',
      
    /*** Extensions manager ***/  
    
    btn_showHide_cols_text: 'Columns▼' 
				
	
		
	}
	var tf = setFilterGrid("permissionTable",props);
 </script>


</body>
</html>
