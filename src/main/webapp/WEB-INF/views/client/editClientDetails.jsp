<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create New Client</title>
	<!-- Scripts -->
		<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
</head>
<body>

 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>


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
		 <td>Locality</td>
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
	
	</table>
	
	<input type="submit" value="Save" />
</form:form>



</body>
</html>
