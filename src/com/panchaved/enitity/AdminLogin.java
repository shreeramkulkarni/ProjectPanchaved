package com.panchaved.enitity;

public class AdminLogin {
	private String usernameAdmin;
	private int idAdmin;
	private String emailAdmin;
	private String passwordAdmin;
	private String securityAnswer;
	
	public AdminLogin(String usernameAdmin, int idAdmin, String emailAdmin, String passwordAdmin,
			String securityAnswer) {
		super();
		this.usernameAdmin = usernameAdmin;
		this.idAdmin = idAdmin;
		this.emailAdmin = emailAdmin;
		this.passwordAdmin = passwordAdmin;
		this.securityAnswer = securityAnswer;
	}

	public void setUsernameAdmin(String usernameAdmin) {
		this.usernameAdmin = usernameAdmin;
	}

	public int getIdadmin(){
		return idAdmin;
	}

	public void setIdadmin(int idAdmin){
		this.idAdmin=idAdmin;
	}

	public String getEmailadmin(){
		return emailAdmin;
	}

	public void setEmailadmin(String emailAdmin){
		this.emailAdmin=emailAdmin;
	}

	public String getPasswordadmin(){
		return passwordAdmin;
	}

	public void setPasswordadmin(String passwordAdmin){
		this.passwordAdmin=passwordAdmin;
	}

	public String getSecurityanswer(){
		return securityAnswer;
	}

	public void setSecurityanswer(String securityAnswer){
		this.securityAnswer=securityAnswer;
	}

	public String getUsernameAdmin() {
		return usernameAdmin;
	}

}

