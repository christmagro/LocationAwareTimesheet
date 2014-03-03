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
public class ClientService {
	
	@Autowired
	DataLayerLatsdbImpl dlp;
	
	java.util.Date date= new java.util.Date();
	
	@Transactional
	public Client get(int id) {
		
		Client client = dlp.getClient(id);

		return client;
	}
	
	@Transactional
	public List<Client> getAll() {
		Query query = dlp.createQuery("From Client");
		
		return query.list();
	}
	@Transactional
	public List<Client> getAllEnable() {
		Query query = dlp.createQuery("From Client");
		
		return query.list();
	}
	
	@Transactional
	public void addClient(String clientName, String clientVat,
			String clientWebsite, String clientPhone, String clientAddress1,
			String clientAddress2, int localityid, String contactName,
			String contactSurname, String contactDescription, String contactPhone, String contactEmail) {
		
		Client client = new Client();
		client.setClientName(clientName);
		client.setClientVat(clientVat);
		client.setClientPhone(clientPhone);
		client.setClientWebsite(clientWebsite);
		client.setClientOnhold(false);
		client.setClientCreation(new DateTime(date.getTime()));
		dlp.save(client);
		
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
		dlp.saveOrUpdate(clientdetails);
		
		
	}
	
	@Transactional
	public void editClient(int clientid, String clientName, String clientVat, String clientPhone, String clientWebsite) {
		
		Client client = dlp.getClient(clientid);
		client.setClientName(clientName);
		client.setClientVat(clientVat);
		client.setClientPhone(clientPhone);
		client.setClientWebsite(clientWebsite);
		dlp.saveOrUpdate(client);
		
	}


	@Transactional
	public void onholdClient(int clientid) {
		Client client = dlp.getClient(clientid);
		client.setClientOnhold(true);
		dlp.saveOrUpdate(client);
		
	}
	
	@Transactional
	public void enableClient(int clientid) {
		Client client = dlp.getClient(clientid);
		client.setClientOnhold(false);
		dlp.saveOrUpdate(client);
		
	}

	



}
