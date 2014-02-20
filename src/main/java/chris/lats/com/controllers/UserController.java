package chris.lats.com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chris.lats.com.services.EmployeeService;



@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	EmployeeService employeeService;
	
	
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String getAddUser(Model model) {
	
		model.addAttribute("employeelist", employeeService.getAll());
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
			  					 @RequestParam(value="elocality") Integer localityId,
			  					 @RequestParam(value="edepartment") Integer departmentId)
			  					
			  					  {
			
		  
		   //employeeService.add(empolyeeName, empolyeeSurname, employeeDob, employeePhone, employeeGender, employeeStartDate, employeeaddress1,employeeaddress2, localityId, departmentId);
	 
	
		
		
		   return "redirect:listEmployees";
		  
	}

}
