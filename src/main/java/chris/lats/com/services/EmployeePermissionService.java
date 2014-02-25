package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeePermission;
import com.chris.LocationAwareTimesheet.model.Permission;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class EmployeePermissionService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	
	@Transactional
	public EmployeePermission get(int employeepermissionid){
		
		EmployeePermission employeepermission = dlp.getEmployeePermission(employeepermissionid);
		
		return employeepermission;
		
	}
	
	
	@Transactional
	public List<EmployeePermission> getEmployeePermission(int employeeid){
		
		Query query = dlp.createQuery("From EmployeePermission where employee = '" + employeeid + "'");
		
		return query.list();
		
	}
	
	@Transactional
	public void addEmployeePermission(int employeeid, int permissionid){
		
		EmployeePermission employeepermission = new EmployeePermission();
		Employee employee = dlp.getEmployee(employeeid);
		Permission permission = dlp.getPermission(permissionid);
		employeepermission.setEmployee(employee);
		employeepermission.setPermission(permission);
		dlp.saveOrUpdate(employeepermission);
		
	}
	
	@Transactional
	public int checkEmployeePermission(int employeeid, int permissionid){
		
		Query query = dlp.createQuery("From EmployeePermission as ep where ep.employee = '" + employeeid + "'  and ep.permission = '" + permissionid + "'");	
		
		return query.list().size();
	}
	
	@Transactional
	public void removeEmployeePermission(int employeepermissionid){
		
			EmployeePermission employeepermission = dlp.getEmployeePermission(employeepermissionid);
			dlp.delete(employeepermission);
	
	}
	

	
	
}
