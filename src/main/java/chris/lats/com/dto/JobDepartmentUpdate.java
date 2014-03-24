package chris.lats.com.dto;

import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.model.DepartmentJob;
import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;
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
	private Departments department;
	private Employee employee;
	
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
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
	public Departments getDepartment() {
		return department;
	}
	public void setDepartment(Departments department) {
		this.department = department;
	}
	
	

}
