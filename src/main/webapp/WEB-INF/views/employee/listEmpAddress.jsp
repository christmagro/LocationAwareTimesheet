<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Create Employee</title>
	<!-- Scripts -->
		<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
</head>
<body>

 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<h2>Employee Details</h2>

<a href="addEmpAddress?employeeid=${employeeid}">Add Address</a>



	<table>
		
		<thead>
		<tr>
		<td>Id</td>
		<td>Address 1</td>
		<td>Address 2</td>
		<td>Locality</td>
		
		<td>Edit Address</td>
		<td>Remove Address</td>
	
		</tr>
		</thead>
		<tbody>
	<c:forEach items="${empaddresslist}" var="empaddresslist">
			<c:url var="editAddress" value="editEmpAddress?empaddressid=${empaddresslist.id}" />
			<c:url var="removeAddress" value="removeEmpAddress?empaddressid=${empaddresslist.id}" />
		
		
		
		<tr>
			<td width=100px><c:out value="${empaddresslist.id}" /></td>	
			<td width=100px><c:out value="${empaddresslist.empAddress1}" /></td>
			<td width=100px><c:out value="${empaddresslist.empAddress2}" /></td>
			<td width=70px><c:out value="${empaddresslist.locality.localityName}" /></td>
				
			<td width=90px><a href="${editAddress}">Edit Address</a></td>
			<td width=90px><a href="${removeAddress}">Remove Address</a></td>
		
			 
			
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	


</body>
</html>
