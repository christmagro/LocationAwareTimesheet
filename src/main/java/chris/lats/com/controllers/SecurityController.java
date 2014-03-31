package chris.lats.com.controllers;



import java.security.Principal;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chris.lats.com.dto.MailMail;
import chris.lats.com.services.EmployeeService;

import com.chris.LocationAwareTimesheet.model.Employee;


@Controller
@RequestMapping("security")
public class SecurityController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	MailMail mailMail;
	

 	
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
	
	
	@RequestMapping(value = "/chgPassword", method = RequestMethod.GET)
	public String getChangeEmployeePassword(Principal principal,Model model) {
	   
	

		model.addAttribute("employee", employeeService.getEmployee(principal.getName()));


		
		
		return "security/changeEmployeePassword";
		}

	  	    	
	   @RequestMapping(value = "/chgPassword", method = RequestMethod.POST)
	   public String postChangeEmployeePassword(@RequestParam(value="employeeid", required=true) int employeeid,
			   								  @RequestParam(value="pwd1", required=true) String password, Model model){
		   
		   employeeService.changePassword(employeeid, password);
		   
		   											  					
		   return "redirect:/employee/listEmployees";
		}
	   
	   
	   @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
		public String getforgotEmployeePassword() {
		   
		
			
			return "security/forgotPassword";
			}

		  	    	
		   @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
		   public String postforgotEmployeePassword(@RequestParam(value="username", required=false) String username, Model model){
			   
			List<Employee> employeelist= employeeService.getEmployeeList(username);
			 
			 if(employeelist.size() == 0){
				 model.addAttribute("error","username does not exist");
				 return "security/forgotPassword";
			 }
			 
			 if(username.isEmpty()){
				 model.addAttribute("error","username cannot be empty");
				 return "security/forgotPassword";
			 }
			 
			
			 	Employee employee = employeeService.getEmployee(username);
			 	
				 String genpassword = RandomStringUtils.random(8, 0, 20, true, true, "bj81G5RDED3DC6142kasok".toCharArray());
				 
				 	employeeService.changePassword(employee.getId(), genpassword);
				 
			        mailMail.sendMail("Loation Aware Timesheet System<locationawaretimesheetsystem@gmail.com>",
			    		   employee.getEmployeeName()+" "+employee.getEmployeeSurname()+"<"+employee.getEmployeeEmail()+">",
			    		   "Password Reset", 
			    		   "Your new password is "+ genpassword);
			 
				 
				 
			   											  					
			   return "redirect:/employee/listEmployees";
			}
		   @RequestMapping(value = "/home", method = RequestMethod.GET)
			public String home(){
			
				return "security/home";
		   }
	   
		  
}
