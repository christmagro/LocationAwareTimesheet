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
<h2>List of Employees</h2>

<a href="addEmployee">Add Employee</a>



	<table>
		
		<thead>
		<tr>
		<td>Id</td>
		<td>Name</td>
		<td>Surname</td>
		<td>Date of Birth</td>
		<td>Gender</td>
		<td>Phone</td>
		<td>Email</td>
		<td>Start Date</td>
		<td>Department</td>
		<td>Edit Employee</td>
		<td>View Addresses</td>
		<td>Change Department</td>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeelist}" var="employeelist">
			<c:url var="editEmployee" value="/employee/editEmployee?id=${employeelist.employee.id}" />
			<c:url var="changeDept" value="/employee/editEmployeeDepartment?id=${employeelist.employee.id}" />
			<c:url var="viewAddresses" value="/employee/listEmpAddresses?employeeid=${employeelist.employee.id}" />
		
		
		<tr>
			<td width=100px><c:out value="${employeelist.employee.id}" /></td>	
			<td width=100px><c:out value="${employeelist.employee.employeeName}" /></td>
			<td width=100px><c:out value="${employeelist.employee.employeeSurname}" /></td>
			<td width=70px><joda:format value="${employeelist.employee.employeeDob}" pattern="dd/MM/yyyy"/></td>
			<td width=70px><c:out value="${employeelist.employee.employeeGender}" /></td>
			<td width=70px><c:out value="${employeelist.employee.employeePhone}" /></td>
			<td width=70px><c:out value="${employeelist.employee.employeeEmail}" /></td>
			<td width=70px><joda:format value="${employeelist.employee.employeeStartDate}" pattern="dd/MM/yyyy"/></td>
			<td width=70px><c:out value="${employeelist.department.departmentName}" /></td>
			<td width=90px><a href="${editEmployee}">Edit Employee</a></td>
			<td width=90px><a href="${viewAddresses}">View Addresses</a></td>
			<td width=90px><a href="${changeDept}">Change Department</a></td>
		
			 
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	


</body>
</html>
