<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>Create New Courier</h2>




<c:url var="saveUrl" value="/employee//addemployee" /> 
<form:form id="addEmployee" modelAttribute="addEmployee" method="POST" action="${saveUrl}">
	<table>
	
		<tr>
			<td><form:label path="employeeName">Employee Name</form:label></td>
			<td><form:input path="employeeName"  id="employeeName" name="employeeName"/></td>
		</tr>
				<tr>
			<td><form:label path="employeeSurname">Employee Surname</form:label></td>
			<td><form:input path="employeeSurname"  id="employeeSurname" name="employeeSurname"/></td>
		</tr>
		
		<tr>
			<td><form:label path="employeeDob">Employee DOB</form:label></td>
			<td><form:input path="employeeDob" id="date" value="<%= df.format(new java.util.Date()) %>" name="employeeDob"/></td>
		</tr> 
		
		<tr>
		 <td><form:label path="employeeGender">Gender</form:label></td>
        <td>
            <form:select path="employeeGender" id="employeeGender" name="employeeGender">
            <form:option value="" label="Select" />
            <form:option value="M" label="Male" />
            <form:option value="F" label="Female" />
            </form:select>
        </td>
		</tr>
		<tr>
			<td><form:label path="employeePhone">Employee Phone</form:label></td>
			<td><form:input path="employeePhone"  id="employeePhone" name="employeePhone"/></td>
		</tr> 
		
		<tr>
			<td><form:label path="employeeStartDate">Employee Start Date</form:label></td>
			<td><form:input path="employeeStartDate" id="date" value="<%= df.format(new java.util.Date()) %>" name="employeeStartDate"/></td>
		</tr>
					
		
	</table>
	
	<input type="submit" value="Save" />
</form:form>

  <script>
  $(document).ready(function() {
    $("#date").datepicker({ dateFormat: 'dd/mm/yy' });
  });
 </script>


</body>
</html>