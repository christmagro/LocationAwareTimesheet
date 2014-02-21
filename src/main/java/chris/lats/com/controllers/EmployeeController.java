package chris.lats.com.controllers;


import java.util.ArrayList;
import java.util.List;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import chris.lats.com.dto.EmpAddressDTO;
import chris.lats.com.dto.EmployeeDepartmentDTO;
import chris.lats.com.dto.EmployeeDeviceDTO;
import chris.lats.com.dto.EmployeeManagerDTO;
import chris.lats.com.services.DepartmentService;
import chris.lats.com.services.EmpAddressService;
import chris.lats.com.services.EmployeeDepartmentService;
import chris.lats.com.services.EmployeeDeviceService;
import chris.lats.com.services.EmployeeManagerService;
import chris.lats.com.services.EmployeeService;
import chris.lats.com.services.LocalityService;
import chris.lats.com.services.JsonResponse;
import com.chris.LocationAwareTimesheet.model.Departments;
import com.chris.LocationAwareTimesheet.model.EmpAddress;
import com.chris.LocationAwareTimesheet.model.Employee;
import com.chris.LocationAwareTimesheet.model.EmployeeDepartment;
import com.chris.LocationAwareTimesheet.model.EmployeeDevice;
import com.chris.LocationAwareTimesheet.model.EmployeeManager;
import com.chris.LocationAwareTimesheet.model.Locality;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("employee")
public class EmployeeController{
	
	
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	LocalityService localityService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	EmployeeDepartmentService employeedepartmentService;
	
	@Autowired
	EmployeeManagerService employeemanagerService;
	
	@Autowired
	EmpAddressService empaddressService;
	
	@Autowired
	EmployeeDeviceService employeedeviceService;
	

	
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public String getAddEmployee(Model model) {
				
		//Creating new Employee and mapping in the view
		model.addAttribute("addEmployee", new Employee());
		
		//Getting Locality list to generate dropdownlist in the view
		List<Locality> elocality = localityService.getAll();
		List<Departments> edepartment = departmentService.getAll(); 
		model.addAttribute("elocality", elocality);
		model.addAttribute("edepartment", edepartment);
		return "employee/addEmployee";
		}

	  	    	
	   @RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	  public String postAddEmployee(@RequestParam(value="employeeName", required=true) String empolyeeName,
			  					 @RequestParam(value="employeeSurname", required=true) String empolyeeSurname,
			  					 @RequestParam("employeeDob") String employeeDob, 
			  					 @RequestParam(value="employeeGender", required=true) String employeeGender, 
			  					 @RequestParam(value="employeePhone", required=true) String employeePhone, 
			  					 @RequestParam(value="employeeUsername", required=true) String employeeUsername, 
			  					 @RequestParam(value="employeePassword", required=true) String employeePassword,
			  					 @RequestParam(value="employeeEmail", required=true) String employeeEmail,
			  					 @RequestParam("employeeStartDate") String employeeStartDate,
			  					 @RequestParam(value="employeeaddress1") String employeeaddress1, 
			  					 @RequestParam(value="employeeaddress2") String employeeaddress2,
			  					 @RequestParam(value="elocality") Integer localityId,
			  					 @RequestParam(value="edepartment") Integer departmentId)
			  					
			  					  {
			
		  
		   employeeService.add(empolyeeName, empolyeeSurname, employeeDob, employeePhone, employeeGender, employeeUsername, employeePassword, employeeStartDate, employeeaddress1,employeeaddress2, localityId, departmentId, employeeEmail);
	 
		   //don't forget to add username check with ajax and md5 hashing
		
		
		   return "redirect:listEmployees";
		  
	}
	   
	   
	 
	   
	 
	   
	   @RequestMapping(value = "/listEmployees", method = RequestMethod.GET)
	   public String listEmployeess(Model model) {
	  
		   List<EmployeeDepartment> employeedepartments= employeedepartmentService.getAll();
	    	List<EmployeeDepartmentDTO> employeedepartmentDTO =  new ArrayList<EmployeeDepartmentDTO>();
	    	for(EmployeeDepartment employeedepartment : employeedepartments){
	    		EmployeeDepartmentDTO dto = new EmployeeDepartmentDTO();
	    		Employee emp = employeedepartment.getEmployee(); 
	    		Departments dept = employeedepartment.getDepartment();
	    		int empid = emp.getId(); 
	    		int deptid = dept.getId();
	    		dto.setId(employeedepartment.getId());
	    		dto.setEmployee(employeeService.get(empid));
	    		dto.setDepartment(departmentService.get(deptid));

	    		employeedepartmentDTO.add(dto);
	    	}
		   
	     
	      model.addAttribute("employeelist", employeedepartmentDTO);
		
	  
	  	return "employee/listEmployee";
	   }
	   
	   @RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
		public String getEditEmployee(@RequestParam(value="id", required=true) int id, Model model) {
			
		  
		  
		   Employee employee =  employeeService.get(id);
		    //Creating new Employee and mapping in the view
		  
		 
		  
		   
		   DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
	    	String dobString = fmt.print(employee.getEmployeeDob());
	     	String startString = fmt.print(employee.getEmployeeStartDate());
	    	
	    	model.addAttribute("dob", dobString);
	    	model.addAttribute("start", startString);
		   
		   
			model.addAttribute("editEmployee", employee);
			
			//Getting Locality list to generate dropdownlist in the view
			List<Employee> employeelist = employeeService.getAll();
			List<Departments> departmentlist = departmentService.getAll();
			model.addAttribute("employeelist", employeelist);
			model.addAttribute("departmentlist", departmentlist);
			return "employee/editEmployee";
			}

		  	    	
		   @RequestMapping(value = "/editEmployee", method = RequestMethod.POST)
		  public String postEditEmployee(@RequestParam(value="id", required=true) int empolyeeId,
				  					 @RequestParam(value="employeeName", required=true) String empolyeeName,
				  					 @RequestParam(value="employeeSurname", required=true) String empolyeeSurname,
				  					 @RequestParam("employeeDob") String employeeDob, 
				  					 @RequestParam(value="employeeGender", required=true) String employeeGender, 
				  					 @RequestParam(value="employeePhone", required=true) String employeePhone,
				  					@RequestParam(value="employeeEmail", required=true) String employeeEmail, 
				  					 @RequestParam("employeeStartDate") String employeeStartDate)
				  					
				  					  {
				
			  
			   employeeService.edit(empolyeeId,empolyeeName, empolyeeSurname, employeeDob, employeePhone, employeeGender, employeeStartDate, employeeEmail);
		 
		
			
			
			   return "redirect:listEmployees";
		}
		   
		   
		   
		   @RequestMapping(value = "/editEmployeeDepartment", method = RequestMethod.GET)
			public String getEditEmployeeDepartment(@RequestParam(value="id", required=true) int employeeid, Model model) {
				
			  
			  
			   int empid = employeedepartmentService.getempldep(employeeid);
			  
			   EmployeeDepartment employeedepartment = employeedepartmentService.get(empid);
			   Employee employee = employeeService.get(employeedepartment.getEmployee().getId());
			   Departments department = departmentService.get(employeedepartment.getDepartment().getId());
			   List<Departments> departmentList = departmentService.getAll();
			 
		    	model.addAttribute("employee", employee);
		    	model.addAttribute("department", department);
		    	model.addAttribute("employeedepartment", employeedepartment);
		    	model.addAttribute("departmentList", departmentList);
		    
		
		
				
				
				return "employee/editEmployeeDepartment";
				}

			  	    	
			   @RequestMapping(value = "/editEmployeeDepartment", method = RequestMethod.POST)
			  public String postEditEmployeeDepartment(@RequestParam(value="id", required=true) int oldemployeedepartmentId,
					  								   @RequestParam(value="employeeId", required=true) int employeeId,
					  								   @RequestParam(value="departmentList", required=true) int newdepartmentId)
					  					
					  					  {
					
				employeedepartmentService.updateEmployeeDepartment(oldemployeedepartmentId, employeeId, newdepartmentId);
			
				
				
				   return "redirect:listEmployees";
			}
		
			   
			   
			   
			   @RequestMapping(value = "/listDepartments", method = RequestMethod.GET)
			   public String listDepatments(Model model) {
			  
				   List<EmployeeDepartment> employeedepartments= employeedepartmentService.getAll();
			    	List<EmployeeDepartmentDTO> employeedepartmentDTO =  new ArrayList<EmployeeDepartmentDTO>();
			    	for(EmployeeDepartment employeedepartment : employeedepartments){
			    		EmployeeDepartmentDTO dto = new EmployeeDepartmentDTO();
			    		Employee emp = employeedepartment.getEmployee(); 
			    		Departments dept = employeedepartment.getDepartment();
			    		int empid = emp.getId(); 
			    		int deptid = dept.getId();
			    		dto.setId(employeedepartment.getId());
			    		dto.setEmployee(employeeService.get(empid));
			    		dto.setDepartment(departmentService.get(deptid));

			    		employeedepartmentDTO.add(dto);
			    	}
				   
			     
			      model.addAttribute("employeelist", employeedepartmentDTO);
				
			  
			  	return "employee/listEmployee";
			   }
			   
			   
			   
			   @RequestMapping(value = "/listEmployeeManager", method = RequestMethod.GET)
			   public String listEmployeeManager(Model model) {
				   			   					  
			  
				  List<EmployeeManager> employeemanagers = employeemanagerService.getEmployeeManagers();
			    	List<EmployeeManagerDTO> employeemanagerDTO =  new ArrayList<EmployeeManagerDTO>();
			    	for(EmployeeManager employeemanager : employeemanagers){
			    		EmployeeManagerDTO dto = new EmployeeManagerDTO();
			    		Employee emp = employeemanager.getEmployee(); 
			    		Departments dept = employeemanager.getDepartment();
			    		int empid = emp.getId(); 
			    		int deptid = dept.getId();
			    		dto.setId(employeemanager.getId());
			    		dto.setEmployee(employeeService.get(empid));
			    		dto.setDepartment(departmentService.get(deptid));

			    		employeemanagerDTO.add(dto);
			    	}
				   
			     
			      model.addAttribute("employeemanagerlist", employeemanagerDTO);
				
			  
			  	return "employee/listEmployeeManagers";
			   }
			   
			   @RequestMapping(value = "/addEmployeeManager", method = RequestMethod.GET)
			   public String getaddEmployeeManager(Model model) {
				   
				   
				   model.addAttribute("departmentlist", departmentService.getAll());
				   model.addAttribute("employeelist", employeeService.getAll());
				   model.addAttribute("addemployeemanager", new EmployeeManager());
				
				   
				   return "employee/addEmployeeManager";
			   }
			   
		
			   @RequestMapping(value="employee/addEmployeeManager",method=RequestMethod.POST)
				public @ResponseBody JsonResponse postaddEmployeeManager(@RequestParam(value="employeeId", required=true) int employeeId,
						   								  @RequestParam(value="departmentId", required=true) int departmentId){
			
					JsonResponse res = new JsonResponse();
					 int deptresult = employeemanagerService.checkAddDepartmentManager(departmentId);
					 int empresult = employeemanagerService.checkAddEmployeeManager(employeeId);
					 int empdeptresult = employeemanagerService.checkAddEmployeeDepartment(employeeId, departmentId);
					  if(deptresult > 0){
						res.setStatus("FAIL");
						res.setResult("Department already have a Manager");						 
					  }
					  
					 
					  else if(empresult > 0){
						  res.setStatus("FAIL");
						  res.setResult("Manager is already allocated to a department");	
					  }
					  
					  else if(empdeptresult != 1){
						  res.setStatus("FAIL");
						  res.setResult("Selected employee is not yet a member of the selected department");	
					  }
					  
					
					else{
						res.setStatus("SUCCESS");
						res.setResult("All ok");
						employeemanagerService.AddEmployeeManager(employeeId, departmentId);
					}
				   
		  
		
					return res;
				}
			   
			   
			   @RequestMapping(value = "/editEmployeeManager", method = RequestMethod.GET)
			   public String geteditEmployeeManager(@RequestParam(value="employeemanagerid", required=true) int employeemanagerid,Model model) {
				   
				   EmployeeManager employeemanager = employeemanagerService.get(employeemanagerid);
				   Employee employee = employeemanager.getEmployee();
				   int empid = employee.getId();
				   Employee emp = employeeService.get(empid);
				   
				   Departments department = employeemanager.getDepartment();
				   int depid = department.getId();
				   Departments dept = departmentService.get(depid);
				   
				   model.addAttribute("editemployeemanager", employeemanager);
				   model.addAttribute("employee", emp.getEmployeeName() + " " + emp.getEmployeeSurname());
				   model.addAttribute("department", dept);
				   model.addAttribute("employeelist", employeeService.getAll());
				   
								   
				   return "employee/editEmployeeManager";
			   }
			   
			   
			  @RequestMapping(value = "/editEmployeeManager", method = RequestMethod.POST)
				  public @ResponseBody JsonResponse posteditEmployeeManager(@RequestParam(value="employeemanagerId", required=true) int employeemanagerId,
						  													@RequestParam(value="departmentId", required=true) int departmentId,
						  													@RequestParam(value="employeeId", required=true) int employeeId){
						
			  			JsonResponse res = new JsonResponse();
			  			int empresult = employeemanagerService.checkAddEmployeeManager(employeeId);
			  			int empdeptresult = employeemanagerService.checkAddEmployeeDepartment(employeeId, departmentId);
			  			
	 
			  			if(empresult > 0){
			  			res.setStatus("FAIL");
			  			res.setResult("Manager is already allocated to a department");	
			  			}
			  			
			  			else if(empdeptresult != 1){
							  res.setStatus("FAIL");
							  res.setResult("Selected employee is not yet a member of the selected department");	
						  }
	  
	
						else{
						res.setStatus("SUCCESS");
						res.setResult("All ok");
						employeemanagerService.updateEmployeeManager(employeemanagerId, employeeId);
					}
  


			  			return res;
				}
			  
			  @RequestMapping(value = "/removeEmployeeManager", method = RequestMethod.GET)
			   public String removeEmployeeManager(@RequestParam(value="employeemanagerid", required=true) int employeemanagerid,Model model) {
				   
				   employeemanagerService.removeEmployeeManager(employeemanagerid);
				  
				   
				   				   
								   
				   return "redirect:listEmployeeManager";
			   }
			  
			  @RequestMapping(value = "/listEmpAddresses", method = RequestMethod.GET)
			   public String getEmpAddress(@RequestParam(value="employeeid", required=true) int employeeid,Model model) {
				   
				List<EmpAddress> empaddresslists = empaddressService.getEmpAddress(employeeid);
				List<EmpAddressDTO> empaddressDTO =  new ArrayList<EmpAddressDTO>();
			    	for(EmpAddress empaddresslist : empaddresslists){
			    		EmpAddressDTO dto = new EmpAddressDTO();
			    		Employee emp = empaddresslist.getEmployee(); 
			    		Locality locality = empaddresslist.getLocality();
			    		int empid = emp.getId(); 
			    		int localityid = locality.getId();
			    		dto.setId(empaddresslist.getId());
			    		dto.setEmpAddress1(empaddresslist.getEmpAddress1());
			    		dto.setEmpAddress2(empaddresslist.getEmpAddress2());
			    		dto.setEmployee(employeeService.get(empid));
			    		dto.setLocality(localityService.getId(localityid));

			    		empaddressDTO.add(dto);
			    	}
			    	
				model.addAttribute("employeeid",employeeid);
				model.addAttribute("empaddresslist", empaddressDTO);
				  		   
								   
				   return "employee/listEmpAddress";
			   }
			  
			  
			  @RequestMapping(value = "/addEmpAddress", method = RequestMethod.GET)
				public String getAddEmpAddress(@RequestParam(value="employeeid", required=true) int employeeid, Model model) {
							
					//Creating new Employee and mapping in the view
					model.addAttribute("addEmpAddress", new EmpAddress());
					
					//Getting Locality list to generate dropdownlist in the view
					List<Locality> elocality = localityService.getAll();
					
					model.addAttribute("elocality", elocality);
					model.addAttribute("employeeid", employeeid);
					
					return "employee/addEmpAddress";
					}

				  	    	
				   @RequestMapping(value = "/addEmpAddress", method = RequestMethod.POST)
				  public String postaddEmpAddress(@RequestParam(value="employeeid", required=true) int employeeid,
						  					 @RequestParam(value="empAddress1", required=true) String Address1,
						  					 @RequestParam(value="empAddress2", required=true) String Address2,
						  					 @RequestParam(value="elocality") int localityid)
						  					
						  					  {
						
					  empaddressService.addEmpAddress(employeeid, Address1, Address2, localityid);
				
					
					  return "redirect:listEmpAddresses?employeeid="+ employeeid;
					 
					  
				}
				   
				   
				   @RequestMapping(value = "/removeEmpAddress", method = RequestMethod.GET)
					public String removeEmpAddress(@RequestParam(value="empaddressid", required=true) int empaddressid, Model model) {
								
						EmpAddress empaddress = empaddressService.get(empaddressid);
						Employee employee = empaddress.getEmployee();
						int employeeid = employee.getId();
						
						empaddressService.removeEmpAddress(empaddressid);					
					
						
						return "redirect:listEmpAddresses?employeeid="+ employeeid;
						}  
				   
				   
				   
				   @RequestMapping(value = "/editEmpAddress", method = RequestMethod.GET)
					public String geteditEmpAddress(@RequestParam(value="empaddressid", required=true) int empaddressid, Model model) {
					  EmpAddress editEmpAddress = empaddressService.get(empaddressid);
						//Creating new Employee and mapping in the view
						model.addAttribute("editEmpAddress", editEmpAddress);
						Locality locality = editEmpAddress.getLocality();
						int localityid = locality.getId();
						
						model.addAttribute("locality", localityService.getId(localityid));
						
						Employee employee = editEmpAddress.getEmployee();
						int empid = employee.getId();
						
						model.addAttribute("employee", employeeService.get(empid));
						
						//Getting Locality list to generate dropdownlist in the view
						List<Locality> elocality = localityService.getAll();
						
						model.addAttribute("elocality", elocality);
						
						
						return "employee/editEmpAddress";
						}

					  	    	
					   @RequestMapping(value = "/editEmpAddress", method = RequestMethod.POST)
					  public String posteditEmpAddress(@RequestParam(value="empaddressid", required=true) int empaddressid,
							  					       @RequestParam(value="employeeid", required=true) int employeeid,
							  					       @RequestParam(value="empAddress1", required=true) String address1,
							  					       @RequestParam(value="empAddress2", required=true) String address2,
							  					       @RequestParam(value="elocality") int localityid)
							  					
							  					  {
							
						  empaddressService.editEmpAddress(empaddressid, employeeid, address1, address2, localityid);
					
						
						  return "redirect:listEmpAddresses?employeeid="+ employeeid;
						 
						  
					}
					   
					   
					   @RequestMapping(value = "/listEmployeeDevices", method = RequestMethod.GET)
					   public String listEmployeeDevices(Model model) {
						
						   
						List<EmployeeDevice> employeedevices = employeedeviceService.getAll(); 
						List<EmployeeDeviceDTO> employeedeviceDTO =  new ArrayList<EmployeeDeviceDTO>();
					    	for(EmployeeDevice employeedevice : employeedevices){
					    		EmployeeDeviceDTO dto = new EmployeeDeviceDTO();
					    		Employee emp = employeedevice.getEmployee(); 
					    		dto.setId(employeedevice.getId());
					    		dto.setEmployeeDeviceImei(employeedevice.getEmployeeDeviceImei());
					    		dto.setEmployeeDeviceModel(employeedevice.getEmployeeDeviceModel());
					    		dto.setEmployeeDeviceStartDate(employeedevice.getEmployeeDeviceStartDate());
					    		dto.setEmployeeDeviceEndDate(employeedevice.getEmployeeDeviceEndDate());
					    		dto.setEmployee(employeeService.get(emp.getId()));
					    		

					    		employeedeviceDTO.add(dto);
					    	}
					    	
						
						model.addAttribute("employeedeviceslist", employeedeviceDTO);
						  		   
										   
						   return "employee/listEmployeeDevices";
					   }
					   
					   
					   @RequestMapping(value = "/addEmployeeDevice", method = RequestMethod.GET)
						public String getaddEmployeeDevice(Model model) {
						   
						
				
							model.addAttribute("addemployeedevice", new EmployeeDevice());
							List<Employee> employeelist = employeeService.getAll();
							model.addAttribute("employeelist", employeelist);
					
							
							
							return "employee/addEmployeeDevice";
							}

						  	    	
						   @RequestMapping(value = "/addEmployeeDevice", method = RequestMethod.POST)
						   public @ResponseBody JsonResponse postaddEmployeeDevice(@RequestParam(value="employeeid", required=true) int employeeid,
								   												   @RequestParam(value="imei", required=true) String imei,
								   												   @RequestParam(value="model", required=true) String model)
								  					
								  					  {
								
							   JsonResponse res = new JsonResponse();
								 int empresult = employeedeviceService.checkEmployee(employeeid);
								 int imeiresult = employeedeviceService.checkIMEI(imei);
								  if(imeiresult > 0){
									res.setStatus("FAIL");
									res.setResult("Mobile already active under another user");						 
								  }
								  
								 
								  else if(empresult > 0){
									  res.setStatus("FAIL");
									  res.setResult("Employee already has a phone registered");	
								  }
								  
								
								else{
									res.setStatus("SUCCESS");
									res.setResult("All ok");
									employeedeviceService.add(employeeid, imei, model);
								}
							   
					  
					
								return res;
							}
						   
						   
						   @RequestMapping(value = "/changeEmployeeDevice", method = RequestMethod.GET)
							public String getChangeEmployeeDevice(@RequestParam(value="employeedeviceid", required=true) int employeedeviceid ,Model model) {
							   
							
					
								model.addAttribute("changeemployeedevice", employeedeviceService.get(employeedeviceid));
						
						
								
								
								return "employee/changeEmployeeDevice";
								}

							  	    	
							   @RequestMapping(value = "/changeEmployeeDevice", method = RequestMethod.POST)
							   public @ResponseBody JsonResponse postChangeEmployeeDevice(@RequestParam(value="employeedeviceid", required=true) int employeedeviceid,
									   												   @RequestParam(value="imei", required=true) String imei,
									   												   @RequestParam(value="model", required=true) String model)
									  					
									  					  {
									
								   JsonResponse res = new JsonResponse();
								   EmployeeDevice employeedevice = employeedeviceService.get(employeedeviceid);
								   Employee employee = employeedevice.getEmployee();
								   
									
									 int imeiresult = employeedeviceService.checkIMEI(imei);
									  if(imeiresult > 0){
										res.setStatus("FAIL");
										res.setResult("Mobile already active under another user");						 
									  }
									  
									
									  
									
									else{
										res.setStatus("SUCCESS");
										res.setResult("All ok");
										employeedeviceService.changeDevice(employeedeviceid, employee.getId(), imei, model);
									}
								   
						  
						
									return res;
								}
							   
							   
							   
							   @RequestMapping(value = "/removeEmployeeDevice", method = RequestMethod.GET)
								public String removeEmployeeDevice(@RequestParam(value="employeedeviceid", required=true) int employeedeviceid ,Model model) {
								   
								
						
									employeedeviceService.removedevice(employeedeviceid);
							
							
									
									
									return "redirect:listEmployeeDevices";
									}
						   
				
		
			
}
