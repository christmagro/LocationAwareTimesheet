package chris.lats.com.dto;

import org.joda.time.DateTime;

import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;

public class EmployeeManagerDTO {
	
	private Departments department;
	private Employee employee;
	private DateTime employeeManagerEndDate;
	private DateTime employeeManagerStartDate;
	private Integer id;
	public Departments getDepartment() {
		return department;
	}
	public void setDepartment(Departments department) {
		this.department = department;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public DateTime getEmployeeManagerEndDate() {
		return employeeManagerEndDate;
	}
	public void setEmployeeManagerEndDate(DateTime employeeManagerEndDate) {
		this.employeeManagerEndDate = employeeManagerEndDate;
	}
	public DateTime getEmployeeManagerStartDate() {
		return employeeManagerStartDate;
	}
	public void setEmployeeManagerStartDate(DateTime employeeManagerStartDate) {
		this.employeeManagerStartDate = employeeManagerStartDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	

}
