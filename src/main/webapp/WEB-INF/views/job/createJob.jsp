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
<h2>Add a Job for ${client.clientName} </h2>
<c:url var="saveUrl" value="/job/createJob" /> 
<form:form id="createJob" modelAttribute="createJob"  method="POST" action="${saveUrl}">
	<table>
	
	
		<tr>
		 <td><form:label path="">Select Client Address</form:label></td>
        <td>
            <form:select path="" id="clientdetailsid" name="clientdetailsid">
            <form:option value="" label="Select" />
            <c:forEach var="clientdetailslist" items="${clientdetailslist}">
        	<form:option value="${clientdetailslist.id}"><c:out value="${clientdetailslist.clientDetailsAddress1}, ${clientdetailslist.clientDetailsAddress2}, ${clientdetailslist.locality.id}"/></form:option>
    		</c:forEach>
            </form:select>
        </td>
		</tr> 
		
		<tr>
			<td><form:label path="">Set Appointment</form:label></td>
			<td><form:input path="" type="text" name="jobAppointment"  id="jobAppointment" /></td>
		</tr>
	
	
		<tr>
			<td><form:label path="">Job Description</form:label></td>
			<td><form:input path=""  id="jobDescription" name="jobDescription"/></td>
		</tr>

		
		<tr>
			<td><form:label path="">Remarks</form:label></td>
			<td><form:input path=""  id="jobRemarks" name="jobRemarks"/></td>
		</tr>
		
			
		
		<tr>
		 <td><form:label path="">Select Department</form:label></td>
        <td>
            <form:select path="" id="departmentid" name="departmentid">
            <form:option value="" label="Select" />
            <form:options  items="${departmentlist}" itemValue="Id" itemLabel="departmentName" />
            </form:select>
        </td>
		</tr> 
		
		
	</table>
	
	<input type="submit" value="Save" />
	
	
</form:form>
	<script type="text/javascript">
	$(function(){
		$('*[name=jobAppointment]').appendDtpicker({
			"dateFormat": "DD/MM/YYYY h:m"
		});
	});
	</script>


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 