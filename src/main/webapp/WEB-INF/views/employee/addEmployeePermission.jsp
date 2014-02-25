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
		
		
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/ajaxfunctions.js"></script>
		
	
</head>
<body>




<c:url var="saveUrl" value="addEmployeePermission" /> 
<form:form id="addEmployeePermission" modelAttribute="addEmployeePermission"  method="POST" action="${saveUrl}">
	<table>
			
		<tr>
		 <td>Select Permission</td>
		 
        <td>
            <form:select path="" id="permissionid" name="permissionid">
            <form:option value="" label="Select" />
            <form:options  items="${permissionlist}" itemValue="Id" itemLabel="permissionName" />
            </form:select>
        </td>
       <td style="display:none"><input value="${employeeid}" id="employeeid" name="employeeid"></td>
		</tr> 
	


<tr><td><input id="button" type="button" value="Submit" onclick="doCheckEmployeePermission()"></td></tr>		
<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>

</body>
</html>
