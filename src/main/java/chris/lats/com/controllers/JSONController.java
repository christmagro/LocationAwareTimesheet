package chris.lats.com.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chris.lats.com.dto.JobDepartmentUpdate;
import chris.lats.com.dto.JobDepartmentUpdateDTO;
import chris.lats.com.dto.JobUpdateAllocationDTO;
import chris.lats.com.json_model.CoordinatesJson;
import chris.lats.com.json_model.GeoJson;
import chris.lats.com.json_model.Geometry;
import chris.lats.com.json_model.JobList;
import chris.lats.com.json_model.JsonAppResponse;
import chris.lats.com.json_model.LongLat;
import chris.lats.com.json_model.LongitudeLatitude;
import chris.lats.com.json_model.Polylines;
import chris.lats.com.json_model.TestClass;
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
import com.chris.LocationAwareTimesheet.model.JobAllocation;
import com.chris.LocationAwareTimesheet.model.JobCoordinates;
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
	
//	@RequestMapping(value = "/listJobsold", method = RequestMethod.GET)
//	public @ResponseBody JobDepartmentUpdate  getAllJobsList(Model model) {
//	
//	   	
//	   List<JobDepartmentUpdate> jdulist = new ArrayList<JobDepartmentUpdate>();
//	   List<JobDepartmentUpdateDTO> jdus = jobService.getallJobs();
//	   for( JobDepartmentUpdateDTO jdu : jdus){
//		   
//		   JobDepartmentUpdate loadjdu = new JobDepartmentUpdate();
//		   
//		   DepartmentJob departmentjob = jobService.getDepartmentJob(jdu.getDepartmentjobId());
//		   Job job = jobService.getJob(jdu.getJobId());
//		   JobUpdate jobupdate = jobService.getJobUpdate(jdu.getJobupdateId());
//		   JobStatus jobstatus = jobupdate.getJobStatus();
//		   ClientDetails clientdetails = job.getJobClientDetails();
//		   ClientDetails cd = clientdetailsService.get(clientdetails.getId());
//		   Locality locality = cd.getLocality();
//		   Client client = cd.getClient();
//		   Departments department = departmentjob.getDepartment();
//		   
//		   
//		   loadjdu.setDepartmentjob(departmentjob);
//		   loadjdu.setJob(job);
//		   loadjdu.setJobupdate(jobupdate);
//		   loadjdu.setJobstatus(jobService.getJobStatus(jobstatus.getId()));
//		   loadjdu.setClientdetails(clientdetailsService.get(clientdetails.getId()));
//		   loadjdu.setLocality(localityService.getId(locality.getId()));
//		   loadjdu.setClient(clientService.get(client.getId()));
//		   loadjdu.setDepartment(departmentService.get(department.getId()));
//		   jdulist.add(loadjdu);
//		   return loadjdu;
//		 }
//	return null;
//	
//	 
//	  	 
//   }
	
	@RequestMapping(value = "/listJobs", method = RequestMethod.GET)
	public @ResponseBody List<JobList>  listJobs(@RequestParam(value="imei", required=true) String imei, Model model) {
		List<JobList> joblist = new ArrayList<JobList>();
	   	List<JobUpdateAllocationDTO> juas = jobService.getImeiJobsDepartment(imei);
	   	for(JobUpdateAllocationDTO jua:juas){
	   		JobList jl = new JobList();
	   		
	   		
	   		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm");
	    	
	   		
	   		Job job = jobService.getJob(jua.getJobId());
	   		JobUpdate jobUpdate= jobService.getJobUpdate(jua.getJobupdateId());
	   		
	   		JobStatus jobUpdateStatus = jobUpdate.getJobStatus();
	   		JobStatus jobStatus = jobService.getJobStatus(jobUpdateStatus.getId());
	   		
	   				
	   		
	   		jl.setJobDescription(job.getJobDescription());
	   		jl.setJobRemarks(job.getJobRemarks());
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
	   		jl.setJobStatus(jobStatus.getJobStatusName());
	   		joblist.add(jl);
	   		
	   		
	   		
	   	}


	return joblist;
	
	 
	  	 
   }
	

	
	 @RequestMapping(method=RequestMethod.POST, value="/addCoordinatesJob")
	   @ResponseBody
	   public String  addCoordinates(@RequestBody JsonAppResponse jsonresponse) {
		 
		 Integer jobid = jsonresponse.getJobid();
		 float latitude = jsonresponse.getLatitude();
		 Float tmpLatitude = latitude;
		 float longitude = jsonresponse.getLongitude();
		 Float tmpLongitude = longitude;
		 String status = jsonresponse.getStatus();
		 String imei = jsonresponse.getImei();
		 
	 if((!jobid.equals(null))&&(!tmpLatitude.equals(null))&&(!tmpLongitude.equals(null))&&(!status.equals(null))&&(!imei.equals(null))){
			 
      		JobAllocation joballocation= jobService.getAllocationByJobid(jobid);
      		
      		 
			if(status.equals("start")){
				jobService.addCoordinatesStart(joballocation.getId(), jobid, latitude, longitude, imei, status);
			}
			else if(status.equals("pause")){
				jobService.addCoordinatesPause(joballocation.getId(), jobid, latitude, longitude, imei, status);
			}
			else if(status.equals("stop")){
				jobService.addCoordinatesFinish(joballocation.getId(), jobid, latitude, longitude, imei, status);
			}
		 }
		 
		return null;
	   }
	 
	 
	 @RequestMapping(value = "/listCoordinates", method = RequestMethod.GET)
		public @ResponseBody  List<Polylines>  listCoordinates(@RequestParam(value="allocationid", required=true) int allocationid, Model model) {
		 
		 List<Polylines> polylines = new ArrayList<Polylines>();
		 List<JobCoordinates> jobcoordinates = jobService.getCoordinates(allocationid);
		 for(JobCoordinates jc : jobcoordinates){
			 Polylines polyline = new Polylines();
			 polyline.setLatitude(jc.getJobCoordinatesLatitude());
			 polyline.setLongitude(jc.getJobCoordinatesLongitude());
			 polylines.add(polyline);
		 }
		 
		 CoordinatesJson cj = new CoordinatesJson();
		 cj.setPolylines(polylines);
			 
		 

		 
			return polylines;

	 }
	 
	 
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String getAddClient(@RequestParam(value="allocationid", required=true) int allocationid, Model model) {
		
			model.addAttribute("allocationid", allocationid);
			return "home";
			}
	 
}



