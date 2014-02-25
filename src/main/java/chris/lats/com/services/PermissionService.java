package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.Permission;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class PermissionService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	@Transactional
	public List<Permission> getAll(){
		
		Query query = dlp.createQuery("From Permission");
		
		return query.list();
	}
	
	@Transactional
	public Permission get(int permissionid){
		
		Permission permission = dlp.getPermission(permissionid);
		
		return permission;
	}
	
	@Transactional
	public void addPermission(String permissionName){
		Permission permission = new Permission();
		permission.setPermissionName(permissionName);
		permission.setPermissionEnable(true);
		dlp.saveOrUpdate(permission);
	}
	
	@Transactional
	public void editPermission(int permissionId, String permissionName){
		Permission editpermission = dlp.getPermission(permissionId);
		editpermission.setPermissionName(permissionName);
		
		dlp.saveOrUpdate(editpermission);
	}
	
	@Transactional
	public void disablePermission(int permissionId){
		Permission disablepermission = dlp.getPermission(permissionId);
		disablepermission.setPermissionEnable(false);
		
		dlp.saveOrUpdate(disablepermission);
	}
	
	@Transactional
	public void enablePermission(int permissionId){
		Permission enablepermission = dlp.getPermission(permissionId);
		enablepermission.setPermissionEnable(true);
		
		dlp.saveOrUpdate(enablepermission);
	}

}
