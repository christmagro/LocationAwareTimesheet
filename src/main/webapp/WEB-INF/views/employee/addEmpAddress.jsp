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

<h2>Add Employee Address</h2>
<c:url var="saveUrl" value="addEmpAddress?employeeid=${employeeid}" /> 
<form:form id="addEmpAddress" modelAttribute="addEmpAddress"  method="POST" action="${saveUrl}">
	<table>
		
		<tr>
			<td><form:label path="empAddress1">Address 1:</form:label></td>
			<td><form:input path="empAddress1" maxlength="40" id="empAddress1" name="empAddress1"/></td>
		</tr>
				<tr>
			<td><form:label path="empAddress2">Address 2:</form:label></td>
			<td><form:input path="empAddress2" maxlength="40" id="empAddress2" name="empAddress2"/></td>
		</tr>
	
		
	
		<tr>
		 <td><form:label path="">Locality</form:label></td>
        <td>
            <form:select path="" id="elocality" name="elocality">
            <form:option value="" label="Select" />
            <form:options  items="${elocality}" itemValue="Id" itemLabel="localityName" />
            </form:select>
        </td>
		</tr> 
		<tr>
		<td></td>
		<td><input type="submit" value="Save" /></td>
		</tr>
	
	
	
		
	</table>
	
	
</form:form>
 <script type="text/javascript">
 var frmvalidator  = new Validator("addEmpAddress");
 frmvalidator.addValidation("empAddress1","req","Please insert address1");
 frmvalidator.addValidation("empAddress2","req","Please insert address2");
 frmvalidator.addValidation("elocality","req","Please select locality");
 </script> 
  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" />
