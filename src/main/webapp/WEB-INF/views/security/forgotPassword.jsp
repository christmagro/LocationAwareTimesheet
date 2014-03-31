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
    
    <h2>Forgot Password</h2>
<c:url var="saveUrl" value="/security/forgotPassword" /> 
<form:form id="forgotpass" modelAttribute=""  method="POST"  action="${saveUrl}">
	<table>

			
				
		<tr>
			<td>Enter Username: </td>
			<td><input  id="username" name="username" /></td>
			<td style="color:red;">${error}</td>
		</tr>
		
		

		<tr>
		<td colspan=2><input id="button" type="submit" value="Save" onclick = "this.style.visibility='hidden'"/></td>
		</tr>
	

		</table>
	

</form:form>
<!-- <script type="text/javascript">
 var frmvalidator  = new Validator("forgotpass");
 frmvalidator.addValidation("username","req","username cannot be empty");
 </script> -->
 

 


  </div>
</section>

<jsp:include page="/resources/template/footer.jsp" /> 