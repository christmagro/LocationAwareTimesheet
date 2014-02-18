package chris.lats.com.dto;

import org.joda.time.DateTime;

import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;

public class EmployeeDepartmentDTO {
	
	private Departments department;

	private Employee employee;
	
	private DateTime employeeDepartmentEndDate;

	private DateTime employeeDepartmentStartDate;
	
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

	public DateTime getEmployeeDepartmentEndDate() {
		return employeeDepartmentEndDate;
	}

	public void setEmployeeDepartmentEndDate(DateTime employeeDepartmentEndDate) {
		this.employeeDepartmentEndDate = employeeDepartmentEndDate;
	}

	public DateTime getEmployeeDepartmentStartDate() {
		return employeeDepartmentStartDate;
	}

	public void setEmployeeDepartmentStartDate(DateTime employeeDepartmentStartDate) {
		this.employeeDepartmentStartDate = employeeDepartmentStartDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	} 
	
	

}
