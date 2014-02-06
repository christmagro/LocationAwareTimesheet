package chris.lats.com.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.LocalityService;

import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Locality;






/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping("employee")
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	LocalityService localityService;
	
	
	@RequestMapping(value = "/addemployee", method = RequestMethod.GET)
	public String getaddemployee(Model model) {
		//LocalityService localityService = new LocalityService();
		
		
		model.addAttribute("addEmployee", new Employee());		    	    	 			    
		List<Locality> elocality = localityService.getAll();
		model.addAttribute("elocality", elocality);
		
	    	return "employee/addEmployee";
		}

	  	    	
	   @RequestMapping(value = "/addemployee", method = RequestMethod.POST)
	  public String addemployee(@RequestParam(value="employeeName", required=true) String empolyeeName,
			  					 @RequestParam(value="employeeSurname", required=true) String empolyeeSurname,
			  					 @RequestParam("employeeDob") String employeeDob, 
			  					 @RequestParam(value="employeeGender", required=true) String employeeGender, 
			  					 @RequestParam(value="employeePhone", required=true) String employeePhone, 
			  					 @RequestParam("employeeStartDate") String employeeStartDate,
			  					 @RequestParam(value="employeeLocality", required=true) int localityId)
			  					
			  					  {
			
		   employeeService.add(empolyeeName, empolyeeSurname, employeeDob, employeePhone, employeeGender, employeeStartDate, employeeStartDate, employeeStartDate, localityId);
		   //employeeService.add();   	 
	
		
		
		   return "home";
	}
	   
	   
	   
	   @RequestMapping(value = "/test", method = RequestMethod.GET)
		public String test(Locale locale, Model model) {
		
		   String name = employeeService.gettest(25);   	    	 			    
		   model.addAttribute("name", name);	
			System.out.println(name);
		    	return "home";
			}
	
}
