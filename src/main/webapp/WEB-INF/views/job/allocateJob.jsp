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

<c:url var="saveUrl" value="/job//allocateJob?jobupdateid=${jobupdateid}" /> 
<form:form id="allocateJob" modelAttribute="allocateJob"  method="POST" action="${saveUrl}">
	<table>
	
	
		<tr>
		 <td>Select Employee</td>
        <td>
            <form:select path="" id="employeeid" name="employeeid">
            <form:option value="" label="Select" />
            <c:forEach var="employeelist" items="${employeelist}">
        	<form:option value="${employeelist.id}"><c:out value="${employeelist.employeeName} ${employeelist.employeeSurname}"/></form:option>
    		</c:forEach>
            </form:select>
        </td>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Save" /></td>
		</tr>
	</table>
	
	
	
</form:form>
	
 <script type="text/javascript">
 var frmvalidator  = new Validator("allocateJob");
 frmvalidator.addValidation("employeeid","req","Please select an employee");

 </script> 
</div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 

