package chris.lats.com.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.chris.LocationAwareTimesheet.model.Client;
import com.chris.LocationAwareTimesheet.model.ClientDetails;
import com.chris.LocationAwareTimesheet.model.Locality;

import chris.lats.com.dto.ClientDetailsDTO;
import chris.lats.com.services.ClientDetailsService;
import chris.lats.com.services.ClientService;
import chris.lats.com.services.LocalityService;



@Controller
@RequestMapping("client")
public class ClientController {
	
	@Autowired
	LocalityService localityService;
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	ClientDetailsService clientdetailsService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
	
		
		return "home";
		}
	
	
	
	@RequestMapping(value = "/addClient", method = RequestMethod.GET)
	public String getAddClient(Model model) {
	
		model.addAttribute("localitylist", localityService.getAll());
		model.addAttribute("addclient", new Client());
		return "client/addClient";
		}

	  	    	
	   @RequestMapping(value = "/addClient", method = RequestMethod.POST)
	  public String postAddEmployee(@RequestParam(value="clientName", required=true) String clientName,
			  					 @RequestParam(value="clientVat", required=true) String clientVat,
			  					 @RequestParam(value="clientPhone", required=true) String clientPhone,
			  					 @RequestParam(value="clientWebsite", required=true) String clientWebsite,
			  					 @RequestParam(value="clientAddress1") String clientAddress1,
			  					 @RequestParam(value="clientAddress2") String clientAddress2,
			  					 @RequestParam(value="contactName") String contactName,
			  					 @RequestParam(value="contactSurname") String contactSurname,
			  					 @RequestParam(value="contactDescription") String contactDescription,
			  					 @RequestParam(value="contactPhone") String contactPhone,
			  					 @RequestParam(value="contactEmail") String contactEmail,
			  					 @RequestParam(value="localityid") Integer localityid)
			  					 
			  					
			  					  {
			
		 
		   clientService.addClient(clientName, clientVat, clientWebsite, clientPhone, clientAddress1, clientAddress2, localityid, contactName, contactSurname, contactDescription, contactPhone, contactEmail);
		
		   return "redirect:listClients";
		  
	}
	   
	   
	   @RequestMapping(value = "/listClients", method = RequestMethod.GET)
		public String listClients(Model model) {
		
			
			model.addAttribute("clientslist", clientService.getAll());
			return "client/listClients";
			} 
	   
	   
	   
	   @RequestMapping(value = "/editClient", method = RequestMethod.GET)
		public String getEditClient(@RequestParam (value="clientid", required=true) int clientid, Model model) {
		
			
			model.addAttribute("editclient", clientService.get(clientid));
			return "client/editClient";
			}

		  	    	
		   @RequestMapping(value = "/editClient", method = RequestMethod.POST)
		  public String postEditEmployee(@RequestParam(value="clientid", required=true) int clientid,
				  						@RequestParam(value="clientName", required=true) String clientName,
				  						@RequestParam(value="clientVat", required=true) String clientVat,
				  						@RequestParam(value="clientPhone", required=true) String clientPhone,
				  						@RequestParam(value="clientWebsite", required=true) String clientWebsite)
				  					  {
				
			 
			   clientService.editClient(clientid, clientName, clientVat, clientPhone, clientWebsite);
			   return "redirect:listClients";
			  
		}
		   
		
		  
		   @RequestMapping(value = "/onHoldClient", method = RequestMethod.GET)
			public String onholdClient(@RequestParam(value="clientid", required=true) int clientid) {
							
				 clientService.onholdClient(clientid);
			
				 return "redirect:listClients";
				} 
		   
		   @RequestMapping(value = "/activateClient", method = RequestMethod.GET)
			public String activateClient(@RequestParam(value="clientid", required=true) int clientid) {
							
				 clientService.enableClient(clientid);
			
				 return "redirect:listClients";
				}
		   
		   @RequestMapping(value = "/addClientDetails", method = RequestMethod.GET)
			public String getAddClientDetails(@RequestParam(value="clientid", required=true) String clientid, Model model) {
			   
			    model.addAttribute("clientid", clientid);
				model.addAttribute("localitylist", localityService.getAll());
				model.addAttribute("addclientdetails", new ClientDetails());
				return "client/addClientDetails";
				}

		   
			   @RequestMapping(value = "/addClientDetails", method = RequestMethod.POST)
			  public String postAddClientDetails(@RequestParam(value="clientid", required=true) int clientid,
					  					 @RequestParam(value="contactName") String contactName,
					  					 @RequestParam(value="contactSurname") String contactSurname,
					  					 @RequestParam(value="contactDescription") String contactDescription,
					  					 @RequestParam(value="contactAddress1") String contactAddress1,
					  					 @RequestParam(value="contactAddress2") String contactAddress2,
					  					 @RequestParam(value="contactPhone") String contactPhone,
					  					 @RequestParam(value="contactEmail") String contactEmail,
					  					 @RequestParam(value="localityid") Integer localityid)
					  					  {
			  						  
					  						  
					
				  
				   clientdetailsService.addClientDetails(clientid, contactAddress1, contactAddress2, localityid, contactName, contactSurname, contactDescription, contactPhone, contactEmail);
				   
				   return "redirect:listClientDetails?clientid="+clientid;
				  
			}
			   
			   @RequestMapping(value = "/listClientDetails", method = RequestMethod.GET)
				public String listClientsDetails(@RequestParam(value="clientid", required=true) int clientid, Model model) {
				
				 
				   List<ClientDetails> clientdetails = clientdetailsService.getAll(clientid);
				   List<ClientDetailsDTO> clientdetailsDTO = new ArrayList<ClientDetailsDTO>();
				   for(ClientDetails clientdetail : clientdetails){
					   ClientDetailsDTO dto = new ClientDetailsDTO();
					   dto.setId(clientdetail.getId());
					   dto.setClientDetailsContactName(clientdetail.getClientDetailsContactName());
					   dto.setClientDetailsContactSurname(clientdetail.getClientDetailsContactSurname());
					   dto.setClientDetailsContactDescription(clientdetail.getClientDetailsContactDescription());
					   dto.setClientDetailsAddress1(clientdetail.getClientDetailsAddress1());
					   dto.setClientDetailsAddress2(clientdetail.getClientDetailsAddress2());
					   dto.setClientDetailsContactPhone(clientdetail.getClientDetailsContactPhone());
					   dto.setClientDetailsContactEmail(clientdetail.getClientDetailsContactEmail());
					   Locality locality = clientdetail.getLocality();
					   dto.setLocality(localityService.getId(locality.getId()));
					   clientdetailsDTO.add(dto);
					   
				   }
				   
				   
				   
					model.addAttribute("clientid", clientid);
					model.addAttribute("clientdetailsslist", clientdetailsDTO);
					return "client/listClientDetails";
					} 
			   
			   
			   
			   @RequestMapping(value = "/editClientDetails", method = RequestMethod.GET)
				public String getEditClientDetails(@RequestParam(value="clientdetailsid", required=true) int clientdetailsid, Model model) {
				   
				   ClientDetails clientdetails = clientdetailsService.get(clientdetailsid);
				   Locality locality = clientdetails.getLocality();
				   
				    model.addAttribute("locality", localityService.getId(locality.getId()));
				  	model.addAttribute("localitylist", localityService.getAll());
					model.addAttribute("editclientdetails", clientdetails);
					return "client/editClientDetails";
					}

			   
				   @RequestMapping(value = "/editClientDetails", method = RequestMethod.POST)
				  public String postEditClientDetails(@RequestParam(value="clientdetailsid", required=true) int clientdetailsid,
						  					 @RequestParam(value="contactName") String contactName,
						  					 @RequestParam(value="contactSurname") String contactSurname,
						  					 @RequestParam(value="contactDescription") String contactDescription,
						  					 @RequestParam(value="contactAddress1") String contactAddress1,
						  					 @RequestParam(value="contactAddress2") String contactAddress2,
						  					 @RequestParam(value="contactPhone") String contactPhone,
						  					 @RequestParam(value="contactEmail") String contactEmail,
						  					 @RequestParam(value="localityid") Integer localityid)
						  					  {
				  						  
						  						  
					
					  int clientid =  clientdetailsService.editClientDetails(clientdetailsid, contactAddress1, contactAddress2, localityid, contactName, contactSurname, contactDescription, contactPhone, contactEmail);
					   
					   return "redirect:listClientDetails?clientid="+clientid;
						  					  }
				   
				   
				   @RequestMapping(value = "/removeClientDetails", method = RequestMethod.GET)
					public String removeClientsDetails(@RequestParam(value="clientdetailsid", required=true) int clientdetailsid, Model model) {
					   
					 ClientDetails clientdetails =  clientdetailsService.get(clientdetailsid);
					 Client client = clientdetails.getClient();
					 clientdetailsService.removeClientDetails(clientdetailsid);
					
					 
						return "redirect:listClientDetails?clientid="+ client.getId();
						} 
		   
}
