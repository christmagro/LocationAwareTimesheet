package chris.lats.com.services;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import org.hibernate.transform.Transformers;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import chris.lats.com.dto.JobDepartmentUpdateDTO;
import chris.lats.com.dto.JobUpdateAllocationDTO;


import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Job;
import com.chris.LocationAwareTimesheet.model.JobAllocation;
import com.chris.LocationAwareTimesheet.model.JobCoordinates;
import com.chris.LocationAwareTimesheet.model.JobStatus;
import com.chris.LocationAwareTimesheet.model.JobUpdate;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class JobService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;

	
	
	@Transactional
	public Job getJob(int id){
		
		Job job = dlp.getJob(id);
	
		return job;
	}
	
	
	@Transactional
	public DepartmentJob getDepartmentJob(int id){
		
		DepartmentJob departmentjob = dlp.getDepartmentJob(id);
	
		return departmentjob;
	}
	
	
	
	@Transactional
	public JobUpdate getJobUpdate(int id){
		
		JobUpdate jobupdate = dlp.getJobUpdate(id);
	
		return jobupdate;
	}
	
	
	@Transactional
	public JobStatus getJobStatus(int id){
		
		JobStatus jobstatus = dlp.getJobStatus(id);
	
		return jobstatus;
	}
	
	
	
	
	@Transactional
	public void addJob(String jobAppointment, int clientdetailsid, String jobDescription, String jobRemarks,int departmentid, int employeeid ){
		java.util.Date date= new java.util.Date();
		Job job = new Job();
	DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm");
    	
    	String appointmentConvert = jobAppointment;
    	DateTime appointmentdate = fmt.parseDateTime(appointmentConvert);
		
		job.setJobAppointmentDatetime(appointmentdate);
		job.setJobCreationTimestamp((new DateTime(date.getTime())));
		job.setJobClientDetails(dlp.getClientDetails(clientdetailsid));
		job.setJobDescription(jobDescription);
		job.setJobRemarks(jobRemarks);
		job.setJobTeam(false);
		dlp.saveOrUpdate(job);
		
		DepartmentJob departmentjob = new DepartmentJob();
		departmentjob.setJob(job);
		departmentjob.setDepartment(dlp.getDepartments(departmentid));
		dlp.saveOrUpdate(departmentjob);
		
		JobUpdate jobupdate = new JobUpdate();
		jobupdate.setJob(job);
		jobupdate.setJobStatus(dlp.getJobStatus(3));
		jobupdate.setJobUpdateStart((new DateTime(date.getTime())));
		jobupdate.setEmployee(dlp.getEmployee(employeeid));
		dlp.saveOrUpdate(jobupdate);
		
	}
	
	
	@Transactional
	public void editJob(int jobid, String jobAppointment,  String jobDescription, String jobRemarks,int departmentid){
		java.util.Date date= new java.util.Date();
		Job editjob = dlp.getJob(jobid);
	DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm");
    	
    	String appointmentConvert = jobAppointment;
    	DateTime appointmentdate = fmt.parseDateTime(appointmentConvert);
		
		editjob.setJobAppointmentDatetime(appointmentdate);
		editjob.setJobCreationTimestamp((new DateTime(date.getTime())));
		editjob.setJobDescription(jobDescription);
		editjob.setJobRemarks(jobRemarks);
		dlp.saveOrUpdate(editjob);
		
		
		Query query = dlp.createQuery("From DepartmentJob dj where dj.job = '"+jobid+"'");
		DepartmentJob editdepartmentjob =  (DepartmentJob) query.list().get(0);
		editdepartmentjob.setDepartment(dlp.getDepartments(departmentid));
		dlp.saveOrUpdate(editdepartmentjob);
		
	
		
		
	}
	
	
	@Transactional
	public DepartmentJob getDepartmentJobbyJobid(int jobid){
		
		Query query = dlp.createQuery("From DepartmentJob dj where dj.job = '"+jobid+"'");
		DepartmentJob departmentjob =  (DepartmentJob) query.list().get(0);
		
		return departmentjob;
	}
	
	
	@Transactional
		public List<JobDepartmentUpdateDTO> getNewJobsDepartment(int deptid){
			Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
											+"FROM job AS jb "
											+"Join Department_Job AS dj "
											+"ON jb.job_id = dj.job_id "
											+"Join job_update as ju "
											+"ON jb.job_id = ju.job_id "
											+"where dj.department_id = '"+deptid+"' AND ju.job_status_id = 3 AND ju.job_update_end is null")
			
			.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
			
			return query.list();
			
		}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getinprogressJobsDepartment(int deptid){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where dj.department_id = '"+deptid+"' AND ju.job_status_id = 8 AND ju.job_update_end is null")
		
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getallJobsDepartment(int deptid){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where dj.department_id = '"+deptid+"' AND ju.job_status_id != 6 and ju.job_update_end is null")
				
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getclosedJobsDepartment(int deptid){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where dj.department_id = '"+deptid+"' and ju.job_status_id = 6 and ju.job_update_end is null")

										.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getemployeeclosedJobs(int employeeid){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where ju.employee_id = '"+employeeid+"' and ju.job_status_id = 6 and ju.job_update_end is null")

										.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getNewJobs(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where ju.job_status_id = 3 and ju.job_update_end is null")
		
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getinprogressJobs(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where ju.job_status_id = 8 and ju.job_update_end is null")
		
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	

	@Transactional
	public List<JobDepartmentUpdateDTO> getallJobs(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
									+"FROM job AS jb "
									+"Join Department_Job AS dj "
									+"ON jb.job_id = dj.job_id "
									+"Join job_update as ju "
									+"ON jb.job_id = ju.job_id "
									+"where ju.job_status_id != 6 and ju.job_update_end is null")
			
									.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
	
		return query.list();
	
	}	


	@Transactional
	public List<JobDepartmentUpdateDTO> getclosedJobs(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
									+"FROM job AS jb "
									+"Join Department_Job AS dj "
									+"ON jb.job_id = dj.job_id "
									+"Join job_update as ju "
									+"ON jb.job_id = ju.job_id "
									+"where ju.job_status_id = 6 and ju.job_update_end is null")

									.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
	
		return query.list();
	
}
	
	
	
	@Transactional
	public void allocateJob(int jobupdateid, Integer jobid, Integer creatoremployeeid, int employeeid ){
		java.util.Date date= new java.util.Date();
    	
	    JobUpdate oldjobupdate = dlp.getJobUpdate(jobupdateid);
	    oldjobupdate.setJobUpdateEnd((new DateTime(date.getTime())));
	    dlp.saveOrUpdate(oldjobupdate);
	    
	    
	    JobAllocation joballocation = new JobAllocation();
	    joballocation.setJob(dlp.getJob(jobid));
	    joballocation.setCreatorEmployee(dlp.getEmployee(creatoremployeeid));
	    joballocation.setEmployee(dlp.getEmployee(employeeid));
	    
	    dlp.saveOrUpdate(joballocation);
		
		
		
		JobUpdate jobupdate = new JobUpdate();
		jobupdate.setJob(dlp.getJob(jobid));
		jobupdate.setJobStatus(dlp.getJobStatus(4));
		jobupdate.setJobUpdateStart((new DateTime(date.getTime())));
		jobupdate.setEmployee(dlp.getEmployee(creatoremployeeid));
		dlp.saveOrUpdate(jobupdate);
		
	}
	
	
	@Transactional
	public List<JobUpdateAllocationDTO> getImeiJobsDepartment(String imei){
		Query query = dlp.createSQLQuery("SELECT ju.job_id as jobId,  ju.job_update_id as jobupdateId, ja.job_allocation_id as joballocationId"
										+" From Employee emp"
										+" join employee_device ed"
										+" on emp.employee_id = ed.employee_id"
										+" join job_allocation ja"
										+" on emp.employee_id = ja.employee_id"
										+" join job_update ju"
										+" on ju.job_id = ja.job_id"
										+" join job_status js"
										+" on ju.job_status_id = js.job_status_id"
										+" where ed.employee_device_imei = '"+imei+"' and ed.employee_device_end_date is null and ju.job_update_end is null and (ju.job_status_id =  4 or ju.job_status_id =  5 or ju.job_status_id =  8)")
	
										.setResultTransformer(Transformers.aliasToBean(JobUpdateAllocationDTO.class));
		
		return query.list();
		
	}
	
	@Transactional
	public JobAllocation getJobAllocation(int id){
		
		JobAllocation joballocation = dlp.getJobAllocation(id);
	
		return joballocation;
	}
	
	@Transactional
	public JobAllocation getAllocationByJobid(int jobid){
		
	
		Query query = dlp.createQuery("From JobAllocation ja where ja.job = '"+jobid+"'");
		JobAllocation joballocation =  (JobAllocation) query.list().get(0);
	
		return joballocation;
	}
	
	@Transactional
	public void addCoordinatesPause(int allocationid, int jobid, double latitude, double longitude, String imei, String status){
		java.util.Date date= new java.util.Date();
		
		Query query = dlp.createQuery("From JobUpdate ju where ju.jobUpdateEnd is null AND ju.job = '"+jobid+"'");
		JobUpdate jobUpdate =  (JobUpdate) query.list().get(0);
		jobUpdate.setJobUpdateEnd(((new DateTime(date.getTime()))));
		dlp.saveOrUpdate(jobUpdate);
		
		JobUpdate jobupdatenew = new JobUpdate();
		JobAllocation joballocation = dlp.getJobAllocation(allocationid);
		Employee employee = joballocation.getEmployee();
		 
		jobupdatenew.setJob(dlp.getJob(jobid));
		jobupdatenew.setJobStatus(dlp.getJobStatus(5));
		jobupdatenew.setEmployee(dlp.getEmployee(employee.getId()));
		jobupdatenew.setJobUpdateStart(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobupdatenew);
		
		JobCoordinates jobco = new JobCoordinates();
		jobco.setJobAllocation(dlp.getJobAllocation(allocationid));
		jobco.setJobCoordinatesImei(imei);
		jobco.setJobCoordinatesLatitude(latitude);
		jobco.setJobCoordinatesLongitude(longitude);
		jobco.setJobCoordinatesRemarks(status);
		jobco.setJobCoordinatesTimestamp(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobco);
		
	}
	
	
	@Transactional
	public void addCoordinatesStart(int allocationid, int jobid, double latitude, double longitude, String imei, String status){
		
		java.util.Date date= new java.util.Date();
		
		Query query = dlp.createQuery("From JobUpdate ju where ju.jobUpdateEnd is null AND ju.job = '"+jobid+"'");
		JobUpdate jobUpdate =  (JobUpdate) query.list().get(0);
		jobUpdate.setJobUpdateEnd(((new DateTime(date.getTime()))));
		dlp.saveOrUpdate(jobUpdate);
		
		JobUpdate jobupdatenew = new JobUpdate();
		
		JobAllocation joballocation = dlp.getJobAllocation(allocationid);
		Employee employee = joballocation.getEmployee();
		 
		jobupdatenew.setJob(dlp.getJob(jobid));
		jobupdatenew.setJobStatus(dlp.getJobStatus(8));
		jobupdatenew.setEmployee(dlp.getEmployee(employee.getId()));
		jobupdatenew.setJobUpdateStart(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobupdatenew);
		
		JobCoordinates jobco = new JobCoordinates();
		jobco.setJobAllocation(dlp.getJobAllocation(allocationid));
		jobco.setJobCoordinatesImei(imei);
		jobco.setJobCoordinatesLatitude(latitude);
		jobco.setJobCoordinatesLongitude(longitude);
		jobco.setJobCoordinatesRemarks(status);
		jobco.setJobCoordinatesTimestamp(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobco);
		
	}
	
	
	@Transactional
	public void addCoordinatesFinish(int allocationid, int jobid, double latitude, double longitude, String imei, String status){
		java.util.Date date= new java.util.Date();
		
		Query query = dlp.createQuery("From JobUpdate ju where ju.jobUpdateEnd is null AND ju.job = '"+jobid+"'");
		JobUpdate jobUpdate =  (JobUpdate) query.list().get(0);
		jobUpdate.setJobUpdateEnd(((new DateTime(date.getTime()))));
		dlp.saveOrUpdate(jobUpdate);
		
		JobUpdate jobupdatenew = new JobUpdate();
		
		JobAllocation joballocation = dlp.getJobAllocation(allocationid);
		Employee employee = joballocation.getEmployee();
		 
		jobupdatenew.setJob(dlp.getJob(jobid));
		jobupdatenew.setJobStatus(dlp.getJobStatus(6));
		jobupdatenew.setEmployee(dlp.getEmployee(employee.getId()));
		jobupdatenew.setJobUpdateStart(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobupdatenew);
		
		JobCoordinates jobco = new JobCoordinates();
		jobco.setJobAllocation(dlp.getJobAllocation(allocationid));
		jobco.setJobCoordinatesImei(imei);
		jobco.setJobCoordinatesLatitude(latitude);
		jobco.setJobCoordinatesLongitude(longitude);
		jobco.setJobCoordinatesRemarks(status);
		jobco.setJobCoordinatesTimestamp(new DateTime(date.getTime()));
		dlp.saveOrUpdate(jobco);
		
	}
	
	@Transactional
	public List<JobCoordinates> getCoordinates(int allocationid){
		
		
		Query query = dlp.createQuery("From JobCoordinates jc where jc.jobAllocation = '"+allocationid+"'");
		
		return query.list();
		
	
	}
	
	
	@Transactional
	public List<JobAllocation> getAllocation(int jobid){
		
		
		Query query = dlp.createQuery("From JobAllocation ju where ju.job = '"+jobid+"'");
		
		return query.list();
		
	
	}
	
	@Transactional
	public JobCoordinates getCoordinate(int id){
		
		
		JobCoordinates jobCoordinates = dlp.getJobCoordinates(id);
		
		return jobCoordinates;
		
	
	}
	
	
	
	

}
