package com.panchaved.web;


import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panchaved.enitity.Doctor;
import com.panchaved.enitity.Patient;
import com.panchaved.service.DoctorService;
import com.panchaved.service.PatientService;
import com.panchaved.util.AppSession;
import com.panchaved.util.CaseTaking;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

	@Autowired
	PatientService	pService;
	@Autowired
	DoctorService dService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String docDashboard(Model model) {
//		model.addAttribute("casetake",new CaseTaking());
		model.addAttribute("patient",new Patient() );
		return "doctorDashboard.jsp";
	}
	
	@RequestMapping(value="/patient/review", method = RequestMethod.GET)
	public @ResponseBody Patient reviewPatient(Model model,@RequestParam("patientId") Integer id)
	{
			Patient patient = pService.getSelectedPatient(id);
			System.out.println("inside review");
			model.addAttribute("patient",patient);
		return patient;
	}
	
	
	@RequestMapping(value = "/patient/update",method = RequestMethod.GET)
	public @ResponseBody ArrayList<Object> loadCase(@RequestParam("patId") Integer patId)
	{	
		ArrayList<Object> casetakings= new ArrayList<Object>();
		Patient patient = pService.getSelectedPatient(patId);
		System.out.println("INSIDE LOADCASE"+patient.toString());
		try
		{
			casetakings = pService.getCaseTaking(patient);
		}catch (Exception e) {
			e.printStackTrace();
		}
	return casetakings;
	}
	
	
	
	@RequestMapping(value="/patient/update/casetaking", method = RequestMethod.POST)
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
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateDoctor(Model model,@ModelAttribute("doc") Doctor doc) {

		if(dService.updateDoc(doc)) {
			model.addAttribute("success_msg","Doctor updated with Id: "+doc.getDoctorID());
		}else {
			model.addAttribute("success_msg","Sorry couldnt Update doctor! Please Retry");
		}
		return "manageMe.jsp";
	}
	

	@RequestMapping(value="/casetakingSummary",method = RequestMethod.POST)
	public String takeCase(Model model,@ModelAttribute("casetake") CaseTaking casetake )
	{
		System.out.println("POST casetaking");
		Patient p = pService.getSelectedPatient(casetake.getPatientID());

		
        //Create .txt to write casetaking
		pService.saveCasetaking(p,casetake);
		
		return "caseTaking.jsp";
	}
	
}	
