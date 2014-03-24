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
    
    <h2>Add Employee Device</h2>
<c:url var="saveUrl" value="employee/addEmployeeDevice" /> 
<form:form id="addemployeedevice" modelAttribute="addemployeedevice"  method="POST" action="${saveUrl}">
	<table>
	
		
		<tr>
		 <td>Select Employee</td>
        <td>
            <form:select path="" id="employeeid" name="employeeid">
            <form:option value="" label="Select" />
            <c:forEach var="employee" items="${employeelist}">
        	<form:option value="${employee.id}"><c:out value="${employee.employeeName} ${employee.employeeSurname}"/></form:option>
    		</c:forEach>
            </form:select>
        </td>
		</tr> 
		<tr>
			<td><form:label path="employeeDeviceImei">Phone IMEI</form:label></td>
			<td><form:input path="employeeDeviceImei"  id="imei" name="imei"/></td>
		</tr>
		<tr>
			<td><form:label path="employeeDeviceModel">Phone Model</form:label></td>
			<td><form:input path="employeeDeviceModel"  id="model" name="model"/></td>
		</tr>
		

		<tr>
			<td></td>
			<td><input id="button" type="button" value="Submit" onclick="doAddEmployeeDevice()"></td>
		</tr>	
<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>



  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
