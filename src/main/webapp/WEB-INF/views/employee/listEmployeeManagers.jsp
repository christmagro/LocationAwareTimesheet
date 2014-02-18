<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>List Employee Managers</title>
	<!-- Scripts -->
		<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
</head>
<body>

 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h2>List of all Departement's Managers</h2>


<a href="addEmployeeManager">Add Manager</a>

	<table>
		
		<thead>
		<tr>
		<td>Id</td>
		<td>Name</td>
		<td>Surname</td>
		<td>Department Name</td>
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeemanagerlist}" var="employeemanagerlist">
			<c:url var="editUrl" value="/employee/editEmployeeManager?employeemanagerid=${employeemanagerlist.id}" />
			<c:url var="removeUrl" value="/employee/removeEmployeeManager?employeemanagerid=${employeemanagerlist.id}" />
			
		
		<tr>
			<td width=100px><c:out value="${employeemanagerlist.employee.id}" /></td>	
			<td width=100px><c:out value="${employeemanagerlist.employee.employeeName}" /></td>
			<td width=100px><c:out value="${employeemanagerlist.employee.employeeSurname}" /></td>
			<td style="display:none" width=70px><c:out value="${employeemanagerlist.id}" /></td>
			<td width=70px><c:out value="${employeemanagerlist.department.departmentName}" /></td>
			<td width=90px><a href="${editUrl}">Change Manager</a></td>
			<td width=90px><a href="${removeUrl}">Remove Manager</a></td>
						 
	
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	

</body>
</html>
