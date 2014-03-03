package chris.lats.com.services;

import java.util.List;

import org.hibernate.Query;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.service.data.DataLayerLatsdbImpl;
@Component
public class ClientDetailsService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	java.util.Date date= new java.util.Date();
	
	@Transactional
	public ClientDetails get(int id) {
		
		ClientDetails clientdetails = dlp.getClientDetails(id);

		return clientdetails;
	}
	
	@Transactional
	public List<ClientDetails> getAll(int clientid) {
		Query query = dlp.createQuery("From ClientDetails cd where cd.clientDetailsEnddate is null and cd.client='"+ clientid +"'");
		
		return query.list();
	}
	
	@Transactional
	public void addClientDetails(int clientid, String clientAddress1,
			String clientAddress2, int localityid, String contactName,
			String contactSurname, String contactDescription, String contactPhone, String contactEmail) {
		
		Client client = dlp.getClient(clientid);
		
		ClientDetails clientdetails = new ClientDetails();
		clientdetails.setClient(client);
		clientdetails.setClientDetailsAddress1(clientAddress1);
		clientdetails.setClientDetailsAddress2(clientAddress2);
		clientdetails.setLocality(dlp.getLocality(localityid));
		clientdetails.setClientDetailsContactName(contactName);
		clientdetails.setClientDetailsContactSurname(contactSurname);
		clientdetails.setClientDetailsContactDescription(contactDescription);
		clientdetails.setClientDetailsContactPhone(contactPhone);
		clientdetails.setClientDetailsContactEmail(contactEmail);
		clientdetails.setClientDetailsStartdate((new DateTime(date.getTime())));
		dlp.saveOrUpdate(clientdetails);
		
		
	}
	
	@Transactional
	public int editClientDetails(int clientdetailsid, String clientAddress1,
			String clientAddress2, int localityid, String contactName,
			String contactSurname, String contactDescription, String contactPhone, String contactEmail) {
		
		ClientDetails clientdetails = dlp.getClientDetails(clientdetailsid);
		clientdetails.setClientDetailsAddress1(clientAddress1);
		clientdetails.setClientDetailsAddress2(clientAddress2);
		clientdetails.setLocality(dlp.getLocality(localityid));
		clientdetails.setClientDetailsContactName(contactName);
		clientdetails.setClientDetailsContactSurname(contactSurname);
		clientdetails.setClientDetailsContactDescription(contactDescription);
		clientdetails.setClientDetailsContactPhone(contactPhone);
		clientdetails.setClientDetailsContactEmail(contactEmail);
		dlp.saveOrUpdate(clientdetails);
		Client client = clientdetails.getClient();
		return client.getId();
	
	}
	
	
	@Transactional
	public int removeClientDetails(int clientdetailsid) {
		
		ClientDetails clientdetails = dlp.getClientDetails(clientdetailsid);
		clientdetails.setClientDetailsEnddate((new DateTime(date.getTime())));
		dlp.saveOrUpdate(clientdetails);
		Client client = clientdetails.getClient();
		return client.getId();
	
	}


	



}
