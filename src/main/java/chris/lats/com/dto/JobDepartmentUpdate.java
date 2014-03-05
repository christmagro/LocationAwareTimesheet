package chris.lats.com.dto;

import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Job;
import com.chris.LocationAwareTimesheet.model.JobStatus;
import com.chris.LocationAwareTimesheet.model.JobUpdate;
import com.chris.LocationAwareTimesheet.model.Locality;

public class JobDepartmentUpdate {
	
	
	private Job job;
	private JobUpdate jobupdate;
	private DepartmentJob departmentjob;
	private JobStatus jobstatus;
	private ClientDetails clientdetails;
	private Locality locality;
	private Client client;
	
	
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public JobUpdate getJobupdate() {
		return jobupdate;
	}
	public void setJobupdate(JobUpdate jobupdate) {
		this.jobupdate = jobupdate;
	}
	public DepartmentJob getDepartmentjob() {
		return departmentjob;
	}
	public void setDepartmentjob(DepartmentJob departmentjob) {
		this.departmentjob = departmentjob;
	}
	public JobStatus getJobstatus() {
		return jobstatus;
	}
	public void setJobstatus(JobStatus jobstatus) {
		this.jobstatus = jobstatus;
	}
	public ClientDetails getClientdetails() {
		return clientdetails;
	}
	public void setClientdetails(ClientDetails clientdetails) {
		this.clientdetails = clientdetails;
	}
	public Locality getLocality() {
		return locality;
	}
	public void setLocality(Locality locality) {
		this.locality = locality;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	
	

}
