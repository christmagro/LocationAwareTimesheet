<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Change Employee Department</title>
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
<h2>Edit Employee Department</h2>


<c:url var="saveUrl" value="/employee/editEmployeeDepartment?id=${employeedepartment.id}" /> 
<form:form id="editEmployeeDepartment"  modelAttribute="employeedepartment"   method="POST" action="${saveUrl}">
			
			<form:hidden path="" value="${employee.id}" id="employeeId" name="employeeId"/>
			Employee Name: ${employee.employeeName} ${employee.employeeSurname}<br/>
			
			Employee Current Department: ${department.departmentName}<br/>
			
			Employee Current ID: ${department.id}<br/>
			Select New Department <br/>       
            <form:select path="" id="departmentList" name="departmentList">
            <form:option value="" label="Select" />
            <form:options  items="${departmentList}" itemValue="Id" itemLabel="departmentName" />
            </form:select><br/>
        
			
	
	
	<input type="submit" value="Save" />
</form:form>

  <script>
  $(document).ready(function() {
    $("#employeeDob").datepicker({ dateFormat: 'dd/mm/yy' });
  });
 </script>
   <script>
  $(document).ready(function() {
    $("#employeeStartDate").datepicker({ dateFormat: 'dd/mm/yy' });
  });
 </script>


</body>
</html>
