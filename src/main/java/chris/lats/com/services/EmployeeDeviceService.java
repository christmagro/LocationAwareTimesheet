package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeeDevice;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;
@Component
public class EmployeeDeviceService {
	
java.util.Date date= new java.util.Date();
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	
	@Transactional
	public EmployeeDevice get( Integer id ) {
		
		EmployeeDevice employeedevice =  dlp.getEmployeeDevice(id);
		
		
		return employeedevice;
	}
	
	@Transactional
	public List<EmployeeDevice> getAll() {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createQuery("from EmployeeDevice ed where ed.employeeDeviceEndDate is null");

		
		return query.list();

	}
	
	@Transactional
	public void add(int empid, String imei, String model) {
				
	EmployeeDevice employeedevice = new EmployeeDevice();
	Employee emp = dlp.getEmployee(empid);
	employeedevice.setEmployeeDeviceImei(imei);
	employeedevice.setEmployeeDeviceModel(model);
	employeedevice.setEmployee(emp);
	employeedevice.setEmployeeDeviceStartDate((new DateTime(date.getTime())));
	
	dlp.saveOrUpdate(employeedevice);		
		

	}
	
	@Transactional
	public int checkIMEI(String imei) {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createQuery("from EmployeeDevice ed where ed.employeeDeviceEndDate is null and employeeDeviceImei='"+imei+"'");

		
		return query.list().size();

	}
	@Transactional
	public int checkEmployee(int employeeid) {
				
		// Create a Hibernate query (HQL)
				
		Query query = dlp.createQuery("from EmployeeDevice ed where ed.employeeDeviceEndDate is null and employee='"+employeeid+"'");

		
		return query.list().size();

	}
	
	@Transactional
	public void changeDevice(int employeedeviceid, int empid, String imei, String model) {
				
	EmployeeDevice oldemployeedevice = dlp.getEmployeeDevice(employeedeviceid);
	oldemployeedevice.setEmployeeDeviceEndDate((new DateTime(date.getTime())));
	
	dlp.saveOrUpdate(oldemployeedevice);
	
	EmployeeDevice employeedevice = new EmployeeDevice();
	Employee emp = dlp.getEmployee(empid);
	employeedevice.setEmployeeDeviceImei(imei);
	employeedevice.setEmployeeDeviceModel(model);
	employeedevice.setEmployee(emp);
	employeedevice.setEmployeeDeviceStartDate((new DateTime(date.getTime())));
	
	dlp.saveOrUpdate(employeedevice);		
		

	}
	
	
	@Transactional
	public void removedevice(int employeedeviceid) {
				
		EmployeeDevice employeedevice = dlp.getEmployeeDevice(employeedeviceid);
		employeedevice.setEmployeeDeviceEndDate((new DateTime(date.getTime())));
		dlp.saveOrUpdate(employeedevice);
		
	}
		

}
