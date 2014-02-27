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
		
	</table>
	
	<input type="submit" value="Save" />
</form:form>



</body>
</html>
