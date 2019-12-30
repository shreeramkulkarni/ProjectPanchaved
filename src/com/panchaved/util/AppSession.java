package com.panchaved.util;

import javax.servlet.http.HttpServletRequest;

public class AppSession {

	
	public static boolean isLoggedIn(HttpServletRequest req) {
//		Enumeration<String> e = req.getSession(false).getAttributeNames();
//		while (e.hasMoreElements()) {
//		      String name = (String) e.nextElement();
//		      System.out.println(name + ": " + req.getSession(false).getAttribute(name));
//		    }
		return req.getSession(false)!=null;
	}
}
