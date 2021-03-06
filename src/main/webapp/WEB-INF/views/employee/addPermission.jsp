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
<h2>Add Permission</h2>

<c:url var="saveUrl" value="/employee/addPermission" /> 
<form:form id="addPermission" modelAttribute="addPermission"  method="POST" action="${saveUrl}">
	<table>
	
		<tr>
			<td><form:label path="permissionName">Permission Name:</form:label></td>
			<td><form:input path="permissionName"  id="permissionName" name="permissionName"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Save" /></td>
		</tr>
		
		
	</table>
	
	
</form:form>
 <script type="text/javascript">
 var frmvalidator  = new Validator("addPermission");
 frmvalidator.addValidation("permissionName","req","Please insert permission name");

 </script> 
  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
