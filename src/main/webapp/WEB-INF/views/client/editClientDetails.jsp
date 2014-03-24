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
<h2>Edit contact for ${client.clientName} </h2>

<c:url var="saveUrl" value="/client/editClientDetails?clientdetailsid=${editclientdetails.id}" /> 
<form:form id="editclientdetails" modelAttribute="editclientdetails"  method="POST" action="${saveUrl}">
	<table>
	
		<tr>
			<td><form:label path="">Name</form:label></td>
			<td><form:input path="" value="${editclientdetails.clientDetailsContactName}" id="contactName" name="contactName"/></td>
		</tr>
		<tr>
			<td><form:label path="">Surname.</form:label></td>
			<td><form:input path="" value="${editclientdetails.clientDetailsContactSurname}" id="contactSurname" name="contactSurname"/></td>
		</tr>
		<tr>
			<td><form:label path="">Contact Description</form:label></td>
			<td><form:input path="" value="${editclientdetails.clientDetailsContactDescription}" id="contactDescription"  name="contactDescription"/></td>
		</tr>
		
		<tr>
			<td><form:label path="">Address1</form:label></td>
			<td><form:input path="" id="contactAddress1" value="${editclientdetails.clientDetailsAddress1}" name="contactAddress1"/></td>
		</tr>
		<tr>
			<td><form:label path="">Address2</form:label></td>
			<td><form:input path="" id="contactAddress2" value="${editclientdetails.clientDetailsAddress2}"  name="contactAddress2"/></td>
		</tr>
		
					
		<tr>
		 <td><form:label path="">Locality</form:label></td>
        <td>
            <form:select path="" id="localityid" name="localityid">
            <form:option value="${locality.id}" label="${locality.localityName}" />
            <form:options  items="${localitylist}" itemValue="Id" itemLabel="localityName" />
            </form:select>
        </td>
		</tr> 
		
	<tr>
			<td><form:label path="">Contact Phone</form:label></td>
			<td><form:input path="" value="${editclientdetails.clientDetailsContactPhone}" id="contactPhone" name="contactPhone"/></td>
		</tr> 
		<tr>
			<td><form:label path="">Contact Email</form:label></td>
			<td><form:input path="" value="${editclientdetails.clientDetailsContactEmail}" id="contactEmail" name="contactEmail"/></td>
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
