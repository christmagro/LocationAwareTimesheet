package chris.lats.com.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.chris.LocationAwareTimesheet.model.Client;

import chris.lats.com.services.ClientService;
import chris.lats.com.services.LocalityService;



@Controller
@RequestMapping("client")
public class ClientController {
	
	@Autowired
	LocalityService localityService;
	
	@Autowired
	ClientService clientService;
	
	
	
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
			  					 @RequestParam(value="contactSurname") String contactDescription,
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
}
