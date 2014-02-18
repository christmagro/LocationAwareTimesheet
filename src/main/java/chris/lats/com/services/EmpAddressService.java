package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.EmpAddress;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Locality;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class EmpAddressService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	

	@Autowired
	LocalityService localityService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Transactional
	public List<EmpAddress> getAll(){
		Query query = dlp.createQuery("From EmpAddress");
		
		return query.list();
		
	}
	
	@Transactional
	public EmpAddress get( Integer id ) {
		
		// Retrieve existing authority first
		EmpAddress empaddress = dlp.getEmpAddress(id);
		
		return empaddress;
	}
	
	@Transactional
	public List<EmpAddress> getEmpAddress(int employeeid){
		
		Query query = dlp.createQuery("From EmpAddress ea where ea.employee ='" + employeeid + "'");
		
		return query.list();
		
	}
	
	@Transactional
	public void addEmpAddress(int employeeid, String empAddress1, String empAddress2, int localityid){
		Employee employee = dlp.getEmployee(employeeid);
		Locality locality = localityService.getId(localityid);
		
		EmpAddress empaddress = new EmpAddress();
		empaddress.setEmployee(employee);
		empaddress.setEmpAddress1(empAddress1);
		empaddress.setEmpAddress2(empAddress2);
		empaddress.setLocality(locality);
		dlp.saveOrUpdate(empaddress);
		
	}
	
	@Transactional
	public void editEmpAddress(int empaddressid, int employeeid, String empAddress1, String empAddress2, int localityid){
		
		Locality locality = localityService.getId(localityid);
		Employee employee = employeeService.get(employeeid);
		
		EmpAddress empaddress = dlp.getEmpAddress(empaddressid);
		empaddress.setEmployee(employee);
		empaddress.setEmpAddress1(empAddress1);
		empaddress.setEmpAddress2(empAddress2);
		empaddress.setLocality(locality);
		dlp.saveOrUpdate(empaddress);
		
	}
	
	@Transactional
	public void removeEmpAddress(int empaddressid){
		
		
		EmpAddress empaddress = dlp.getEmpAddress(empaddressid);
		
		dlp.delete(empaddress);
		
	}
	

}
