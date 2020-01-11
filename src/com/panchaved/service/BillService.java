package com.panchaved.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.panchaved.entity.PatientBill;


@Service
public class BillService {

	Map<String,String> cps;
	
	public BillService() {
		this.cps = new LinkedHashMap();
	}

	public String saveCps(Map cps) {
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(System.getenv("PANCH_HOME")+"acps.ser",false));
			oos.writeObject(cps);
			oos.close();
			return "Saved successfully";
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "Save unsuccessful";
		} catch (IOException e) {
			e.printStackTrace();
			return "Save unsuccessful";
		}
	}
	
	@SuppressWarnings("resource")
	public  Map<String, String> readCPS() throws IOException {
		Map<String, String> cps = null;
		FileInputStream fis =null;
		ObjectInputStream ois = null;
		try {
		fis = new FileInputStream(System.getenv("PANCH_HOME")+"acps.ser");
		} catch (FileNotFoundException e) {
			FileOutputStream fos = new FileOutputStream(System.getenv("PANCH_HOME")+"acps.ser",false);
			fos.close();
			saveCps(new LinkedHashMap());
			fis = new FileInputStream(System.getenv("PANCH_HOME")+"acps.ser");
		}
		ois = new ObjectInputStream(fis);
		try {
			cps = (LinkedHashMap<String, String>)ois.readObject();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fis.close();
		ois.close();
		
		return cps;
	}
	
	public String savePatientBill(PatientBill patientBill) {
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(System.getenv("PANCH_HOME")+"patientBill.ser"));
			oos.writeObject(cps);
			oos.close();
			return "Saved successfully";
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "Save unsuccessful";
		} catch (IOException e) {
			e.printStackTrace();
			return "Save unsuccessful";
		}
	}
	
	@SuppressWarnings("resource")
	public PatientBill readPatientBill() throws IOException {
		PatientBill patientBill = null;
		FileInputStream fis =null;
		ObjectInputStream ois = null;
		try {
		fis = new FileInputStream(System.getenv("PANCH_HOME")+"patientBill.ser");
		} catch (FileNotFoundException e) {
			FileOutputStream fos = new FileOutputStream(System.getenv("PANCH_HOME")+"patientBill.ser",false);
			fos.close();
			saveCps(new LinkedHashMap());
			fis = new FileInputStream(System.getenv("PANCH_HOME")+"patientBill.ser");
		}
		ois = new ObjectInputStream(fis);
		try {
			cps = (LinkedHashMap<String, String>)ois.readObject();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fis.close();
		ois.close();
		
		return patientBill;
	}

}
