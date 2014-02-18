package chris.lats.com.dto;

import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Locality;

public class EmpAddressDTO {
	
	private Employee employee;
	private String empAddress1;
	private String empAddress2;
	private Integer id;
	private Locality locality;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getEmpAddress1() {
		return empAddress1;
	}
	public void setEmpAddress1(String empAddress1) {
		this.empAddress1 = empAddress1;
	}
	public String getEmpAddress2() {
		return empAddress2;
	}
	public void setEmpAddress2(String empAddress2) {
		this.empAddress2 = empAddress2;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Locality getLocality() {
		return locality;
	}
	public void setLocality(Locality locality) {
		this.locality = locality;
	}

	
}
