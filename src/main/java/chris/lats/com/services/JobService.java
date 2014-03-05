package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import chris.lats.com.dto.JobDepartmentUpdate;
import chris.lats.com.dto.JobDepartmentUpdateDTO;

import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Job;
import com.chris.LocationAwareTimesheet.model.JobStatus;
import com.chris.LocationAwareTimesheet.model.JobUpdate;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class JobService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	java.util.Date date= new java.util.Date();
	
	
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
		public List<JobDepartmentUpdateDTO> getNewJobsDepartment(){
			Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
											+"FROM job AS jb "
											+"Join Department_Job AS dj "
											+"ON jb.job_id = dj.job_id "
											+"Join job_update as ju "
											+"ON jb.job_id = ju.job_id "
											+"where dj.department_id = 2 AND ju.job_status_id = 3")
			
			
//		get departmentid after spring security is set
			
			.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
			
			return query.list();
			
		}
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getallJobsDepartment(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where dj.department_id = 2 AND ju.job_status_id != 6 and ju.job_update_end is null")
		
		
//	get departmentid after spring security is set
		
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	
	
	@Transactional
	public List<JobDepartmentUpdateDTO> getclosedJobsDepartment(){
		Query query = dlp.createSQLQuery("SELECT jb.job_id as jobId, dj.department_job_id as departmentjobId, ju.job_update_id as jobupdateId " 
										+"FROM job AS jb "
										+"Join Department_Job AS dj "
										+"ON jb.job_id = dj.job_id "
										+"Join job_update as ju "
										+"ON jb.job_id = ju.job_id "
										+"where dj.department_id = 2 AND ju.job_status_id = 6")
		
		
//	get departmentid after spring security is set
		
		.setResultTransformer(Transformers.aliasToBean(JobDepartmentUpdateDTO.class));
		
		return query.list();
		
	}
	

}
