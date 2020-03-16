package com.panchaved.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.panchaved.entity.Login;
import com.panchaved.service.DoctorService;
import com.panchaved.service.LoginService;
import com.panchaved.util.ForgotPasswordQuery;
import com.panchaved.util.LoginQuery;



@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	DoctorService dService;
	@Autowired
	LoginService lService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String login(HttpServletRequest req) {
		System.out.println("login called!");
		return "login.jsp";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String login(HttpServletRequest req,@RequestParam("userID") long userID,@RequestParam("password")String password,@RequestParam("radiob")String radio , Model model) {
		System.out.println(radio);
		System.out.println(userID);
		System.out.println(password);
		if(LoginQuery.selectQueryLogin(userID,password,radio)) {
			
			HttpSession session = req.getSession();
			session.setAttribute("user", userID);
			session.setAttribute("pass", password);
			model.addAttribute("userID", userID);
			System.out.println("ok!");
			return "redirect:/"+radio;
			
			
		}else {
			model.addAttribute("fail_msg", "INVALID CREDENTIALS / WRONG HANDLER TYPE");
			return "login.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		//HttpSession s = request.getSession(false);
		//if(AppSession.isLoggedIn(request)) {
			session.invalidate();
			return "redirect:/";
		//}
		//return "success.jsp";
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {
		return "forgotPassword.jsp";
	}
	
	@RequestMapping(value = "/forgotPassword" ,method = RequestMethod.POST)
	public @ResponseBody String setPassword(@RequestParam("userID") long userID, @RequestParam("secAnswer") String secAns) {
		
		return ForgotPasswordQuery.forgotpasswordQuery(userID, secAns);
}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String signUp(Model model) {
		model.addAttribute("log",new Login());
		return "register.jsp";
	}
	
	@RequestMapping(value = "/regchk",method= RequestMethod.GET)
	public @ResponseBody String regcheck(@RequestParam("id")long id,Model model){
		
		System.out.println("in reg chk "+id);
		if(LoginQuery.checkNullPassword(id))
		{
			return "You are already registered!!!!\nProceed to Forgot Password.";
		}
		if(LoginQuery.checkID(id))
			return "Please Contact Admin";	
		else
			return "null";
	}
	

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("log") Login log) {
		if(lService.updateLoginStatus(log))
			return "login.jsp";
		else
			return "register.jsp";
	}
	@RequestMapping(value = "/security", method = RequestMethod.POST)
	public @ResponseBody String getSecurityQuestion(@RequestParam long userID) {
		String securityQ = lService.getSecurityQuestion(userID);
		System.out.println("securityQ "+securityQ);
			return securityQ;
	}
}
