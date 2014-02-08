package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.EmpAddress;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Locality;
import com.chris.LocationAwareTimesheet.model.enums.db.EmployeeEmployeeGenderEnum;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;



@Component
public class EmployeeService {

	@Autowired
	DataLayerLatsdbImpl dlp;
	
	

		
	@Transactional
	public List<Employee> getAll() {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Employee");
		// Retrieve all
		return  query.list();
	}
	
	
		
		
	
	/**
	 * Retrieves a single employee
	 */
	@Transactional
	public Employee get( Integer id ) {
		
		// Retrieve existing authority first
		Employee employee = dlp.getEmployee(id);
		
		return employee;
	}
	
	
	
	
	/**
	 * Adds a new employee
	 */
	@Transactional
	public void add(String ename, String esurname, String edob, String ephone, String egender, String estart, String eaddress1, String eaddress2, Integer localityid) {
	 
	Employee employee = new Employee();
	EmpAddress empAddress = new EmpAddress();
	Locality locality = dlp.getLocality(localityid);
	
	
	
		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
    	
    	String dobConvert = edob;
    	DateTime dob = fmt.parseDateTime(dobConvert);
    	
    	String startConvert = estart;
    	DateTime startDate = fmt.parseDateTime(startConvert);
    	
    	    	   	
    	employee.setEmployeeName(ename);
    	employee.setEmployeeSurname(esurname);
    	employee.setEmployeeDob(dob);
    	employee.setEmployeeGender(EmployeeEmployeeGenderEnum.valueOf(egender));
    	employee.setEmployeePhone(ephone);
    	employee.setEmployeeStartDate(startDate);
    	employee.setEmployeeDeleted(false);
    			
		// Save
		dlp.saveOrUpdate(employee);
		
		
		empAddress.setEmployee(employee);
		empAddress.setEmpAddress1(eaddress1);
		empAddress.setEmpAddress2(eaddress2);
		empAddress.setLocality(locality);
		
		dlp.saveOrUpdate(empAddress);
		
	}
	
	/**
	 * Flags an employee as deleted
	 * @param id the id of the existing employee
	 */
	@Transactional
	public void delete(Integer id) {
				
		// Retrieve existing employee
		
		Employee employee = dlp.getEmployee(id);
		
		// Delete 
		dlp.delete(employee);
		
	}
	
		
	
	/**
	 * Edits an existing employee
	 */
	@Transactional
	public void edit() {
		Employee employee = null;


		// Save updates
		dlp.saveOrUpdate(employee);
	}
	

}
