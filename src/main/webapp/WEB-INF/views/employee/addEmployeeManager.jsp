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
 
<div id="error" class="error"></div>
<div id="info" class="success"></div>
<h2>Add a new Manager</h2>

<c:url var="saveUrl" value="employee/addEmployeeManager" /> 
<form:form id="addemployeemanager" modelAttribute="addemployeemanager"  method="POST" action="${saveUrl}">
	<table class="smalltable">
	
		
		<tr>
		 <td>Select Employee</td>
        <td>
            <form:select path="" id="employeeId" name="employeeId">
            <form:option value="" label="Select" />
            <c:forEach var="employee" items="${employeelist}">
        	<form:option value="${employee.id}"><c:out value="${employee.employeeName} ${employee.employeeSurname}"/></form:option>
    		</c:forEach>
            </form:select>
        </td>
		</tr> 
		<tr>
		 <td>Select Department</td>
        <td>
            <form:select path="" id="departmentId" name="departmentId">
            <form:option value="" label="Select" />
            <form:options  items="${departmentlist}" itemValue="Id" itemLabel="departmentName" />
            </form:select>
        </td>
		</tr> 

<tr><td><input id="button" type="button" value="Submit" onclick="doAddEmployeeManager()"></td></tr>	


	</table>
	

</form:form>
  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 

