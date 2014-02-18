package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class DepartmentService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	
		
	@Transactional
	public List<Departments> getAll() {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Departments");
	
		// Retrieve all
		return  query.list();
	}
	
	
	@Transactional
	public Departments get(int id) {
				
		// Create a Hibernate query (HQL)
		Departments departments = dlp.getDepartments(id);
		
		// Retrieve all
		return  departments;
	}
	

}