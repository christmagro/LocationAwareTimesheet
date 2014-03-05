package chris.lats.com.controllers;

import java.security.Principal;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chris.LocationAwareTimesheet.model.Employee;

@Controller
@RequestMapping("security")
public class SecurityController {

 	
	//logout page
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		
		return "security/logout";
 
	}
	
	//login page
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String logint(ModelMap model) {
		
		return "security/login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "security/login";
 
	}
	
	
	//Access Denied
	@RequestMapping(value="/denied", method = RequestMethod.GET)
	public String denied(ModelMap model) {
		
		
	
 
		return "security/denied";
 
	}

}
