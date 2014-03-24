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
<h2>Edit Employee Department</h2>


<c:url var="saveUrl" value="/employee/editEmployeeDepartment?id=${employeedepartment.id}" />
	<table> 
<form:form id="editEmployeeDepartment"  modelAttribute="employeedepartment"   method="POST" action="${saveUrl}">
		
			<form:hidden path="" value="${employee.id}" id="employeeId" name="employeeId"/>
			<tr>
			<td>Employee Name:</td> 
			<td>${employee.employeeName} ${employee.employeeSurname}</td>
			</tr>
			<tr>
			<td>Current Department:</td>
			<td>${department.departmentName}</td>
			</tr>
			<tr>
			<td>Employee Current ID:</td>
			<td> ${department.id}</td>
			</tr>
			<td>
			Select New Department  
			</td>    
			<td> 
            <form:select path="" id="departmentList" name="departmentList">
            <form:option value="" label="Select" />
            <form:options  items="${departmentList}" itemValue="Id" itemLabel="departmentName" />
            </form:select></td>
        	<tr>
			<td><input type="submit" value="Update Record" /></td>
			</tr>
</form:form>
	</table>


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 

