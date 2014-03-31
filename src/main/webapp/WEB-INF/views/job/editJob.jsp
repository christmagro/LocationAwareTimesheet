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
<h2>Edit Job for ${client.clientName} </h2>
<c:url var="saveUrl" value="/job/editJob?jobId=${editjob.id}" /> 
<form:form id="editjob" modelAttribute="editjob"  method="POST" action="${saveUrl}">
	<table>
	
	
	
		<tr>
			<td><form:label path="">Job ID:</form:label></td>
			<td><form:label path="" >${editjob.id}</form:label></td>
	
		</tr>
		<tr>
			<td><form:label path="">Set Appointment</form:label></td>
			<td><form:input path="" value="${editjob.jobAppointmentDatetime}" type="text" name="jobAppointment"  id="jobAppointment" /></td>
		</tr>
	
	
		<tr>
			<td><form:label path="">Job Description</form:label></td>
			<td><form:input path="" value="${editjob.jobDescription}" maxlength="40"  id="jobDescription" name="jobDescription"/></td>
		</tr>

		
		<tr>
			<td><form:label path="">Remarks</form:label></td>
			<td><form:input path="" value="${editjob.jobRemarks}"  maxlength="40" id="jobRemarks" name="jobRemarks"/></td>
		</tr>
		
			
		
		<tr>
		 <td><form:label path="">Select Department</form:label></td>
        <td>
            <form:select path="" id="departmentid" name="departmentid">
            <form:option value="${department.id}" label="${department.departmentName}" />
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
			"dateFormat": "DD/MM/YYYY h:mm",
			"closeOnSelected":true
		});
	});
	</script>
<script type="text/javascript">
 var frmvalidator  = new Validator("editjob");

 frmvalidator.addValidation("jobAppointment","req","Please set appointment date");
 frmvalidator.addValidation("jobDescription","req","Please insert job descrpition");
 frmvalidator.addValidation("jobRemarks","req","Please insert job remarks");
 frmvalidator.addValidation("departmentid","req","Please select department");
 </script>

  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 