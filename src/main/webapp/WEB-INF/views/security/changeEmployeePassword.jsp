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
    
    <h2>Edit Employee Device</h2>
<c:url var="saveUrl" value="/security/chgPassword?employeeid=${employee.id}" /> 
<form:form id="employee" modelAttribute="employee"  method="POST"  action="${saveUrl}">
	<table>
		
		<tr>
			
			<td style="display:none"><form:input path="id"  value="${changeemployeedevice.id}" id="employeedeviceid" name="employeedeviceid"/></td>
		</tr>
		
		<tr>
			<td><form:label path="">Username:</form:label></td>
			<td><form:label path="">${employee.employeeUsername}</form:label></td>
			
				
		<tr>
			<td><form:label path="">Password</form:label></td>
			<td><form:input path="" type="password" id="pwd1" name="pwd1" /></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><input  type="password" id="pwd2" name="pwd2"/></td>
		</tr>
		
		
	

		</table>
	
	<input id="button" type="submit" value="Save" />
</form:form>
<script type="text/javascript">
 var frmvalidator  = new Validator("employee");
 frmvalidator.addValidation("pwd1","req","Password cannot be empty");
 frmvalidator.setAddnlValidationFunction(DoCustomValidation);
 function DoCustomValidation()
 {
   var frm = document.forms["employee"];
   if(frm.pwd1.value != frm.pwd2.value)
   {
     sfm_show_error_msg('The Password and verified password do not match!',frm.pwd1);
     return false;
   }
   else
   {
     return true;
   }
 }

 </script>
 

 


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 