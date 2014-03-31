<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

	<!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,700" rel="stylesheet" type="text/css">
    <!-- CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/squareserif.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/TableFilter/filtergrid.css">
  	<link rel="stylesheet" type="text/css" href="../resources/TableFilter/TFExt_ColsResizer/TFExt_ColsResizer.css">
  	<link type="text/css" href="../resources/css/jquery.simple-dtpicker.css" rel="stylesheet" />
    
    <!-- Scripts -->
 <!-- <script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script> -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="../resources/js/init.js"></script>
		<script src="../resources/TableFilter/tablefilter_all.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/sortabletable.js" language="javascript" type="text/javascript"></script>
		<script src="../resources/TableFilter/tfAdapter.sortabletable.js" language="javascript" type="text/javascript"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-ui-1.8.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.simple-dtpicker.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/js/aos.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/ajaxfunctions.js"></script>
		<script type="text/javascript" src="../resources/js/jquery.simple-dtpicker.js"></script>
		<script type="text/javascript" src="../resources/js/gen_validatorv4.js"></script>

	
	
   

</head>
<body class="aos">
<header>
    <nav class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                
                <a class="navbar-brand" href="home"></a>
                
                
            </div>
            <div class="collapse navbar-collapse" id="top-navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="../employee/listEmployees" class="dropdown-toggle" data-toggle="dropdown">Employee <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../employee/listEmployees">List Employees</a></li>
                            <li><a href="../employee/addEmployee">Create Employee</a></li>
                            <li><a href="../employee/listEmployeeManager">List Managers</a></li>
                            <li><a href="../employee/addEmployeeManager">Manager Create </a></li>
                            <li><a href="../employee/listEmployeeDevices">List Mobile Devices </a></li>
                            <li><a href="../employee/addEmployeeDevice">Add Device </a></li>
                            <li><a href="../employee/listPermissions">List Permissions</a></li>
                            <li><a href="../employee/addPermission">Add Permission</a></li>
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a href="../client/listClients" class="dropdown-toggle" data-toggle="dropdown">Clients<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../client/listClients">List Clients</a></li>
                            <li><a href="../client/addClient">Create Client</a></li>
                        </ul>
                    </li>
                       <li class="dropdown">
                        <a href="../job/listJobs" class="dropdown-toggle" data-toggle="dropdown">Jobs<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../job/listJobsNew">List New Jobs</a></li>
                             <li><a href="../job/listJobsInprogress">List Jobs in progress</a></li>
                            <li><a href="../job/listJobs">List Non Completed Jobs</a></li>
                             <li><a href="../job/listJobsClosed">List Completed Jobs</a></li>
                            
                        </ul>
                    </li>
                        <li class="dropdown">
                        <a href="../job/listJobsDepartment" class="dropdown-toggle" data-toggle="dropdown">Departamental<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="../job/listJobDepartmentUpdate">List New Jobs</a></li>
                             <li><a href="../job/listJobsDepartmentInprogress">List Jobs in progress</a></li>
                            <li><a href="../job/listJobsDepartment">List Non Completed Jobs</a></li>
                             <li><a href="../job/listJobsDepartmentClosed">List Completed Jobs</a></li>
                            
                        </ul>
                    </li>
                     <li><a href="../job/listJobsEmployeeClosed">My Jobs</a></li>  
                    <li><a href="../security/chgPassword">Change Password</a></li>
                    <li><a href="../j_spring_security_logout">Log Out</a></li>
                   
                    </ul>
            </div>
        </div>
    </nav>
    <section class="header">

    </section>
</header>
<section class="feature js-feature">
    <div class="container">
        
        </div>
 
</section>