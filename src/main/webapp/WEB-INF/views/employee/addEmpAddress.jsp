<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create Employee</title>
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


<c:url var="saveUrl" value="addEmpAddress?employeeid=${employeeid}" /> 
<form:form id="addEmpAddress" modelAttribute="addEmpAddress"  method="POST" action="${saveUrl}">
	<table>
		
		<tr>
			<td><form:label path="empAddress1">Address 1</form:label></td>
			<td><form:input path="empAddress1"  id="empAddress1" name="empAddress1"/></td>
		</tr>
				<tr>
			<td><form:label path="empAddress2">Address 2</form:label></td>
			<td><form:input path="empAddress2"  id="empAddress2" name="empAddress2"/></td>
		</tr>
	
		
	
		<tr>
		 <td>Locality</td>
        <td>
            <form:select path="" id="elocality" name="elocality">
            <form:option value="" label="Select" />
            <form:options  items="${elocality}" itemValue="Id" itemLabel="localityName" />
            </form:select>
        </td>
		</tr> 
		<tr>
		
	
	
	
		
	</table>
	
	<input type="submit" value="Save" />
</form:form>


</body>
</html>
