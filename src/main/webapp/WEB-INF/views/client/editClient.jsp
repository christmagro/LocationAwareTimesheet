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
<h2>Edit Client</h2>

<c:url var="saveUrl" value="/client/editClient?clientid=${editclient.id}" /> 
<form:form id="editclient" modelAttribute="editclient"  method="POST" action="${saveUrl}">
	<table>
		
		
		<tr>
			<td><form:label path="clientName">Company Name</form:label></td>
			<td><form:input path="clientName"  value="${editclient.clientName}" id="clientName" name="clientName"/></td>
		</tr>
		<tr>
			<td><form:label path="clientVat">Company Vat No.</form:label></td>
			<td><form:input path="clientVat" value="${editclient.clientVat}" id="clientVat" name="clientVat"/></td>
		</tr>
		
		<tr>
			<td><form:label path="clientPhone">Company Phone.</form:label></td>
			<td><form:input path="clientPhone" value="${editclient.clientPhone}" id="clientPhone" name="clientPhone"/></td>
		</tr>
		
		<tr>
			<td><form:label path="clientWebsite">Company Website.</form:label></td>
			<td><form:input path="clientWebsite" value="${editclient.clientWebsite}"  id="clientWebsite" name="clientWebsite"/></td>
		</tr>
		<tr>
		<td></td>
		<td><input type="submit" value="Save" /></td>
		</tr>
		
	</table>
	
	
</form:form>


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
