package com.panchaved.entity;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class Test {

	private static final String PATFILE = System.getenv("PANCH_HOME")+"Patient\\";

	public static void main(String[] args) throws IOException {

		LocalDate ldate = LocalDate.now(); 
		Date date = new Date();
		Calendar c = Calendar.getInstance();
		
		System.out.println("date :"+date+" ");

		//		for (int i = 0; i < listOfFiles.length; i++) {
		//			Path path = listOfFiles[i].toPath();
		//			FileTime creationTime = (FileTime) Files.getAttribute(path, "creationTime");
		//			String dateCreated = df.format(creationTime.toMillis());
		//
		//			if (listOfFiles[i].isFile()) {
		//				System.out.println("File " + listOfFiles[i].getName()+" date "+dateCreated);
		//			} else if (listOfFiles[i].isDirectory()) {
		//				System.out.println("Directory " + listOfFiles[i].getName());
		//			}
		//		}
		//	}
	}
}