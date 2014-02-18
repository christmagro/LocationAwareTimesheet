package chris.lats.com.services;


import java.util.List;

import org.hibernate.Query;
import org.joda.time.DateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeeDepartment;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;


@Component
public class EmployeeDepartmentService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	@Transactional
	public EmployeeDepartment get( Integer id ) {
		// Retrieve session from Hibernate
		//Session session = sessionFactory.getCurrentSession();
		
		// Retrieve existing courierin first
		EmployeeDepartment employeedepartment=  dlp.getEmployeeDepartment(id);
		
		
		return employeedepartment;
	}
		
	@Transactional
	public int getempldep(int eid) {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createSQLQuery("select employee_department_id from employee_department where employee_department_end_date is null and employee_id = '" + eid + "'");

		
		           int empdeptid = (Integer) query.list().get(0);
		           
		        	
		          
				return empdeptid;

	}
	
	
	@Transactional
	public List<EmployeeDepartment> getAll() {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createQuery("from EmployeeDepartment where employeeDepartmentEndDate is null order by employee.id ASC");

		
		return query.list();

	}
	
	@Transactional
	public void updateEmployeeDepartment(int oldemployeedepartmentid, int employeeid, int newdepartmentid ) {
		//Get Current Date
		java.util.Date date= new java.util.Date();
    	
		//get Current date and update employeedepartment record with end date 
		
		
		
		EmployeeDepartment employeedepartment = dlp.getEmployeeDepartment(oldemployeedepartmentid);
		employeedepartment.setEmployeeDepartmentEndDate(new DateTime(date.getTime()));
		dlp.saveOrUpdate(employeedepartment);
	
		
		//Create new record in employeedepartment record with the new selected department
		EmployeeDepartment newemployeedepartment = new EmployeeDepartment();
		Employee employee = dlp.getEmployee(employeeid);
		Departments department = dlp.getDepartments(newdepartmentid);
		newemployeedepartment.setEmployee(employee);
		newemployeedepartment.setDepartment(department);
		newemployeedepartment.setEmployeeDepartmentStartDate(new DateTime(date.getTime()));
	
		dlp.saveOrUpdate(newemployeedepartment);
				
		

		
		

	}
	
	
}
	
	

