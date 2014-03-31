package chris.lats.com.services;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Query;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import chris.lats.com.dto.MailMail;

import com.chris.LocationAwareTimesheet.model.EmpAddress;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeeDepartment;
import com.chris.LocationAwareTimesheet.model.enums.db.EmployeeEmployeeGenderEnum;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;



@Component
public class EmployeeService {

	@Autowired
	DataLayerLatsdbImpl dlp;
	
	@Autowired
	Md5Service md5Service;
	
	@Autowired
	MailMail mailMail;
	
	@Autowired
	EmployeeDepartmentService employeedepartmentService;
		
	@Transactional
	public List<Employee> getAll() {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Employee e where e.employeeEndDate is null");
		// Retrieve all
		return  query.list();
	}
	
	
	@Transactional
	public Employee getEmployee(String username) {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Employee e where  e.employeeUsername = '"+ username +"'");
		Employee employee = (Employee) query.list().get(0);
		
		
		return  employee;
	}
	
	@Transactional
	public List<Employee> getEmployeeList(String username) {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Employee e where  e.employeeUsername = '"+ username +"'");
		
		
		
		return  query.list();
	}
	
	
	@Transactional
	public List<Employee> getEmployeeEmailList(String email) {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Employee e where  e.employeeEmail = '"+ email +"'");
		
		
		
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
	public void add(String ename, String esurname, String edob, String ephone, String egender, String username,  
					String estart, String eaddress1, String eaddress2, Integer localityid, Integer departmentid, String email) 
	{
	 
	Employee employee = new Employee();
	EmpAddress empAddress = new EmpAddress();
	EmployeeDepartment empDepartment = new EmployeeDepartment(); 
	DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
    	
    	String dobConvert = edob;
    	DateTime dob = fmt.parseDateTime(dobConvert);
    	
    	String startConvert = estart;
    	DateTime startDate = fmt.parseDateTime(startConvert);
    	
    	 String genpassword = RandomStringUtils.random(8, 0, 20, true, true, "bj81G5RDED3DC6142kasok".toCharArray());
    	
    	String md5password = Md5Service.hashPassword(genpassword);
    	
    	employee.setEmployeeName(ename);
    	employee.setEmployeeSurname(esurname);
    	employee.setEmployeeDob(dob);
    	employee.setEmployeeGender(EmployeeEmployeeGenderEnum.valueOf(egender));
    	employee.setEmployeePhone(ephone);
    	employee.setEmployeeStartDate(startDate);
    	employee.setEmployeeUsername(username);
    	employee.setEmployeePassword(md5password);
    	employee.setEmployeeEmail(email);
    			
		// Save
		dlp.saveOrUpdate(employee);
		
		
		empAddress.setEmployee(employee);
		empAddress.setEmpAddress1(eaddress1);
		empAddress.setEmpAddress2(eaddress2);
		empAddress.setLocality(dlp.getLocality(localityid));
		
		dlp.saveOrUpdate(empAddress);
		
		empDepartment.setEmployee(employee);
		empDepartment.setEmployeeDepartmentStartDate(startDate);
		empDepartment.setDepartment(dlp.getDepartments(departmentid));
		
		dlp.saveOrUpdate(empDepartment);
		
		mailMail.sendMail("Loation Aware Timesheet System<locationawaretimesheetsystem@gmail.com>",
	    		   employee.getEmployeeName()+" "+employee.getEmployeeSurname()+"<"+employee.getEmployeeEmail()+">",
	    		   "New Account Creation", 
	    		   "Welcome "+ employee.getEmployeeName()+" "+ employee.getEmployeeSurname()+" below please find your personal system credentials"+ "\n"+ 
	    		   "Your userneme is: "+ employee.getEmployeeUsername() +"\n"+ " and your password is "+ genpassword);
	}
	
	/**
	 * Flags an employee as deleted
	 * @param id the id of the existing employee
	 */
	@Transactional
	public void terminate(Integer id) {
		java.util.Date date= new java.util.Date();	
		// Retrieve existing employee
		
		Employee employee = dlp.getEmployee(id);
		employee.setEmployeeEndDate((new DateTime(date.getTime())));
		employee.setEmployeeUsername("deleted");
		EmployeeDepartment employeedepartment = employeedepartmentService.getempldept(employee.getId());
		employeedepartment.setEmployeeDepartmentEndDate((new DateTime(date.getTime())));
		
		dlp.saveOrUpdate(employee);
		
	}
	
		
	
	/**
	 * Edits an existing employee
	 */
	@Transactional
	public void edit(int id, String ename, String esurname, String edob, String ephone, String egender,
						String estart, String email) {
		Employee employee = dlp.getEmployee(id);
				
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
	    	employee.setEmployeeEmail(email);
	    	
	    			
		// Save updates
		dlp.saveOrUpdate(employee);
	}
	
	@Transactional
	public void changePassword(int employeeid, String password) {
		
		Employee employee = dlp.getEmployee(employeeid);
				
		String employeePassword = Md5Service.hashPassword(password);
	    	employee.setEmployeePassword(employeePassword);
	    			
		// Save updates
		dlp.saveOrUpdate(employee);
	}
	


	
	
	

}
