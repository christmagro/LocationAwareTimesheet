package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.chris.LocationAwareTimesheet.model.Locality;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;

@Component
public class LocalityService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	
		
	@Transactional
	public List<Locality> getAll() {
				
		// Create a Hibernate query (HQL)

		Query query = dlp.createQuery("FROM  Locality");
		// Retrieve all
		return  query.list();
	}
	
	
	@Transactional
	public Locality getId(int id) {
				
		// Create a Hibernate query (HQL)
		Locality locality = dlp.getLocality(id);
		// Retrieve all
		return  locality;
	}
	

}
