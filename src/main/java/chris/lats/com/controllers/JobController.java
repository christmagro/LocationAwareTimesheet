package chris.lats.com.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chris.lats.com.dto.ClientDetailsDTO;
import chris.lats.com.dto.JobDepartmentUpdate;
import chris.lats.com.dto.JobDepartmentUpdateDTO;
import chris.lats.com.services.ClientDetailsService;
import chris.lats.com.services.ClientService;
import chris.lats.com.services.DepartmentService;
import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.JobService;
import chris.lats.com.services.LocalityService;

import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Job;
import com.chris.LocationAwareTimesheet.model.JobStatus;
import com.chris.LocationAwareTimesheet.model.JobUpdate;
import com.chris.LocationAwareTimesheet.model.Locality;

@Controller
@RequestMapping("job")
public class JobController {
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
	
			
	
	@RequestMapping(value = "/createJob", method = RequestMethod.GET)
	public String getCreateJob(@RequestParam(value="clientid", required=true) int clientid, Model model) {
		
		List<ClientDetails> clientdetails = clientdetailsService.getAll(clientid);
		List<ClientDetailsDTO> clientdetailsDTO = new ArrayList<ClientDetailsDTO>();
		for(ClientDetails clientdetail:clientdetails){
			ClientDetailsDTO dto = new ClientDetailsDTO();
			Client client = clientdetail.getClient();
			Locality locality = clientdetail.getLocality();
			dto.setClient(clientService.get(client.getId()));
			dto.setLocality(localityService.getId(locality.getId()));
			dto.setClientDetailsAddress1(clientdetail.getClientDetailsAddress1());
			dto.setClientDetailsAddress2(clientdetail.getClientDetailsAddress2());
			dto.setClientDetailsContactDescription(clientdetail.getClientDetailsContactDescription());
			dto.setClientDetailsContactName(clientdetail.getClientDetailsContactName());
			dto.setClientDetailsContactSurname(clientdetail.getClientDetailsContactSurname());
			dto.setClientDetailsContactPhone(clientdetail.getClientDetailsContactPhone());
			dto.setClientDetailsContactEmail(clientdetail.getClientDetailsContactEmail());
			dto.setId(clientdetail.getId());
			clientdetailsDTO.add(dto);
			
		}
		
		
		
		model.addAttribute("clientdetailslist", clientdetailsDTO);
		model.addAttribute("departmentlist", departmentService.getAll());
		model.addAttribute("employeelist", employeeService.getAll());
		model.addAttribute("createJob", new Job());
		return "job/createJob";
		}

	  	    	
	   @RequestMapping(value = "/createJob", method = RequestMethod.POST)
	  public String postCreateJob(@RequestParam(value="jobAppointment", required=true) String jobAppointment,
			  					 @RequestParam(value="clientdetailsid", required=true) int clientdetailsid,
			  					 @RequestParam(value="jobDescription", required=true) String jobDescription,
			  					 @RequestParam(value="jobRemarks", required=true) String jobRemarks,
			  					 @RequestParam(value="departmentid") int departmentid)
			  					 
			  					
			  					  {
		   
		   
		   jobService.addJob(jobAppointment, clientdetailsid, jobDescription, jobRemarks, departmentid, 65);
			
		 
		   return "redirect:../client/listClients";
		  
	}
	   
	   
	   @RequestMapping(value = "/listJobDepartmentUpdate", method = RequestMethod.GET)
		public String getDepartmentNewJobsList(Model model) {
		   
//		   Once Spring security in place get employee id and department id
		   	
		   List<JobDepartmentUpdate> jdulist = new ArrayList<JobDepartmentUpdate>();
		   List<JobDepartmentUpdateDTO> jdus = jobService.getNewJobsDepartment();
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
			   
			   
			   loadjdu.setDepartmentjob(departmentjob);
			   loadjdu.setJob(job);
			   loadjdu.setJobupdate(jobupdate);
			   loadjdu.setJobstatus(jobService.getJobStatus(jobstatus.getId()));
			   loadjdu.setClientdetails(clientdetailsService.get(clientdetails.getId()));
			   loadjdu.setLocality(localityService.getId(locality.getId()));
			   loadjdu.setClient(clientService.get(client.getId()));
			   jdulist.add(loadjdu);
			   
			   
			   
			   

		   }
		   model.addAttribute("jdulist", jdulist);
		   
		   
			
		   return "job/listJobDeptNew";		 
	   }
	   
	   
	   @RequestMapping(value = "/listJobsDepartment", method = RequestMethod.GET)
		public String getDepartmentAllJobsList(Model model, Principal principal) {
		   
//		   Once Spring security in place get employee id and department id
		   	
		   List<JobDepartmentUpdate> jdulist = new ArrayList<JobDepartmentUpdate>();
		   List<JobDepartmentUpdateDTO> jdus = jobService.getallJobsDepartment();
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
			   
			   
			   loadjdu.setDepartmentjob(departmentjob);
			   loadjdu.setJob(job);
			   loadjdu.setJobupdate(jobupdate);
			   loadjdu.setJobstatus(jobService.getJobStatus(jobstatus.getId()));
			   loadjdu.setClientdetails(clientdetailsService.get(clientdetails.getId()));
			   loadjdu.setLocality(localityService.getId(locality.getId()));
			   loadjdu.setClient(clientService.get(client.getId()));
			   jdulist.add(loadjdu);
			   
			   
			   
			   

		   }
		   model.addAttribute("jdulist", jdulist);
		   
		   
		 
			model.addAttribute("name", principal.getName());
			
		   return "job/listJobDeptAll";		 
	   }
	   
	   
	   @RequestMapping(value = "/listJobsDepartmentClosed", method = RequestMethod.GET)
		public String getDepartmentClosedJobsList(Model model) {
		   
//		   Once Spring security in place get employee id and department id
		   	
		   List<JobDepartmentUpdate> jdulist = new ArrayList<JobDepartmentUpdate>();
		   List<JobDepartmentUpdateDTO> jdus = jobService.getclosedJobsDepartment();
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
			   
			   
			   loadjdu.setDepartmentjob(departmentjob);
			   loadjdu.setJob(job);
			   loadjdu.setJobupdate(jobupdate);
			   loadjdu.setJobstatus(jobService.getJobStatus(jobstatus.getId()));
			   loadjdu.setClientdetails(clientdetailsService.get(clientdetails.getId()));
			   loadjdu.setLocality(localityService.getId(locality.getId()));
			   loadjdu.setClient(clientService.get(client.getId()));
			   jdulist.add(loadjdu);
			   
			   
			   
			   

		   }
		   model.addAttribute("jdulist", jdulist);
		   
		   
			
		   return "job/listJobDeptClosed";		 
	   }
	   
	   
}
