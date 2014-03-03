package chris.lats.com.dto;
import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.Locality;

public class ClientDetailsDTO {
	
	private Client client;
	private String clientDetailsAddress1;
	private String clientDetailsAddress2;
	private String clientDetailsContactDescription;
	private String clientDetailsContactEmail;
	private String clientDetailsContactName;
	private String clientDetailsContactPhone;
	private String clientDetailsContactSurname;
	private Integer id;
	private Locality locality;
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public String getClientDetailsAddress1() {
		return clientDetailsAddress1;
	}
	public void setClientDetailsAddress1(String clientDetailsAddress1) {
		this.clientDetailsAddress1 = clientDetailsAddress1;
	}
	public String getClientDetailsAddress2() {
		return clientDetailsAddress2;
	}
	public void setClientDetailsAddress2(String clientDetailsAddress2) {
		this.clientDetailsAddress2 = clientDetailsAddress2;
	}
	public String getClientDetailsContactDescription() {
		return clientDetailsContactDescription;
	}
	public void setClientDetailsContactDescription(
			String clientDetailsContactDescription) {
		this.clientDetailsContactDescription = clientDetailsContactDescription;
	}
	public String getClientDetailsContactEmail() {
		return clientDetailsContactEmail;
	}
	public void setClientDetailsContactEmail(String clientDetailsContactEmail) {
		this.clientDetailsContactEmail = clientDetailsContactEmail;
	}
	public String getClientDetailsContactName() {
		return clientDetailsContactName;
	}
	public void setClientDetailsContactName(String clientDetailsContactName) {
		this.clientDetailsContactName = clientDetailsContactName;
	}
	public String getClientDetailsContactPhone() {
		return clientDetailsContactPhone;
	}
	public void setClientDetailsContactPhone(String clientDetailsContactPhone) {
		this.clientDetailsContactPhone = clientDetailsContactPhone;
	}
	public String getClientDetailsContactSurname() {
		return clientDetailsContactSurname;
	}
	public void setClientDetailsContactSurname(String clientDetailsContactSurname) {
		this.clientDetailsContactSurname = clientDetailsContactSurname;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Locality getLocality() {
		return locality;
	}
	public void setLocality(Locality locality) {
		this.locality = locality;
	}

	
	
}
