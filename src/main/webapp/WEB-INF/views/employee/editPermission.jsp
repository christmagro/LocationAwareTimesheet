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
<h2>Rename Permission</h2>

<c:url var="saveUrl" value="/employee/editPermission" /> 
<form:form id="${editPermission}" modelAttribute="editPermission"  method="POST" action="${saveUrl}">
	<table>
	<tr>
			
			<td style="display:none"><input  value="${editPermission.id}" id="permissionid" name="permissionid"/></td>
		</tr>
	
		<tr>
			<td><form:label path="permissionName">Permission Name:</form:label></td>
			<td><form:input path="permissionName" value="${editPermission.permissionName}" id="permissionName" name="permissionName"/></td>
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
