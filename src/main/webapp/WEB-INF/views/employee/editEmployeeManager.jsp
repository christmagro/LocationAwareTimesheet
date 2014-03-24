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

<c:url var="saveUrl" value="/employee/editEmployeeManager" /> 
<form:form id="editemployeemanager" modelAttribute="editemployeemanager"  method="POST" action="${saveUrl}">
	<table>
	
		<tr><td  colspan="2" style="max-width:325px;">${employee} currently is a the manager for ${department.departmentName} department.</td></tr>
      
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
		 <td>Current Department</td>
        <td>
        	${department.departmentName}
         </td>
      
		</tr>
		<tr>
		<td><input type="hidden" id="employeemanagerId" value="${editemployeemanager.id}"/></td>
		<td><input type="hidden" id="departmentId" value="${department.id}"/></td>
</tr>
<tr><td><input id="button" type="button" value="Submit" onclick="doEditEmployeeManager()"></td></tr>	
<div id="error" class="error"></div>
<div id="info" class="success"></div>

	</table>
	

</form:form>
<!-- Prevents page back  -->
		<script>
 		 function preventBack(){window.history.forward();}
 		 setTimeout("preventBack()", 0);
  		 window.onunload=function(){null};
		</script>
		
    </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 
