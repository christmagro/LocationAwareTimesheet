package chris.lats.com.dto;

import org.joda.time.DateTime;

import com.chris.LocationAwareTimesheet.model.Employee;

public class EmployeeDeviceDTO {
	
	
	private Employee employee;
	private DateTime employeeDeviceEndDate;
	private String employeeDeviceImei;
	private String employeeDeviceModel;
	private DateTime employeeDeviceStartDate;
	private Integer id;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public DateTime getEmployeeDeviceEndDate() {
		return employeeDeviceEndDate;
	}
	public void setEmployeeDeviceEndDate(DateTime employeeDeviceEndDate) {
		this.employeeDeviceEndDate = employeeDeviceEndDate;
	}
	public String getEmployeeDeviceImei() {
		return employeeDeviceImei;
	}
	public void setEmployeeDeviceImei(String employeeDeviceImei) {
		this.employeeDeviceImei = employeeDeviceImei;
	}
	public String getEmployeeDeviceModel() {
		return employeeDeviceModel;
	}
	public void setEmployeeDeviceModel(String employeeDeviceModel) {
		this.employeeDeviceModel = employeeDeviceModel;
	}
	public DateTime getEmployeeDeviceStartDate() {
		return employeeDeviceStartDate;
	}
	public void setEmployeeDeviceStartDate(DateTime employeeDeviceStartDate) {
		this.employeeDeviceStartDate = employeeDeviceStartDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	

}
