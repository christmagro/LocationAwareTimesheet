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
    
    <h2>Edit Employee Device</h2>
<c:url var="saveUrl" value="employee/addEmployeeDevice" /> 
<form:form id="changeemployeedevice" modelAttribute="changeemployeedevice"  method="POST" action="${saveUrl}">
	<table>
		
		<tr>
			
			<td style="display:none"><form:input path="id"  value="${changeemployeedevice.id}" id="employeedeviceid" name="employeedeviceid"/></td>
		</tr>
		
		<tr>
			<td><form:label path="employeeDeviceImei">Phone IMEI:</form:label></td>
			<td><form:input path="employeeDeviceImei"  value="${changeemployeedevice.employeeDeviceImei}" id="imei" name="imei"/></td>
		</tr>
		<tr>
			<td><form:label path="employeeDeviceModel">Phone Model:</form:label></td>
			<td><form:input path="employeeDeviceModel" value="${changeemployeedevice.employeeDeviceModel}" id="model" name="model"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input id="button" type="button" value="Submit" onclick="doChangeEmployeeDevice()"></td>
		</tr>	
<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>

  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 