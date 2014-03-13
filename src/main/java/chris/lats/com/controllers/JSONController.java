package chris.lats.com.controllers;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chris.lats.com.dto.JobDepartmentUpdate;
import chris.lats.com.dto.JobDepartmentUpdateDTO;
import chris.lats.com.dto.JobUpdateAllocationDTO;
import chris.lats.com.json_model.JobList;
import chris.lats.com.services.ClientDetailsService;
import chris.lats.com.services.ClientService;
import chris.lats.com.services.DepartmentService;
import chris.lats.com.services.EmployeeDepartmentService;
import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.JobService;
import chris.lats.com.services.LocalityService;

import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Job;
import com.chris.LocationAwareTimesheet.model.JobStatus;
import com.chris.LocationAwareTimesheet.model.JobUpdate;
import com.chris.LocationAwareTimesheet.model.Locality;

@Controller
@RequestMapping("json")
public class JSONController {
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	ClientDetailsService clientdetailsService;
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	LocalityService localityService;
	@Autowired
	EmployeeDepartmentService employeedepartmentService;
	
	@RequestMapping(value = "/listJobs", method = RequestMethod.GET)
	public @ResponseBody JobDepartmentUpdate  getAllJobsList(Model model) {
	
	   	
	   List<JobDepartmentUpdate> jdulist = new ArrayList<JobDepartmentUpdate>();
	   List<JobDepartmentUpdateDTO> jdus = jobService.getallJobs();
	   for( JobDepartmentUpdateDTO jdu : jdus){
		   
		   JobDepartmentUpdate loadjdu = new JobDepartmentUpdate();
		   
		   DepartmentJob departmentjob = jobService.getDepartmentJob(jdu.getDepartmentjobId());
		   Job job = jobService.getJob(jdu.getJobId());
		   JobUpdate jobupdate = jobService.getJobUpdate(jdu.getJobupdateId());
		   JobStatus jobstatus = jobupdate.getJobStatus();
		   ClientDetails clientdetails = job.getJobClientDetails();
		   ClientDetails cd = clientdetailsService.get(clientdetails.getId());
		   Locality locality = cd.getLocality();
		   Client client = cd.getClient();
		   Departments department = departmentjob.getDepartment();
		   
		   
		   loadjdu.setDepartmentjob(departmentjob);
		   loadjdu.setJob(job);
		   loadjdu.setJobupdate(jobupdate);
		   loadjdu.setJobstatus(jobService.getJobStatus(jobstatus.getId()));
		   loadjdu.setClientdetails(clientdetailsService.get(clientdetails.getId()));
		   loadjdu.setLocality(localityService.getId(locality.getId()));
		   loadjdu.setClient(clientService.get(client.getId()));
		   loadjdu.setDepartment(departmentService.get(department.getId()));
		   jdulist.add(loadjdu);
		   return loadjdu;
		 }
	return null;
	
	 
	  	 
   }
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody List<JobList>  test(Model model) {
		List<JobList> joblist = new ArrayList<JobList>();
	   	List<JobUpdateAllocationDTO> juas = jobService.getImeiJobsDepartment();
	   	for(JobUpdateAllocationDTO jua:juas){
	   		JobList jl = new JobList();
	   		
	   		
	   		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm");
	    	
	   		
	   		Job job = jobService.getJob(jua.getJobId());
	   		ClientDetails clientdetailsload = job.getJobClientDetails();
	   		ClientDetails clientdetails = clientdetailsService.get(clientdetailsload.getId());
	   		Locality localityload = clientdetails.getLocality();
	   		Locality locality = localityService.getId(localityload.getId());
	   		Client clientload = clientdetails.getClient();
	   		Client client = clientService.get(clientload.getId());
	   		String appointmentDate = fmt.print(job.getJobAppointmentDatetime());
	   		jl.setAppointmentDate(appointmentDate);
	   		jl.setClientAddress(clientdetails.getClientDetailsAddress1()+", "+clientdetails.getClientDetailsAddress2()+", "+locality.getLocalityName());
	   		jl.setClientName(client.getClientName());
	   		jl.setJobid(job.getId());
	   		joblist.add(jl);
	   		
	   		System.out.println("test");
	   		
	   	}
//	   	Employee loadEmployee = new Employee();
//	   	loadEmployee.setEmployeeName(employee.getEmployeeName());

	return joblist;
	
	 
	  	 
   }


}
