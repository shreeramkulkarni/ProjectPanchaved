package com.panchaved.web;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.panchaved.entity.Doctor;
import com.panchaved.entity.Patient;
import com.panchaved.entity.Prescription;
import com.panchaved.service.BillService;
import com.panchaved.service.DoctorService;
import com.panchaved.service.LoginService;
import com.panchaved.service.PatientService;
import com.panchaved.util.PatientQuery;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	PatientService pService;
	@Autowired 
	DoctorService dService;
	@Autowired 
	BillService bService;
	@Autowired
	LoginService lService;
	

	@RequestMapping(method = RequestMethod.GET)
	public String dashboard() {
		//		System.out.println(s.getAttribute("user"));
		//HttpSession session = req.getSession(false);
		//System.out.println("session var:"+session.getAttribute("user"));
		return "adminDashboard.jsp";
	}

	@RequestMapping(value="/ajaxSearchPatient",method = RequestMethod.POST)
	public @ResponseBody ArrayList searchPatient(Model model , @RequestParam String searchText,@RequestParam int page) {
		System.out.println("searching "+searchText+" page="+page);
		return  pService.getSearchRecords(searchText,page);
	}
	
	@RequestMapping(value="/patient",method = RequestMethod.GET)
	public String patient(Model model) {
//		showPatients(model, "1");
		return "table.jsp";
	}
	@RequestMapping(value="/removePatient",method = RequestMethod.GET)
	public @ResponseBody int removePatient(@RequestParam("patientId") int patientId) throws SQLException {
					
			return pService.removePatient(patientId);
	}
	@RequestMapping(value="/removeDoctor",method = RequestMethod.GET)
	public @ResponseBody int removeDoctor(@RequestParam("doctorID") long doctorID) throws SQLException {
		System.out.println(lService.deleteLogin(doctorID));
		return dService.removeDoctor(doctorID);
	}
	@RequestMapping(value="/ajaxPatient", method = RequestMethod.GET)
	public @ResponseBody ArrayList showPatients(Model model,@RequestParam("page") String p) {
		int page = Integer.parseInt(p);
		ArrayList<Patient> patients = pService.getAllRecords(page);
		model.addAttribute("patient", patients);
		
		System.out.println(patients);
		return patients;
	}

	//	@RequestMapping(value="/ajax", method = RequestMethod.GET)
	//	public String ajaxTest(Model model ) {
	//		return "ajaxTest.jsp";
	//		//		model.addAttribute("patient", pService.getAllRecords());
	//	}
	
	@RequestMapping(value="/getPatientCount", method = RequestMethod.GET)
	public @ResponseBody int getPatientCount(Model model) throws SQLException {
		 ResultSet rs = PatientQuery.selectIds();
		 rs.last();
		 int PatientCount = rs.getRow();
		 System.out.println("row count "+PatientCount);
		return PatientCount;
	}
	
	@RequestMapping(value="/patient/new", method = RequestMethod.GET)
	public String showNewPatientForm(Model model, HttpServletRequest req) {
		System.out.println("Get req");
		HttpSession s = req.getSession(false);
		model.addAttribute("user",s.getAttribute("user") );
		model.addAttribute("addpatient",new Patient());
		return "newpatient.jsp";
	}

	@RequestMapping(value="/patient/new", method = RequestMethod.POST)
	public String addPatient(Model model,@RequestParam("patientId") Integer id,@RequestParam("phoneNo") long contact,@RequestParam("remarks") String remarks,@RequestParam("patientName") String name,@RequestParam("dob") Date dob,@RequestParam("bloodgroup") String bloodgrp,@RequestParam("gender") String gender,@RequestParam("address") String address,@RequestParam("district") String district,@RequestParam("state") String state) {
		System.out.println("POST request");
		System.out.println(id+" "+bloodgrp+" "+name+" "+dob+" ");
		if(pService.insertPatient(id, name, gender, contact, bloodgrp, dob, address, district, state, remarks))
			model.addAttribute("success_msg", "New Patient added successfully with ID:"+id);
		else {
			model.addAttribute("success_msg", "Sorry Could Not Add Patient Please Retry");
		}

		return "newpatient.jsp";
	}

	@RequestMapping(value="/patient/update", method = RequestMethod.GET)
	public String showUpdatePatientForm(Model model,@RequestParam("patientId") Integer id) {
		System.out.println("inside update patient method : "+id);
		System.out.println("Done");
		model.addAttribute("patient",pService.getSelectedPatient(id));
		System.out.println(pService.getSelectedPatient(id).getRemarks());
		return "updatePatient.jsp";
	}

	@RequestMapping(value="/patient/update",method = RequestMethod.POST)
	public String updatePatient(Model model,@ModelAttribute("patient") Patient patient) {
		System.out.println("upadating doc!");

		if(pService.updatePatient(patient)) {
			model.addAttribute("success_msg","Patient updated with Id: "+patient.getPatientId());
		}else {
			model.addAttribute("success_msg","Sorry couldn't Update patient! Please Retry");
		}

		return "updatePatient.jsp";
	}

	@RequestMapping(value="/doctor")
	public String doctor(Model model) {
//		showDoctors(model, "1"); 
		return "doctorTable.jsp";
	}

	@RequestMapping(value = "/ajaxDoctor", method = RequestMethod.GET)
	public @ResponseBody ArrayList showDoctors(Model model,@RequestParam("page") String p) {
		System.out.println("inside the showDoctors()");
		int page = Integer.parseInt(p);
//		Gson gson = new Gson();
//		JsonElement element = gson.toJsonTree(, new TypeToken<List<Doctor>>() {}.getType());
//		JsonArray json = element.getAsJsonArray();

		model.addAttribute("doctor", dService.getAllRecords(page));
		return (ArrayList) dService.getAllRecords(page);
	}

	@RequestMapping(value="/doctor/update", method = RequestMethod.GET)
	public String showUpdateForm(Model model,@RequestParam("doctorID") long id) {

		model.addAttribute("doctor",dService.getSelectedDoctor(id));
		model.addAttribute("doc",new Doctor());
		return "updateDoctor.jsp";
	}

	@RequestMapping(value="/doctor/update",method = RequestMethod.POST)
	public String updateDoctor(Model model,@ModelAttribute("doc") Doctor doc) {
		System.out.println("upadating doc!");
		if(dService.updateDoc(doc)) {
			model.addAttribute("success_msg","Doctor updated with Id: "+doc.getDoctorID());
		}else {
			model.addAttribute("success_msg","Sorry couldnt Update doctor! Please Retry");
		}
		return "updateDoctor.jsp";
	}

	@RequestMapping(value="/doctor/new",method = RequestMethod.GET)
	public String showNewDoctorForm(Model model) {
		model.addAttribute("doc",new Doctor());
		return "newDoctor.jsp";
	}

	@RequestMapping(value = "/doctor/new" , method = RequestMethod.POST)
	public String addDoctor(Model model, @ModelAttribute("doc") Doctor doc) {
		System.out.println("adding doc!");
		if(dService.insertDoctor(doc)) {
			model.addAttribute("success_msg", "New Doctor added successfully with ID:"+doc.getDoctorID());
		}else {
			model.addAttribute("success_msg", "Sorry Could Not Add Doctor Please Retry ");
		}
		return "newDoctor.jsp";
	}

	
	@RequestMapping(value = "/bill" , method = RequestMethod.GET)
	public String showSearchBillsAndPrescriptions( ) {
		return "searchBillsAndPrescriptions.jsp";
	}
	
	@RequestMapping(value = "/get/{formType}" , method = RequestMethod.GET)
	public String showSearchBillsAndPrescriptions(Model model,@PathVariable("formType") String formType,@RequestParam("patientId") int patientId) {
		model.addAttribute("pat", pService.getSelectedPatient(patientId));
		System.out.println("type: "+formType);
		if(formType.equals("bill"))
			return "printBill.jsp";
		else if(formType.equals("prescription"))
			return "printPrescription.jsp";
		else 
			return "404.jsp";

	}
	
	@RequestMapping(value = "/bill" , method = RequestMethod.POST)
	public String saveBill( Model model, @ModelAttribute("diagnosis")Prescription prescriptor,@ModelAttribute("pat")Patient p) throws IOException {
		Map<String, String> map = bService.readCPS();
		model.addAttribute("CPSMap", map);
		Patient patient = pService.getSelectedPatient(p.getPatientId());
//		pService.savePrescription(patient, prescriptor);
		model.addAttribute("pat",p);
		return "billReceipt.jsp";
	}
	
	@RequestMapping(value = "/getBillsAndPrescritions")
	public @ResponseBody Map getBillsAndPrescritions(@RequestParam("patientId") int patientId) {
		Map jsonResponseMap = new HashMap();
		jsonResponseMap.put("prescriptions", pService.getPrescriptions(patientId));
		jsonResponseMap.put("bills", bService.getBills(patientId));
		jsonResponseMap.put("patient", pService.getSelectedPatient(patientId));
		
		return jsonResponseMap;
	}
	
	@RequestMapping(value = "/setCost" , method = RequestMethod.GET)
	public String showCPS( HttpServletRequest req,Model model, HttpSession session ) throws IOException {
		model.addAttribute("cpsStatus","");
		return "costPerSitting.jsp";
	}
	
	
	@RequestMapping(value = "/setCost" , method = RequestMethod.POST) //
	public String saveCPS(Model model, @RequestBody Map<String,String> myrequestMap) throws IOException { //
		System.out.println(myrequestMap);
		bService.saveCps(myrequestMap);
		model.addAttribute("cpsStatus","CHANGES SAVED!!!!");
		return "costPerSitting.jsp"; 
	}
	
	@RequestMapping(value = "/getids" , method = RequestMethod.GET)
	public @ResponseBody ArrayList<Integer> loadIds()
	{	
		ArrayList<Integer> ids = new ArrayList<Integer>();
		System.out.println("INSIDE load IDs");
		try
		{
			ids = pService.getIds();
			for (Integer integer : ids) {
				System.out.println(integer);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ids;
	}
}