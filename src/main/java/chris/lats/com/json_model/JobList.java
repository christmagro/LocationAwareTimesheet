package chris.lats.com.json_model;


import org.springframework.stereotype.Component;

@Component
public class JobList {
	
	private int jobid;
	private String clientName;
	private String clientAddress;
	private String appointmentDate;
	private String jobDescription;
	private String jobRemarks;
	private String jobStatus;
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getJobRemarks() {
		return jobRemarks;
	}
	public void setJobRemarks(String jobRemarks) {
		this.jobRemarks = jobRemarks;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
	
	
	

}
