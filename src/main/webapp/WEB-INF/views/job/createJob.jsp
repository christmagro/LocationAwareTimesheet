<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create New Job</title>
	<!-- Scripts -->
		<!-- <script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script> -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="../resources/css/jquery.simple-dtpicker.css" rel="stylesheet" />
</head>
<body>

 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>

<c:url var="saveUrl" value="/job/createJob" /> 
<form:form id="createJob" modelAttribute="createJob"  method="POST" action="${saveUrl}">
	<table>
	
	
		<tr>
		 <td>Select Client Address</td>
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
			<td><form:label path="">Set Date and Time for Appointment</form:label></td>
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
		 <td>Select Department</td>
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




</body>
</html>
