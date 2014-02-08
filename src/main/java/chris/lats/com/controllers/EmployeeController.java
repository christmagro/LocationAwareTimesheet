package chris.lats.com.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.LocalityService;

import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.Locality;










/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	LocalityService localityService;
	
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public String getAddEmployee(Model model) {
				
		//Creating new Employee and mapping in the view
		model.addAttribute("addEmployee", new Employee());
		
		//Getting Locality list to generate dropdownlist in the view
		List<Locality> elocality = localityService.getAll();
		model.addAttribute("elocality", elocality);
		return "employee/addEmployee";
		}

	  	    	
	   @RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	  public String postAddEmployee(@RequestParam(value="employeeName", required=true) String empolyeeName,
			  					 @RequestParam(value="employeeSurname", required=true) String empolyeeSurname,
			  					 @RequestParam("employeeDob") String employeeDob, 
			  					 @RequestParam(value="employeeGender", required=true) String employeeGender, 
			  					 @RequestParam(value="employeePhone", required=true) String employeePhone, 
			  					 @RequestParam("employeeStartDate") String employeeStartDate,
			  					 @RequestParam(value="employeeaddress1") String employeeaddress1, 
			  					 @RequestParam(value="employeeaddress2") String employeeaddress2,
			  					@RequestParam(value="locality") Integer localityId)
			  					
			  					  {
			
		  
		   employeeService.add(empolyeeName, empolyeeSurname, employeeDob, employeePhone, employeeGender, employeeStartDate, employeeaddress1,employeeaddress2, localityId);
		   //employeeService.add();   	 
	
		
		
		   return "home";
	}
	   
	 
	   @RequestMapping(value = "/test", method = RequestMethod.GET)
	   public @ResponseBody String get(HttpServletResponse res) {
	  
	       Locality locality = localityService.getId(19);
	       System.out.println(locality);
	     
	  
	       return "home";
	   }
	
}
