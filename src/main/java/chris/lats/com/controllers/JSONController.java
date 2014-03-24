package chris.lats.com.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

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
import org.springframework.web.servlet.ModelAndView;

import chris.lats.com.dto.JobUpdateAllocationDTO;
import chris.lats.com.dto.ReportDTO;
import chris.lats.com.json_model.CoordinatesJson;
import chris.lats.com.json_model.JobList;
import chris.lats.com.json_model.JsonAppResponse;
import chris.lats.com.json_model.Polylines;
import chris.lats.com.services.ClientDetailsService;
import chris.lats.com.services.ClientService;
import chris.lats.com.services.DepartmentService;
import chris.lats.com.services.EmployeeDepartmentService;
import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.JobService;
import chris.lats.com.services.LocalityService;
import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
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
	 
	 
		@RequestMapping(value = "/mapcoordinates", method = RequestMethod.GET)
		public String getAddClient(@RequestParam(value="jobid", required=true) int jobid, Model model) {
			JobAllocation joballocation = jobService.getAllocationByJobid(jobid);
			
			List<JobCoordinates> jobcoordinates = jobService.getCoordinates(joballocation.getId());
			
		
			model.addAttribute("joballocation", joballocation);
			model.addAttribute("jobcoordinates", jobcoordinates);
			model.addAttribute("jobid", jobid);
			
			return "home";
			}
		
		long diff = 0;
		@RequestMapping(method = RequestMethod.GET , value = "/TimeSheet")
	    public ModelAndView handleSimpleReportMulticourierOut(@RequestParam(value="jobid", required=true) int jobid,HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
				  
				  String format = "pdf";
				  
				  ModelAndView model = new ModelAndView("jobCoordinates");
				  model.addObject("format", format);
				  
				  
				  JobAllocation jobAllocation = jobService.getAllocationByJobid(jobid);
				  Job job = jobService.getJob(jobid);
				  ClientDetails clientdetailstmp = job.getJobClientDetails();
				  ClientDetails clientdetails = clientdetailsService.get(clientdetailstmp.getId());
				  Client clienttmp = clientdetails.getClient();
				  Client client = clientService.get(clienttmp.getId());
				  Locality localitytmp = clientdetails.getLocality();
				  Locality locality = localityService.getId(localitytmp.getId());
				  Employee employeetmp =jobAllocation.getEmployee();
				  Employee employee = employeeService.get(employeetmp.getId());
				  
				  List<JobCoordinates> jobcoordinates = jobService.getCoordinates(jobAllocation.getId());
				  List<ReportDTO> reportDTO = new ArrayList<ReportDTO>();
			
				  int state = 0;
				 
				  int diff = 0;
				  int diff2 = 0;
				  int diff3 = 0;
				  int total1 = 0;
				  int total2 = 0;
				  int total3 = 0;
				  double endlongitude = 0;
				  double endlatitude = 0;
				  double startlongitude = 0;
				  double startlatitude = 0;
				  DateTime completiondate = null;
				  DateTime startdate = null;
				  
				  for(JobCoordinates jc: jobcoordinates){
					  
					
					  
					  if(jc.getJobCoordinatesRemarks().equals("pause")){
						  state = 1;
						  int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
						  diff2 = minutes-diff;
						  diff=0;
						 total1 = total1+diff2;
				
				
					  }
					  
					  if(jc.getJobCoordinatesRemarks().equals("start") && state == 0){
							int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
						
							
							
							diff = minutes;
							state=2;
							startdate=jc.getJobCoordinatesTimestamp();
							startlatitude=jc.getJobCoordinatesLatitude();
							startlongitude=jc.getJobCoordinatesLongitude();
						  
					
						  
//					 System.out.println("pause did not occurd ");
					  }
					  
					  if(jc.getJobCoordinatesRemarks().equals("start") && state == 2){
						  int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
						  
						  diff2 = minutes-diff;
						  diff=minutes;
						 total1 = total1+diff2;
						  
//						  System.out.println("Total1 "+total1);
							  }
					  
					  
					  if(jc.getJobCoordinatesRemarks().equals("start") && state == 1){
						  int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
					
						  diff = minutes;
							state=3;
							
						  
//							 System.out.println("Total2 "+total2);
							  }
					  
					  
					  if(jc.getJobCoordinatesRemarks().equals("start") && state == 3){
						  int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
						  diff3 = minutes-diff;
						  diff=minutes;
						  total2 = total2+diff3;
						  
									  
						  
//							 System.out.println("Total2 "+total2);
							  }
					  
					  if(jc.getJobCoordinatesRemarks().equals("stop")){
						  int minutes =  jc.getJobCoordinatesTimestamp().getMinuteOfDay();
						  diff3 = minutes-diff;
						  diff=minutes;
						 
						  total3 = diff3+total1+total2;
						  completiondate=jc.getJobCoordinatesTimestamp();
						  endlatitude=jc.getJobCoordinatesLatitude();
						  endlongitude=jc.getJobCoordinatesLongitude();
					  }
					  
					
				  }
				  
				  ReportDTO rdto = new ReportDTO();
					  rdto.setEndLatitude(endlatitude);
					  rdto.setEndLongitude(endlongitude);
					  rdto.setStartLatitude(startlatitude);
					  rdto.setStartLongitude(startlongitude);
					  
					  if(total3%60 == 1){
						  rdto.setHours((total3/60)+1);
					  }else{
					  
					  rdto.setHours(total3/60);
					  
					  }
					  
					  rdto.setClient(client.getClientName());
					  rdto.setDescription(job.getJobDescription());
					  rdto.setJobid(jobid);
					  DateTimeFormatter fmt = DateTimeFormat.forPattern("d MMMM, yyyy H:m");
					  String str3 = startdate.toString(fmt);
					  rdto.setStartdate(str3);
					  String str1 = completiondate.toString(fmt);
					  rdto.setEnddate(str1);
					  rdto.setEmployee((employee.getEmployeeName())+" "+(employee.getEmployeeSurname()));
					  rdto.setAddress((clientdetails.getClientDetailsAddress1())+ ", "+ (clientdetails.getClientDetailsAddress2()) + ", " +(locality.getLocalityName()));
					  DateTimeFormatter fmt2 = DateTimeFormat.forPattern("d/MM/yyyy H:m");
					  String str2 = completiondate.toString(fmt2);
					  rdto.setLastdatetime(str2);
					  String str4 = startdate.toString(fmt2);
					  rdto.setStartdatetime(str4);
					  
					  
					  reportDTO.add(rdto);	  
					
				  model.addObject("reportDataKey", new JRBeanCollectionDataSource(reportDTO));
				 
				 
				 
				  return model;
				}
	 
}



