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

<jsp:include page="/resources/template/header.jsp" /> 

<section>
    <div class="container" align="center">
 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
 <h2>Create a new employee</h2>


<c:url var="saveUrl" value="/employee/addEmployee" /> 
<form:form id="addEmployee" modelAttribute="addEmployee"  method="POST" action="${saveUrl}">
	<table>
	
		<tr>
		<td colspan="2" align="center">Employee Details</td>
		</tr>
	
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
			<td><form:input path="employeeDob" id="employeeDob" value="<%= df.format(new java.util.Date()) %>" name="employeeDob"/></td>
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
			<td><form:input path="employeeStartDate" id="employeeStartDate" value="<%= df.format(new java.util.Date()) %>" name="employeeStartDate"/></td>
		</tr>
	
			<tr>
		<td colspan="2" align="center">Employee Address Details</td>
		</tr>
		
			<tr>
			<td><form:label path="">Address 1</form:label></td>
			<td><input id="employeeaddress12" name="employeeaddress1"/></td>
		</tr>
			<tr>
			<td><form:label path="">Address 2</form:label></td>
			<td><input id="employeeaddress22" name="employeeaddress2"/></td>
		</tr>
		
		<tr>
		<td><form:label path="">Locality</form:label></td>
        <td>
            <form:select path="" id="elocality" name="elocality">
            <form:option value="" label="Select" />
            <form:options  items="${elocality}" itemValue="Id" itemLabel="localityName" />
            </form:select>
        </td>
		</tr> 
		<tr>
		<td><form:label path="">Select Department</form:label></td>
        <td>
            <form:select path="" id="edepartment" name="edepartment">
            <form:option value="" label="Select" />
            <form:options  items="${edepartment}" itemValue="Id" itemLabel="departmentName" />
            </form:select>
        </td>
		</tr> 
	
	
		
		
		
			<tr>
		<td colspan="2" align="center">System Details</td>
		</tr>
		
		<tr>
			<td><form:label path="employeeUsername">Employee Username</form:label></td>
			<td><form:input path="employeeUsername"  id="employeeUsername" name="employeeUsername"/></td>
		</tr> 
		<tr>
			<td><form:label path="employeePassword">Employee Password</form:label></td>
			<td><form:input path="employeePassword" type="password" id="employeePassword" name="employeePassword"/></td>
		</tr>  
		
		<tr>
			<td><form:label path="employeeEmail">Employee E-Mail</form:label></td>
			<td><form:input path="employeeEmail"  id="employeePassword" name="employeeEmail"/></td>
		</tr> 
		
		
	
		
	</table>
	
	<input type="submit" value="Save" />
</form:form>

<script type="text/javascript">
	$(function(){
		$('*[name=employeeDob]').appendDtpicker({
			"dateFormat": "DD/MM/YYYY",
			"dateOnly": true,
			"closeOnSelected":true
		});
			
	});
	</script>
	<script type="text/javascript">
	$(function(){
		$('*[name=employeeStartDate]').appendDtpicker({
			"dateFormat": "DD/MM/YYYY",
			"dateOnly": true,
			"closeOnSelected":true
		});
		});
	</script>




 </div>
</section>
<jsp:include page="/resources/template/footer.jsp" /> 
