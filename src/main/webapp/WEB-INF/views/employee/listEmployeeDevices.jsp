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
<h2>List of all Employee Devices</h2>


<a href="addEmployeeDevice">Add Device</a>

	<table>
		
		<thead>
		<tr>
		<td>Id</td>
		<td>Name</td>
		<td>Surname</td>
		<td>Phone No.</td>
		<td>IMEI</td>
		<td>Model</td>
		<td>Active Since</td>
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${employeedeviceslist}" var="employeedeviceslist">
			<c:url var="changeUrl" value="/employee/changeEmployeeDevice?employeedeviceid=${employeedeviceslist.id}" />
			<c:url var="removeUrl" value="/employee/removeEmployeeDevice?employeedeviceid=${employeedeviceslist.id}" />
			
		
		<tr>
			<td width=100px><c:out value="${employeedeviceslist.id}" /></td>	
			<td width=100px><c:out value="${employeedeviceslist.employee.employeeName}" /></td>
			<td width=100px><c:out value="${employeedeviceslist.employee.employeeSurname}" /></td>
			<td width=100px><c:out value="${employeedeviceslist.employee.employeePhone}" /></td>
			<td width=100px><c:out value="${employeedeviceslist.employeeDeviceImei}" /></td>
			<td width=100px><c:out value="${employeedeviceslist.employeeDeviceModel}" /></td>
			<td width=100px><joda:format value="${employeedeviceslist.employeeDeviceStartDate}" pattern="dd/MM/yyyy"/></td>
		
			<td width=90px><a href="${changeUrl}">Change Device</a></td>
			<td width=90px><a href="${removeUrl}">Remove Device</a></td>
						 
	
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	

</body>
</html>
