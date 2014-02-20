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
		<script type="text/javascript" src="../resources/js/changeemployeedevice.js"></script>
		<script>
 		 function preventBack(){window.history.forward();}
 		 setTimeout("preventBack()", 0);
  		 window.onunload=function(){null};
		</script>
	
</head>
<body>




<c:url var="saveUrl" value="employee/addEmployeeDevice" /> 
<form:form id="changeemployeedevice" modelAttribute="changeemployeedevice"  method="POST" action="${saveUrl}">
	<table>
		
		<tr>
			
			<td style="display:none"><form:input path="id"  value="${changeemployeedevice.id}" id="employeedeviceid" name="employeedeviceid"/></td>
		</tr>
		
		<tr>
			<td><form:label path="employeeDeviceImei">Phone IMEI</form:label></td>
			<td><form:input path="employeeDeviceImei"  value="${changeemployeedevice.employeeDeviceImei}" id="imei" name="imei"/></td>
		</tr>
		<tr>
			<td><form:label path="employeeDeviceModel">Phone Model</form:label></td>
			<td><form:input path="employeeDeviceModel" value="${changeemployeedevice.employeeDeviceModel}" id="model" name="model"/></td>
		</tr>
		

<tr><td><input id="button" type="button" value="Submit" onclick="doAjaxPost()"></td></tr>	
<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>

</body>
</html>
