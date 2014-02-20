package chris.lats.com.services;


import java.util.List;
import org.hibernate.Query;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeeManager;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;


@Component
public class EmployeeManagerService {
	
	java.util.Date date= new java.util.Date();
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	@Transactional
	public EmployeeManager get( Integer id ) {
		
		EmployeeManager employeemanager =  dlp.getEmployeeManager(id);
		
		
		return employeemanager;
	}
		
		
	
	@Transactional
	public List<EmployeeManager> getAll() {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createQuery("from EmployeeManager");

		
		return query.list();

	}
	
	@Transactional
	public List<EmployeeManager> getEmployeeManagers() {
				
		// Create a Hibernate query (HQL)
		
		String hqlquery = 	"From EmployeeManager em where em.employeeManagerEndDate is null";
		Query query = dlp.createQuery(hqlquery);

		
		return query.list();

	}
	
	@Transactional
	public void updateEmployeemanager() {
		
		

	}
	
	@Transactional
	public int  checkAddDepartmentManager(int deptid) {
	
	Query query = dlp.createQuery("from EmployeeManager em where em.employeeManagerEndDate is null and em.department ='" + deptid + "'");

	return query.list().size();
	}
	
	
	@Transactional
	public int  checkAddEmployeeManager(int empid) {
	
	Query query = dlp.createQuery("from EmployeeManager em where em.employeeManagerEndDate is null and em.employee ='" + empid + "'");

	return query.list().size();
				
	}
	
	@Transactional
	public void  AddEmployeeManager(int empid, int deptid) {
	
	
	EmployeeManager employeemanager = new EmployeeManager();
	Employee employee = dlp.getEmployee(empid);
	Departments department = dlp.getDepartments(deptid);
	employeemanager.setEmployee(employee);
	employeemanager.setDepartment(department);
	employeemanager.setEmployeeManagerStartDate(new DateTime(date.getTime()));
	dlp.saveOrUpdate(employeemanager);

	
	
	}
	
	@Transactional
	public void  updateEmployeeManager(int employeemanagerid, int empid) {

	
	
	EmployeeManager oldemployeemanager = dlp.getEmployeeManager(employeemanagerid);
	Departments dep = oldemployeemanager.getDepartment();
	int deptid = dep.getId();
	oldemployeemanager.setEmployeeManagerEndDate((new DateTime(date.getTime())));
	dlp.saveOrUpdate(oldemployeemanager);
	
	
		
	EmployeeManager employeemanager = new EmployeeManager();
	Employee employee = dlp.getEmployee(empid);
	Departments department = dlp.getDepartments(deptid);
	employeemanager.setEmployee(employee);
	employeemanager.setDepartment(department);
	employeemanager.setEmployeeManagerStartDate(new DateTime(date.getTime()));
	dlp.saveOrUpdate(employeemanager);

		
	}
	
	@Transactional
	public void  removeEmployeeManager(int employeemanagerid) {
	
	EmployeeManager employeemanager = dlp.getEmployeeManager(employeemanagerid);
	employeemanager.setEmployeeManagerEndDate((new DateTime(date.getTime())));
	dlp.saveOrUpdate(employeemanager);
	
		
	}
	
	
}
	
	

