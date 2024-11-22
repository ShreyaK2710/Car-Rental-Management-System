package com.infosys.carRentalSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.carRentalSystem.bean.Car;
import com.infosys.carRentalSystem.bean.CarVariant;
import com.infosys.carRentalSystem.bean.Customer;
import com.infosys.carRentalSystem.dao.CarDao;
import com.infosys.carRentalSystem.dao.CarUserRepository;
import com.infosys.carRentalSystem.dao.CarVariantDao;
import com.infosys.carRentalSystem.dao.CustomerDao;
import com.infosys.carRentalSystem.exception.CustomerLicenceException;
import com.infosys.carRentalSystem.exception.CustomerStatusException;
import com.infosys.carRentalSystem.service.CarUserService;
import com.infosys.carRentalSystem.service.CustomerService;

@RestController
@ControllerAdvice
public class CarRentController {
	@Autowired
	private CarVariantDao carVariantDao;
	
	@Autowired
	private CarDao carDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private CarUserService service;
	
	@Autowired
	private CarUserRepository repository;
	
	@Autowired
	private CustomerService custService;
	
  @GetMapping("/variantAdd")
  public ModelAndView showVariantEntryPage() {
	  String newId=carVariantDao.generateVariantId();
	  CarVariant variant=new CarVariant(newId);
	  ModelAndView mv=new ModelAndView("variantEntryPage");
	 mv.addObject("variantRecord",variant);
	 return mv;
  }
  @PostMapping("/variantAdd")
  public ModelAndView saveVariant(@ModelAttribute("variantRecord")CarVariant variant) {
	  carVariantDao.save(variant);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/variantReport")
  public ModelAndView showVariantReportPage() {
	  List<CarVariant> variantList=carVariantDao.findAll();
	  ModelAndView mv=new ModelAndView("variantReportPage");
	  mv.addObject("variantList",variantList);
		 return mv;
  }
  @GetMapping("/carAdd")
  public ModelAndView showCarEntryPage() {
	  Car car=new Car();
	  List<String> variantIdList=carVariantDao.getAllVariantIds();
	  ModelAndView mv=new ModelAndView("carEntryPage");
	  mv.addObject("carRecord",car);
	  mv.addObject("variantIdList",variantIdList);
	  return mv;
  }
  @PostMapping("/carAdd")
  public ModelAndView saveCar(@ModelAttribute("carRecord")Car car) {
	  carDao.save(car);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/customerAdd")
  public ModelAndView showCustomerEntryPage() {
	 String username=service.getUserName();
	 String email=service.getEmail();
	 Customer customer=new Customer(username,email);
	  ModelAndView mv=new ModelAndView("customerEntryPage");
	  mv.addObject("customerRecord",customer);
	 
	  return mv;
  }
  @PostMapping("/customerAdd")
  public ModelAndView save(@ModelAttribute("customerRecord")Customer customer) {
	  customerDao.save(customer);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/customerReport")
  public ModelAndView showCustomerReportPage() {
	 List<Customer> customerList=customerDao.findAll();
	  ModelAndView mv=new ModelAndView("customerReportPage");
	  mv.addObject("customerList",customerList);
	 
	  return mv;
  }
  @GetMapping("/singleCustomerReport")
  public ModelAndView showSingleCustomerReportPage() {
	 String username=service.getUserName();
	 Customer customer=customerDao.findById(username);
	  ModelAndView mv=new ModelAndView("singleCustomerReportPage");
	  mv.addObject("customer",customer);
	  return mv;
  }
  @GetMapping("/variantDeletion/{id}")
  public ModelAndView deleteVariant(@PathVariable String id) {
	  carVariantDao.deleteVariantById(id);
	  return new ModelAndView("redirect:/variantReport");
  }
  
  @GetMapping("/customerCarReport")
  public ModelAndView showCustomerCarReportPage() {
	  String username=service.getUserName();
	  boolean status=customerDao.getCustomerStatusByUsername(username);
	  if(!status)
		  throw new CustomerStatusException();
	  String licenceExpiryDate=customerDao.getLicenceExpiryDate(username);
	  if(!custService.validateCustomerLicenceDate(licenceExpiryDate))
		  throw new CustomerLicenceException();
	  List<Car> carList=carDao.getAvailableCars();
	  List <CarVariant> variantList=carVariantDao.findAll();
	  Map<String,CarVariant> variantMap=new HashMap<>();
	  for(CarVariant cv: variantList) {
		  variantMap.put(cv.getVariantId(),cv);
	  }
	  ModelAndView mv=new ModelAndView("carReportPage2");
	  mv.addObject("carList",carList);
	  mv.addObject("variantMap", variantMap);
	  return mv;
  }
  @GetMapping("/carReport")
  public ModelAndView showCarReportPage () {
  List<Car> carList=carDao.findAll();
  List<CarVariant> variantList=carVariantDao.findAll();
  Map<String, CarVariant> variantMap=new HashMap<>();
  for (CarVariant cv:variantList) { 
	  variantMap.put(cv.getVariantId(), cv);
   }
   ModelAndView mv= new ModelAndView("carReportPage1"); 
   mv.addObject("carList", carList);
   mv.addObject("variantMap", variantMap);
   return mv;
  }
  @GetMapping("/carDeletion/{id}")
  public ModelAndView deleteCar (@PathVariable String id) { 
	  carDao.deleteCarById(id); 
	  return new ModelAndView("redirect:/carReport");
  }
  @GetMapping("/carUpdate/{id}")
  public ModelAndView showCarUpdatePage (@PathVariable String id) { 
	  Car car=carDao.findById(id);
	  ModelAndView mv=new ModelAndView("carUpdatePage");
	  mv.addObject("carRecord",car);
	  return mv;
  }
  @PostMapping("/carUpdate")
  public ModelAndView saveCarUpdatePage (@ModelAttribute("carRecord")Car car) { 
	  carDao.save(car);
	  return new ModelAndView("redirect:/carReport");
  }
  @GetMapping("/customerUpdate/{id}")
  public ModelAndView showCustomerUpdatePage (@PathVariable String id) {
  String role=service.getRole();
  String page="";
  if(role.equalsIgnoreCase("Admin"))
  page="customerUpdatePage1";
  else if (role.equalsIgnoreCase("Customer"))
  page="customerUpdatePage2";
  Customer customer=customerDao.findById(id);
  ModelAndView mv= new ModelAndView(page); 
  mv.addObject("customerRecord", customer);
   return mv;
  }
  @PostMapping("/customerUpdate")
  public ModelAndView updateCustomer (@ModelAttribute("customerRecord")Customer customer) { 
	  String role=service.getRole();
	  String page="";
	  if(role.equalsIgnoreCase("Admin"))
		  page="redirect:/customerReport";
	  else if (role.equalsIgnoreCase("Customer"))
		  page="redirect:/singleCustomerReport";
	  customerDao.save(customer);
	  return new ModelAndView(page);
  }
  @GetMapping("/customerDelete/{id}")
  public ModelAndView deleteCustomer (@PathVariable String id) { 
	  customerDao.deleteCustomerById(id); 
	  repository.deleteById(id);
	  return new ModelAndView("redirect:/customerReport");
  }
  
  @ExceptionHandler(CustomerStatusException.class)
  public ModelAndView handleCustomerStatusException(CustomerStatusException exception)
  {
	  String message="Sorry Dear Customer, Need to complete last booking & payment procedures";
	  ModelAndView mv=new ModelAndView("carBookingErrorPage");
	  mv.addObject("errorMessage",message);
	  return mv;
  }
  @ExceptionHandler(CustomerLicenceException.class)
  public ModelAndView handleCustoomerLicenceException(CustomerLicenceException exception)
  {
	  String message="Sorry Dear Customer, Need to renew your Licence";
	  ModelAndView mv=new ModelAndView("carBookingErrorPage");
	  mv.addObject("errorMessage",message);
	  return mv;
  }
}