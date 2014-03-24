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

<h2>Edit Employee Address</h2>
<c:url var="saveUrl" value="editEmpAddress?empaddressid=${editEmpAddress.id}" /> 
<form:form id="editEmpAddress" modelAttribute="editEmpAddress"  method="POST" action="${saveUrl}">
	<table>
	<tr>
			
			<td style="display:none"><form:input value="${editEmpAddress.id}" path="id"  id="empaddressid" name="empaddressid"/></td>
		</tr>
		<tr>
			
			<td style="display:none"><form:input value="${employee.id}" path=""  id="employeeid" name="employeeid"/></td>
		</tr>
		
		
		<tr>
			<td><form:label path="empAddress1">Address 1:</form:label></td>
			<td><form:input value="${editEmpAddress.empAddress1}" path="empAddress1"  id="empAddress1" name="empAddress1"/></td>
		</tr>
				<tr>
			<td><form:label path="empAddress2">Address 2:</form:label></td>
			<td><form:input value="${editEmpAddress.empAddress2}" path="empAddress2"  id="empAddress2" name="empAddress2"/></td>
		</tr>
			
	
		<tr>
		 <td><form:label path="">Locality</form:label></td>
        <td>
            <form:select path="" id="elocality" name="elocality">
            <form:option value="${locality.id}" label="${locality.localityName}" />
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

  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" />