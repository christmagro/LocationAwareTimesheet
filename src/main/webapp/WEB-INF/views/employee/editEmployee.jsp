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

<section class="introform">

    <div class="container" align="center">
 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
 <h2>Edit employee details</h2>


<c:url var="saveUrl" value="/employee/editEmployee?id=${editEmployee.id}" /> 
<form:form id="editEmployee" modelAttribute="editEmployee"  method="POST" action="${saveUrl}">
	<table>
	
		<tr>
			<td><form:label path="employeeName">Employee Name</form:label></td>
			<td><form:input path="employeeName" value="${editEmployee.employeeName}" maxlength="40"  id="employeeName" name="employeeName"/></td>
		</tr>
				<tr>
			<td><form:label path="employeeSurname">Employee Surname</form:label></td>
			<td><form:input path="employeeSurname" value="${editEmployee.employeeSurname}" maxlength="40" id="employeeSurname" name="employeeSurname"/></td>
		</tr>
	
		<tr>
			<td><form:label path="employeeDob">Employee DOB</form:label></td>
			<td><form:input path="employeeDob" value="${dob}" id="employeeDob" name="employeeDob"/></td>
		</tr> 
		
		<tr>
		 <td><form:label path="employeeGender" >Gender</form:label></td>
        <td>
            <form:select path="employeeGender"  id="employeeGender" name="employeeGender">
            <form:option value="" label="Select" />
            <form:option value="M" label="Male" />
            <form:option value="F" label="Female" />
            </form:select>
        </td>
		</tr>
	
		<tr>
			<td><form:label path="employeePhone">Employee Phone</form:label></td>
			<td><form:input path="employeePhone" value="${editEmployee.employeePhone}" maxlength="40" id="employeePhone" name="employeePhone"/></td>
		</tr> 
		
		
		<tr>
			<td><form:label path="employeeEmail">Employee Email</form:label></td>
			<td><form:input path="employeeEmail" type="email" value="${editEmployee.employeeEmail}" maxlength="40" id="employeeEmail" name="employeeEmail"/></td>
		</tr> 
		
		<tr>
			<td><form:label path="employeeStartDate">Employee Start Date</form:label></td>
			<td><form:input path="employeeStartDate" value="${start}" id="employeeStartDate"  name="employeeStartDate"/></td>
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
 <script type="text/javascript">
 var frmvalidator  = new Validator("editEmployee");
 frmvalidator.addValidation("employeeName","req","Please enter name");
 frmvalidator.addValidation("employeeSurname","req","Please enter surname");
 frmvalidator.addValidation("employeeDob","req","Please insert date of birth");
 frmvalidator.addValidation("employeeGender","req","Please select gender");
 frmvalidator.addValidation("employeePhone","req","Please enter phone number");
 frmvalidator.addValidation("employeeStartDate","req","Please start date");
 frmvalidator.addValidation("employeeEmail","req","Please enter email address");


 </script> 

 </div>
</section>
<jsp:include page="/resources/template/footer.jsp" /> 
