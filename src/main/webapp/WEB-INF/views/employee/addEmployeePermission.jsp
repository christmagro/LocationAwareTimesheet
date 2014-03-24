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

<c:url var="saveUrl" value="addEmployeePermission" /> 
<form:form id="addEmployeePermission" modelAttribute="addEmployeePermission"  method="POST" action="${saveUrl}">
	<table>
			
		<tr>
		 <td> <form:label path="" >Select Permission:</form:label></td>
		 
        <td>
            <form:select path="" id="permissionid" name="permissionid">
            <form:option value="" label="Select" />
            <form:options  items="${permissionlist}" itemValue="Id" itemLabel="permissionName" />
            </form:select>
        </td>
       <td style="display:none"><input value="${employeeid}" id="employeeid" name="employeeid"></td>
		</tr> 
	
		<tr>
		<td></td>
		<td><input id="button" type="button" value="Submit" onclick="doCheckEmployeePermission()"></td>
		</tr>		

<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
