package chris.lats.com.controllers;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("security")
public class SecurityController {

 	
	//logout page
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout() {
		
		return "security/logout";
 
	}
	
	//login page
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String logint() {
		
		return "security/login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "security/login";
 
	}
	
	
	//Access Denied
	@RequestMapping(value="/denied", method = RequestMethod.GET)
	public String denied() {
		
		return "security/denied";
 
	}

}
