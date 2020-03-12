package com.panchaved.web;


import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panchaved.service.BillService;
import com.panchaved.service.DoctorService;
import com.panchaved.service.PatientService;
import com.panchaved.util.DateUtils;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.panchaved.entity.*;

@Controller
@RequestMapping("/doctor")
public class DoctorController{

	@Autowired
	PatientService	pService;
	
	@Autowired
	DoctorService dService;
	
	@Autowired
	BillService bService;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody void showList(@RequestParam("l") Map<String,Object> s) {
		System.out.println(s);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String docDashboard(Model model) {
		model.addAttribute("patient",new Patient());
		
		return "doctorDashboard.jsp";
	}
	
	@RequestMapping(value="/patient/review", method = RequestMethod.GET)
	public @ResponseBody Patient reviewPatient(Model model,HttpServletRequest req ,@RequestParam("patientId") Integer id)
	{
			Patient patient = pService.getSelectedPatient(id);
			HttpSession session = req.getSession(false);
			session.setAttribute("PID", id);
			System.out.println("inside review");
			model.addAttribute("patient",patient);
		return patient;
	}
	
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateDoctor(Model model,@ModelAttribute("doc") Doctor doc) {

		if(dService.updateDoc(doc)) {
			model.addAttribute("success_msg","Doctor updated with Id: "+doc.getDoctorID());
		}else {
			model.addAttribute("success_msg","Sorry couldnt Update doctor! Please Retry");
		}
		return "manageMe.jsp";
	}
	
	@RequestMapping(value = "/patient/casetaking",method = RequestMethod.GET)
	public @ResponseBody ArrayList<Object> loadCase(@RequestParam("patId") Integer patId)
	{	
		ArrayList<Object> casetakings= new ArrayList<Object>();
		Patient patient = pService.getSelectedPatient(patId);
		System.out.println("INSIDE LOADCASE"+patient.toString());
		try
		{
			casetakings = (ArrayList<Object>) pService.getCaseTaking(patient);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return casetakings;
	}
	
	@RequestMapping(value="/patient/casetaking", method = RequestMethod.POST)
	public  String updatePatient(Model model,@ModelAttribute("patient") Patient patient) {
		model.addAttribute("casetake",new CaseTaking());
		model.addAttribute("patID",patient.getPatientId());
		if(pService.updatePatient(patient)) {
//			model.addAttribute("success_msg","Patient updated with Id: "+patient.getPatientId());
		}else {
			model.addAttribute("success_msg","Sorry couldnt Update patient! Please Retry");
		}
		return "caseTaking.jsp";
	}
	
	@RequestMapping(value="/update",method = RequestMethod.GET)
	public String updateDoctor(Model model, @RequestParam("doctorId")Long id)
	{
		model.addAttribute("doc",new Doctor());
		model.addAttribute("doctor",dService.getSelectedDoctor(id));
		return "manageMe.jsp";
	}

	@RequestMapping(value="/casetakingSummary",method = RequestMethod.POST)
	public String takeCase(Model model,@ModelAttribute("casetake") CaseTaking casetake ) throws IOException
	{
		System.out.println("POST casetaking");
		model.addAttribute("CPSMap",bService.readCPS());
		Patient p = pService.getSelectedPatient(casetake.getPatientID());
		model.addAttribute("pat",p);
		model.addAttribute("diagnosis",new Prescription());
        
		if(casetake.getOe().equals(""))
		{
			
		}
		else
			//Create .txt to write casetaking
			pService.saveCasetaking(casetake);
			
		return "caseSummary(OPD).jsp";
	}
	
//	@RequestMapping(value="/updatePatientProfile",method = RequestMethod.PUT)
//	public @ResponseBody String updatePatientProfile(@RequestBody Patient patient)
//	{	
//		System.out.println(" PATIENT:"+patient);
//		if(pService.updatePatient(patient)) {
//			return "Success";
//		}
//		return "Fail";
//	
//	}

	
//	@RequestMapping(value = "/bill" , method = RequestMethod.GET)
//	public String showBill( Model model, HttpServletRequest req ) throws IOException {
//		HttpSession session = req.getSession(false);
//		model.addAttribute("pat",pService.getSelectedPatient((int)session.getAttribute("PID")));
//		Map<String, String> map = bService.readCPS();
//		model.addAttribute("CPSMap", map);
//		model.addAttribute("patientBill", new PatientBill());
//		
//		return "billReceipt.jsp";
//	}
	@RequestMapping("/getPrescriptionHistory")
	public @ResponseBody List<Prescription> getPrescriptionHistory(@RequestParam("patientId") int patientId){
		System.out.println("pat::::::"+patientId);
		System.out.println(pService.getPrescriptions(patientId));
		return pService.getPrescriptions(patientId);
	}
	
	@RequestMapping(value = "/savePrescription/{patID}/{selectedTreatements}" , method = RequestMethod.POST)
	public @ResponseBody String treatmentSession(HttpSession session,@PathVariable("patID") int pid,@PathVariable("selectedTreatements") String selectedTreatment, @RequestBody Prescription prescription) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper om = new ObjectMapper();
		Map selectedTreatmentMap = om.readValue(selectedTreatment, Map.class);
		session.setAttribute("selectedTreatmentMap", selectedTreatmentMap);
		
		if(!selectedTreatmentMap.isEmpty()) {
		prescription.setPatientId(pid);
		
		Date date = new Date();
		LocalDate today = DateUtils.asLocalDate(new Date());
		prescription.setPrescriptionDate(date);
		
		prescription.setTreatment(selectedTreatmentMap.keySet().toString());
		
		pService.savePrescription(prescription);
		}
		return "Treatments Set!!";
	}
	
	@RequestMapping(value = "/bill" , method = RequestMethod.POST)
	public String showBill(Model model,@ModelAttribute("pat")Patient p) throws IOException {

		Map<String, String> map = bService.readCPS();
		model.addAttribute("CPSMap", map);
		model.addAttribute("pat",p);
		return "billReceipt.jsp";
	}
	
	@RequestMapping(value="/saveBill",method = RequestMethod.POST)
	public @ResponseBody String saveBill(@RequestBody PatientBill patientBill) {
		patientBill.setDateOfBill(new Date());
		ArrayList<PatientTreatment> arr = (ArrayList<PatientTreatment>) patientBill.getPts();
		arr.forEach((x)->{x.setPb(patientBill);});
		;
		return Integer.toString(bService.saveBill(patientBill).getBillId());
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
		System.out.println(myrequestMap );
		model.addAttribute("cpsStatus","CHANGES SAVED!!!!");
		return "costPerSitting.jsp"; 
	}	
	
	@RequestMapping(value = "/getCPSMap")
	public @ResponseBody Map<String, String> getCPSMap(Model model) throws IOException {
		System.out.println("showing map");
		return bService.readCPS();
	}
	
}	
